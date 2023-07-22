# Components plugin

Deploys the components dependencies.

## Overview

The framework comes with a plugin, wich minifies and deploys the dependencies of the components at the target path.

### Command

Use the following command in your terminal to start the deployment.

```sh
swift package --allow-writing-to-package-directory deploy --target-path [target-path]
```

It will create a folder like this. Containing the composed CSS and JavaScript file.

```
htmlkit/
├── all.css
└── all.js
```

Feel free to move the files or copy the content at the place you want it to be.

### Steps

Open the terminal and change the directory (for example to your project folder).

```sh
cd ExampleProject
```

Enter the command and name the target path.

```sh
swift package --allow-writing-to-package-directory deploy --target-path "/ExampleProject/Public"
```
