#!/bin/bash

code-insiders --install-extension akamud.vscode-javascript-snippet-pack
code-insiders --install-extension christian-kohler.path-intellisense
code-insiders --install-extension cmstead.jsrefactor
code-insiders --install-extension dbaeumer.vscode-eslint
#code-insiders --install-extension donjayamanne.githistory
code-insiders --install-extension huizhou.githd
code-insiders --install-extension dzannotti.vscode-babel-coloring
code-insiders --install-extension eamodio.gitlens
code-insiders --install-extension jeremyrajan.react-component
code-insiders --install-extension kisstkondoros.typelens
code-insiders --install-extension michelemelluso.code-beautifier
code-insiders --install-extension minhthai.vscode-todo-parser
code-insiders --install-extension mrmlnc.vscode-scss
code-insiders --install-extension pflannery.vscode-versionlens
code-insiders --install-extension qinjia.seti-icons
code-insiders --install-extension maptz.camelcasenavigation

# Testing
code-insiders --install-extension nwhatt.chai-snippets
code-insiders --install-extension spoonscen.es6-mocha-snippets


# C#
#code-insiders --install-extension ms-vscode.csharp
#code-insiders --install-extension cake-build.cake-vscode

# Angular
#code-insiders --install-extension johnpapa.Angular2
# Ein Typescript Import Assistant, der alle Imports einer Datei auf einmal auflösen kann
#code-insiders --install-extension rbbit.typescript-hero
# Ebenfalls ein Typescript Import Assistant, aber der unterstützt die tsconfig.json
#code-insiders --install-extension pmneo.tsimporter
# Angular Support in HTML files
#code-insiders --install-extension Angular.ng-template
#code-insiders --install-extension eg2.tslint

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
    "emmet.showExpandedAbbreviation": "always"
}

# key bindings
[
    {
        "key": "ctrl+backspace",
        "command": "extension.deleteCamelLeftCommand",
        "when": "editorTextFocus"
    }
]
