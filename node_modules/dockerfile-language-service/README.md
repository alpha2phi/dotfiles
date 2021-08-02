# Dockerfile Language Service

![Node.js Builds](https://github.com/rcjsuen/dockerfile-language-service/workflows/Node.js%20Builds/badge.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/rcjsuen/dockerfile-language-service/badge.svg?branch=master)](https://coveralls.io/github/rcjsuen/dockerfile-language-service?branch=master) [![Build Dependencies](https://david-dm.org/rcjsuen/dockerfile-language-service.svg)](https://david-dm.org/rcjsuen/dockerfile-language-service) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is a language service for Dockerfiles written in TypeScript.
If you are looking for an actual Dockerfile language server that can be used with editors that implement the [language server protocol](http://microsoft.github.com/language-server-protocol), please visit the [rcjsuen/dockerfile-language-server-nodejs repository](https://github.com/rcjsuen/dockerfile-language-server-nodejs).

The purpose of this project is to provide an API for creating a feature-rich Dockerfile editor.
While this language service implements requests from the language server protocol, they are exposed as regular JavaScript functions so you can use them in the browser if you wish.
For a demonstration of this language service's capabilities with Microsoft's [Monaco Editor](https://microsoft.github.io/monaco-editor/), please click [here](https://rcjsuen.github.io/dockerfile-language-service/).

To [install](#installation-instructions) this language service as a dependency into your project, you will need to have [Node.js](https://nodejs.org/en/download/) installed.

**Supported features:**
- code actions
- code completion
- definition
- diagnostics
- document highlight
- document links
- document symbols
- folding
- formatting
- hovers
- rename
- signature help

## Development Instructions

If you wish to build and compile this language server, you must first install [Node.js](https://nodejs.org/en/download/) if you have not already done so.
After you have installed Node.js and cloned the repository with Git, you may now proceed to build and compile the language server with the following commands:

```
npm install
npm run build
npm test
```

If you are planning to change the code, use `npm run watch` to get the TypeScript files transpiled on-the-fly as they are modified.

## Installation Instructions

To add this language service into your project, you must add `dockerfile-language-service` as a dependency in your package.json file.

## Browser Example

The `/example/` folder includes an example for using this language service in a browser as a static HTML page with JavaScript.
To build the example, please run the following commands from the root of the project:

```
npm install
cd example
npm install
npm run build
```

As the example naturally relies on the language service, it is necessary to invoke `npm install` on the root folder first before invoking `npm install` in the `/example/` folder.
Once `npm run build` has completed, you can open the `/example/lib/index.html` in a browser to test things out!
