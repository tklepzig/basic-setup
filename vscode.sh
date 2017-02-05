#!/bin/bash

code --install-extension christian-kohler.path-intellisense
code --install-extension anseki.vscode-color
code --install-extension donjayamanne.githistory
code --install-extension maptz.camelcasenavigation
code --install-extension mrmlnc.vscode-scss
code --install-extension michelemelluso.code-beautifier
code --install-extension ms-vscode.csharp
code --install-extension cake-build.cake-vscode
code --install-extension SirTobi.code-clip-ring
code --install-extension pprice.better-merge
code --install-extension minhthai.vscode-todo-parser
code --install-extension qinjia.seti-icons
code --install-extension johnpapa.Angular2

#Ein Typescript Import Assistant, der alle Imports einer Datei auf einmal auflösen kann
code --install-extension rbbit.typescript-hero
#Ebenfalls ein Typescript Import Assistant, aber der unterstützt die tsconfig.json
code --install-extension pmneo.tsimporter

code --install-extension krizzdewizz.refactorix
code --install-extension dbaeumer.vscode-eslint
code --install-extension akamud.vscode-javascript-snippet-pack

code --install-extension kisstkondoros.typelens
code --install-extension eamodio.gitlens
code --install-extension pflannery.vscode-versionlens

exit

#settings
{
    "window.zoomLevel": 1,
    "editor.fontSize": 14,
    "typescriptHero.restartDebugger.active": false,
    "editor.tabCompletion": true,
    "editor.quickSuggestions": false
}
