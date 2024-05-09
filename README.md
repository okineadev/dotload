<!-- markdownlint-disable no-inline-html first-line-h1 -->

[![GitHub Release Date][github-release-date]][github-release-page]
[![GitHub workflow status][github-workflow-status]][github-workflow-runs]
[![GitHub License][github-license]](LICENSE)
![Made with love][made-with-love]
![GitHub Repo stars][github-stars]

<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/okineadev/dotload">
    <img src="public/banner.png#gh-dark-mode-only" alt="Banner">
    <img src="public/banner-white.png#gh-light-mode-only" alt="Banner">
  </a>

  <h3 align="center">dotload</h3>

  <p align="center">
    <p>
    <b>dotload</b> - This is a <b>simple</b>, <b>intuitive</b> and <b>fast</b>⚡ tool for installing configurations (dotfiles) and other necessary tools on any machine!</p>
    <a href="#%EF%B8%8F-installation"><b>Installation</b></a>
    ·
    <a href="https://github.com/okineadev/dotload/issues/new?labels=bug&template=bug_report.md"><b>Report Bug</b></a>
    ·
    <a href="https://github.com/okineadev/dotload/issues/new?labels=enhancement&template=feature_request.md"><b>Request Feature</b></a>
</div>

<a href="docs/uk_UA/README.md"><img
  height="20"
  src="public/flag-ua.png"
  alt="Ukrainian">
</a>

## ℹ️ About the project

