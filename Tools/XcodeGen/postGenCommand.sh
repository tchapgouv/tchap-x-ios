#!/bin/bash

# This script is invoked by xcodegen for running post commands

# Move file header template in project shared data folder
# Tchap: CI customization
# cp IDETemplateMacros.plist ../../ElementX.xcodeproj/xcshareddata/
cp IDETemplateMacros.plist ../../TchapX.xcodeproj/xcshareddata/
