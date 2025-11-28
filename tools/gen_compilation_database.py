#!/usr/bin/env python3

# Copyright 2016-2019 Envoy Project Authors
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse
import json
import os
import shlex
import subprocess
from pathlib import Path

# This is copied from https://github.com/envoyproxy/envoy and remove unnecessary code.

# This method is equivalent to https://github.com/grailbio/bazel-compilation-database/blob/master/generate.py
def generate_compilation_database(args):
    # We need to download all remote outputs for generated source code. This option lives here to override those
    # specified in bazelrc.
    bazel_startup_options = shlex.split(os.environ.get("BAZEL_STARTUP_OPTION_LIST", ""))
    bazel_options = shlex.split(os.environ.get("BAZEL_BUILD_OPTION_LIST", "")) + [
        "--remote_download_outputs=all",
    ]

    source_dir_targets = args.bazel_targets

    # Build the list of runtime flags (those accepted by the extractor script)
    runtime_flags = []
    if args.include_external:
        runtime_flags.append("--include_external")
    if args.include_genfiles:
        runtime_flags.append("--include_genfiles")
    if args.include_headers:
        runtime_flags.append("--include_headers")
    if args.include_all:
        runtime_flags.append("--include_all")
    if args.system_clang:
        runtime_flags.append("--system-clang")

    # Invoke the external Hedron extractor directly and forward both runtime
    # flags and any positional Bazel targets to it. The extractor is expected
    # to accept these arguments; this keeps the wrapper simple and makes the
    # user-visible behavior consistent: calling the Python script is equivalent
    # to running the external extractor with the same arguments.
    try:
        subprocess.check_call([
            "bazel", *bazel_startup_options, "run", *bazel_options,
            "@hedron_compile_commands//:refresh_all", "--"
        ] + runtime_flags + source_dir_targets)
    except subprocess.CalledProcessError as e:
        print("ERROR: external Hedron extractor failed to run; please ensure @hedron_compile_commands is available and the provided arguments are valid for the extractor.")
        raise e

    # The extractor writes a single `compile_commands.json` into the workspace
    # root. Prefer that file; fall back to searching the execroot for legacy
    # `*.compile_commands.json` files if the extractor didn't produce one.
    db_entries = []
    # Ensure we always have execroot available for any `__EXEC_ROOT__` markers.
    execroot = subprocess.check_output(
        ["bazel", *bazel_startup_options, "info", *bazel_options, "execution_root"]
    ).decode().strip()

    cc_path = Path("compile_commands.json")
    if cc_path.exists():
        db_entries = json.loads(cc_path.read_text())
    else:
        for db in Path(execroot).glob('**/*.compile_commands.json'):
            db_entries.extend(json.loads(db.read_text()))

    def replace_execroot_marker(db_entry):
        if 'directory' in db_entry and db_entry['directory'] == '__EXEC_ROOT__':
            db_entry['directory'] = execroot
        if 'command' in db_entry:
            db_entry['command'] = (
                db_entry['command'].replace('-isysroot __BAZEL_XCODE_SDKROOT__', ''))
        return db_entry

    return list(map(replace_execroot_marker, db_entries))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate JSON compilation database')
    parser.add_argument('--include_external', action='store_true')
    parser.add_argument('--include_genfiles', action='store_true')
    parser.add_argument('--include_headers', action='store_true')
    parser.add_argument('--include_all', action='store_true')
    parser.add_argument(
        '--system-clang',
        action='store_true',
        help=
        'Use `clang++` instead of the bazel wrapper for commands. This may help if `clangd` cannot find/run the tools.'
    )
    parser.add_argument('bazel_targets', nargs='*', default=[])

    args = parser.parse_args()
    db = generate_compilation_database(args)

    with open("compile_commands.json", "w") as db_file:
        json.dump(db, db_file, indent=2)
