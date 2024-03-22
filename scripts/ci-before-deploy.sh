#!/bin/bash

##
# Copyright 2020 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

set -e
set -x

# Switch to the package root
pushd $(dirname $0)/..

PACKAGE_ROOT=`pwd`
DEPLOY_ROOT=$PACKAGE_ROOT/dist

set -x

# Copy the latest fidelity testing results:
mkdir -p $DEPLOY_ROOT/dist

mv test/results $DEPLOY_ROOT/results
cp test/results-viewer.html $DEPLOY_ROOT/index.html
cp dist/* $DEPLOY_ROOT/dist/

# Add a "VERSION" file containing the last git commit message
git log -n 1 > $DEPLOY_ROOT/VERSION

git status --ignored

popd

set +e
set +x