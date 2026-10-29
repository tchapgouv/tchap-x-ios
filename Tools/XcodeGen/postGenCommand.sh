#!/bin/bash

# This script is invoked by xcodegen for running post commands

# Move file header template in project shared data folder
<<<<<<< HEAD
# Tchap: CI customization
# cp IDETemplateMacros.plist ../../ElementX.xcodeproj/xcshareddata/
cp IDETemplateMacros.plist ../../TchapX.xcodeproj/xcshareddata/
=======
cp IDETemplateMacros.plist ../../ElementX.xcodeproj/xcshareddata/

# Rewrite schemes the way Xcode saves them
swift normalizeSchemes.swift ../../ElementX.xcodeproj/xcshareddata/xcschemes
>>>>>>> release/26.10.8
