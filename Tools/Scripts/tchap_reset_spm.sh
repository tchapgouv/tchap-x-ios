#! /bin/bash

#
# Copyright (c) 2025 DINUM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


function delete_if_exists {
	local target="$1"
	
	if [ -e "$target" ]; then
		echo "Deleting ${target}…"
		rm -rf $target
	fi 
}

# Delete Swift Package Manager caches
delete_if_exists ~/Library//Caches/org.swift.swiftpm
delete_if_exists ~/Library/org.swift.swiftpm 

# Delete TchapX Xcode project (containing SPM data in `TchapX.xcodeproj/project.xcworkspace/xcshareddata/swiftpm`)
delete_if_exists ./TchapX.xcodeproj 

# Delete TchapX project `Package.resolved` if present.
delete_if_exists ./Package.resolved

# Regenerate TchapX Xcode project
echo "Generating TchapX Xcode project…"
xcodegen generate --spec ./project-tchap-x.yml

# Remove ElementX Xcode project
delete_if_exists ./ElementX.xcodeproj