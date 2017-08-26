#!/bin/bash

code --install-extension akamud.vscode-javascript-snippet-pack
code --install-extension christian-kohler.path-intellisense
code --install-extension cmstead.jsrefactor
code --install-extension dbaeumer.vscode-eslint
#code --install-extension donjayamanne.githistory
code --install-extension dzannotti.vscode-babel-coloring
code --install-extension eamodio.gitlens
code --install-extension jeremyrajan.react-component
code --install-extension kisstkondoros.typelens
code --install-extension michelemelluso.code-beautifier
code --install-extension minhthai.vscode-todo-parser
code --install-extension mrmlnc.vscode-scss
code --install-extension pflannery.vscode-versionlens
code --install-extension qinjia.seti-icons
#code --install-extension maptz.camelcasenavigation

# Testing
code --install-extension nwhatt.chai-snippets
code --install-extension spoonscen.es6-mocha-snippets


# C#
#code --install-extension ms-vscode.csharp
#code --install-extension cake-build.cake-vscode

# Angular
#code --install-extension johnpapa.Angular2
# Ein Typescript Import Assistant, der alle Imports einer Datei auf einmal auflösen kann
#code --install-extension rbbit.typescript-hero
# Ebenfalls ein Typescript Import Assistant, aber der unterstützt die tsconfig.json
#code --install-extension pmneo.tsimporter

exit

#settings
{
    "window.zoomLevel": 1,
    "editor.fontSize": 14,
    "editor.tabCompletion": true,
    "editor.quickSuggestions": false,
    "git.autofetch": false,
    "workbench.iconTheme": "seti",
    "editor.minimap.enabled": false
}