![Screenshot](public/screenshot.png#gh-dark-mode-only)
![Screenshot](public/screenshot-white.png#gh-light-mode-only)


`dotload` works by cloning the specified user's **GitHub** dotfiles repository

This tool was created to make it as **easy as possible** to install dotfiles, required development tools (such as **nodejs**, **php**, **etc**.) and other packages.

### 🤔 How does it work?

This tool makes symbolic links to your dotfiles from `~/.dotload` to `$HOME` directory

It can also make symbolic links to folders (including subfolders) whose name starts with a dot, for example `.configs`

> [!WARNING]
> Dotfiles with identical names will be inevitably overwritten with new ones from your repository!

For example, if you have a file `~/.bashrc` on your computer and in the repository, it will be overwritten with a new one from the repository, before cloning them, make sure that they are yours or you have made a backup of previous configurations

## ⚙️ Installation

You can install `dotload` using the following package managers:

<details>
  <summary><b>apt (PPA)</b></summary>
  <br/>

  You will also receive further updates with this method

  ```bash
  sudo add-apt-repository ppa:salumin/tools
  sudo apt update
  sudo apt install dotload
  ```

</details>

<details>
  <summary><b>With install.sh (Reccomended) ✅</b></summary>
  <br/>

  With this method, you can install dotload on almost **any system**, including Termux

  📥 **Install**:

  ```bash
  curl -sL https://cutt.ly/dotload-install | bash
  ```

  🗑️ **Uninstall**:

  ```bash
  sudo rm $PREFIX/bin/dotload && hash -r
  ```

  > ℹ️ Note: If you want to remove this tool from **Termux**, you need to run the above command without `sudo`

</details>

<details>
  <summary><b>From sources</b></summary>
  <br/>

  With this method, you can easily modify the installation and be sure of security.

  Steps to install from sources:

  1. Clone the repository

  ```bash
  git clone https://github.com/okineadev/dotload.git --depth=1
  ```

  2. Go to the project folder

  ```bash
  cd dotload
  ```

  3. Install the tools

  If you don't have `make' installed, you need to install it:

  ```bash
  sudo apt install make
  ```

  There is also support for [**task**](https://taskfile.dev/).

  📥 **Install**:

  ```bash
  make install
  ```

  > 💡 Tip: If you prefer to use the more modern [**task**](https://taskfile.dev/) instead of [**GNU make**](https://www.gnu.org/software/make/) , you can use this command:

  ```bash
  task install
  ```

  🗑️ **Uninstall**:

  ```bash
  make uninstall
  # Or
  task uninstall
  ```

</details>

Or you can run without installation on **any** OS with this command:

```bash
bash <(curl -sL https://cutt.ly/dotload) @username
```

### Compatibility table

| <div><img src="https://upload.wikimedia.org/wikipedia/commons/f/f1/Icons8_flat_linux.svg" alt="Linux logo" width="30"/></div> **Linux** | <div><img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/Termux.svg" alt="Termux logo" width="30"/></div> **Termux** | <div><img src="public/macos-logo.svg#gh-light-mode-only" alt="macOS logo" width="30"/><img src="public/macos-white-logo.svg#gh-dark-mode-only" alt="macOS logo" width="30"/></div> **macOS** | <div><img src="https://github.com/okineadev/dotload/assets/81070564/99544c04-51e7-41b5-95f7-0828cfc97617" alt="Windows logo" width="30"/></div> **Windows** (on [msys shell](https://www.msys2.org/)) |
| :-: | :-: | :-: | :-: |
| ✅ | ✅ | ✅ | ✅ |

## 🚀 Usage

```bash
dotload @username
dotload @username/repo_name
dotload https://github.com/username/dotfiles.git
```

Where `username` is the **GitHub username** whose dotfiles you want to clone.

`repo_name` - Name of your **dotfiles repository**, if not specified - `dotfiles` name will be used by default

You can also use URLs of repositories such as **GitLab**, **Codeberg**, etc.

> [!WARNING]
> The username cannot contain emojis, spaces or other non-standard characters

### Advanced Usage

```bash
dotload @username branch_name
```

> [!TIP]
> You can also use `-b` or `--branch` flags:

```bash
dotload @<username> [--branch branch_name | -b branch_name]
dotload <repo_url> [--branch branch_name | -b branch_name]
```

Where `branch_name` is the branch of the repository you want to clone. If not specified, the default branch is used. This can be useful if you have multiple machine usage scenarios

---

Use the `--help` flag to get help:

```bash
dotload --help
# Help page...
```

There is also support for `manpages`:

```bash
man dotload
```

### Custom installation scripts

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

### Configuration

You can also **specify a custom installation script**
or make it optional in `dotload.conf`, for this read the [**dotload.conf documentation**](docs/dotload_conf.md)

## 🛣️ Roadmap

- [ ] Add multilingual **README.md** support
  - [x] 🇺🇦 Ukrainian
  - [ ] 🇵🇱 Polish
  - [ ] 🇩🇪 German
- [ ] Write instructions for developers (package assembly)
- [ ] Rewrite the function of creating **deb-packages** to support different versions of [**Ubuntu**](https://ubuntu.com/) - in progress 🚧
- [ ] Add installation options such as **Snap**, **AUR**, **RPM**
  - [x] **Snap**
  - [ ] **AUR**
  - [ ] **RPM**

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

You can start developing on [**GitHub Codespaces**][codespaces-link] right away

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/okineadev/dotload?quickstart=1)

This repository has ⚡[**prebuilds**][about-prebuilds] that allow you to **skip** installing packages and tools.

Or use the usual method on your computer:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please make sure to update tests as appropriate.

Also, please read our [**Code of Conduct**](CODE_OF_CONDUCT.md), and follow it in all your interactions with the project.

## 📝 License

This project is [**MIT**][mit-license-link] licensed.

See [**LICENSE**](LICENSE)

## 📨 Contact

**Telegram:** [**@Okinea**][telegram-link]

## ❤️ Support

This project is completely **free** and **open source**.

If you liked this tool - I would be very grateful if you could support me financially

Here are the details for transfers:

- 🍩 **Donatello**: <https://donatello.to/okineadev>
- 🫙 **Jar for donations**: <https://send.monobank.ua/jar/6rUVs4yasg>
- 💎 **TON wallet**: `UQBaBIBtKJpdwc4jKSGd70LZyQnEf-Nx5edzZlZAAGkHnZ7E`

[github-release-date]: https://img.shields.io/github/release-date/okineadev/dotload
[github-release-page]: https://github.com/okineadev/dotload/releases/latest
[github-workflow-status]: https://github.com/okineadev/dotload/actions/workflows/release.yml/badge.svg
[github-workflow-runs]: https://github.com/okineadev/dotload/actions/workflows/release.yml
[github-license]: https://img.shields.io/github/license/okineadev/dotload
[made-with-love]: https://img.shields.io/badge/made_with-%E2%9D%A4%EF%B8%8F-white
[github-stars]: https://img.shields.io/github/stars/okineadev/dotload
[codespaces-link]: https://github.com/features/codespaces
[about-prebuilds]: https://docs.github.com/en/codespaces/prebuilding-your-codespaces/about-github-codespaces-prebuilds
[telegram-link]: https://t.me/okinea 'Telegram link'
[mit-license-link]: https://opensource.org/license/MIT
