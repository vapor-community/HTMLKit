# Use conversion

Converts HTML markup

## Overview

The framework comes with a plugin, wich converts HTML markup into the HTMLKit syntax. It makes the change to the framework way easier and faster.

### Command

Use the following command in your terminal:

```sh
swift package --allow-writing-to-package-directory convert --source-path [source-path] --target-path [target-path] --output-option debug
```

As output option, you can choose between _file_ or _debug_. The option _file_ writes the output at the target path, while the option _debug_ prints it into the terminal.
