---
sidebar_position: 1
---

# Custom installation scripts

You can also add an installation script to your `dotfiles` repository to fully automate the installation and get more features

The installation file can have the following names and locations:

- _install.sh_
- _install_
- _bootstrap.sh_
- _bootstrap_
- _script/bootstrap_
- _setup.sh_
- _setup_
- _script/setup_

If none of these files are found, then any files or folders in your selected dotfiles repository starting with `.` are automatically symlinked to the `$HOME` directory.
