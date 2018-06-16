#!/bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code-insiders

code-insiders --install-extension WallabyJs.quokka-vscode
code-insiders --install-extension formulahendry.auto-rename-tag
code-insiders --install-extension akamud.vscode-javascript-snippet-pack
code-insiders --install-extension christian-kohler.path-intellisense
#code-insiders --install-extension donjayamanne.githistory
#code-insiders --install-extension huizhou.githd
code-insiders --install-extension eamodio.gitlens
code-insiders --install-extension kisstkondoros.typelens
code-insiders --install-extension michelemelluso.code-beautifier
code-insiders --install-extension minhthai.vscode-todo-parser
code-insiders --install-extension mrmlnc.vscode-scss
code-insiders --install-extension pflannery.vscode-versionlens
code-insiders --install-extension qinjia.seti-icons
code-insiders --install-extension maptz.camelcasenavigation
code-insiders --install-extension CoenraadS.bracket-pair-colorizer

# Testing
#code-insiders --install-extension nwhatt.chai-snippets
#code-insiders --install-extension spoonscen.es6-mocha-snippets
code-insiders --install-extension Orta.vscode-jest
code-insiders --install-extension andys8.jest-snippets
code-insiders --install-extension thekarel.open-spec-file

# ES 2015, Babel
#code-insiders --install-extension dzannotti.vscode-babel-coloring
#code-insiders --install-extension dbaeumer.vscode-eslint
#code-insiders --install-extension cmstead.jsrefactor
#code-insiders --install-extension jeremyrajan.react-component

# Typescript
#code-insiders --install-extension rbbit.typescript-hero # Ein Typescript Import Assistant, der alle Imports einer Datei auf einmal auflösen kann
#code-insiders --install-extension pmneo.tsimporter # Ebenfalls ein Typescript Import Assistant, aber der unterstützt die tsconfig.json
code-insiders --install-extension eg2.tslint
code-insiders --install-extension christianoetterli.refactorix
code-insiders --install-extension infeng.vscode-react-typescript

# Angular
#code-insiders --install-extension johnpapa.Angular2
#code-insiders --install-extension Angular.ng-template

# C#
#code-insiders --install-extension ms-vscode.csharp
#code-insiders --install-extension cake-build.cake-vscode

# Docker
code-insiders --install-extension PeterJausovec.vscode-docker

exit

# settings
{
    "window.zoomLevel": 1,
    "editor.fontSize": 14,
    "editor.tabCompletion": true,
    "editor.quickSuggestions": {
        "other": true,
        "comments": true,
        "strings": true
    },
    "git.autofetch": false,
    "workbench.iconTheme": "seti",
    "editor.minimap.enabled": false,
    "files.associations": {
        "*.jsx": "javascriptreact"
    },
    "emmet.showExpandedAbbreviation": "always",
    "openSpecFile.suffixMap": {
        ".js": ".spec.js",
        ".spec.js": ".js",
        ".ts": ".spec.ts",
        ".spec.ts": ".ts"
    },
    "typelens.skiplanguages": [
        "csharp",
        "dockerfile"
    ],
    "npm.enableScriptExplorer": true,
    "npm.exclude": "**/dist",
    "zenMode.centerLayout": false,
    "gitlens.historyExplorer.enabled": true,
    "bracketPairColorizer.consecutivePairColors": [
        "()",
        "[]",
        "{}",
        [
            "Gold",
            "LightSkyBlue",
            "orange"
        ],
        "Red"
    ]
}

# key bindings
[
    {
        "key": "ctrl+backspace",
        "command": "extension.deleteCamelLeftCommand",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+shift+[Period]",
        "command": "tslint.fixAllProblems"
    },
    {
        "key": "ctrl+shift+[Period]",
        "command": "-extension.refactorix.Semicolons.Remove",
        "when": "editorTextFocus"
    }
]
