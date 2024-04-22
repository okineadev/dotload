<!-- markdownlint-disable no-inline-html first-line-h1 -->

![GitHub Release Date][github-release-date]
![GitHub Actions Workflow Status][github-actions-workflow-status]
![GitHub Issues or Pull Requests][github-issues]
![GitHub License][github-license]
![Made with love][made-with-love]
![GitHub Repo stars][github-stars]

<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/okineadev/dotload">
    <img src="public/banner.png" alt="Banner">
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

![Screenshot](public/screenshot.png)

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
  <summary><b>apt (PPA) (Reccomended) ✅</b></summary>
  <br/>

  You will also receive further updates with this method

  ```bash
  sudo add-apt-repository ppa:salumin/tools
  sudo apt update
  sudo apt install dotload
  ```
</details>

<details>
  <summary><b>With install.sh</b></summary>
  <br/>

  With this method, you can install dotload on almost **any system**, including Termux

  📥 **Install**:

  ```bash
  curl -sL https://raw.githubusercontent.com/okineadev/dotload/main/install.sh | bash
  ```

  🗑️ **Uninstall**:

  ```bash
  sudo rm $PREFIX/bin/dotload && hash -r
  ```

  > ℹ️ Note: If you want to remove this tool from **Termux**, you need to run the above command without `sudo`

</details>

<!-- Temporary closed because useless -->
<!-- <details>
  <summary><b>Snap ⚠️</b></summary>
  <br/>

  > ⚠️ **WARNING**: The **snap** version of the package may not work with custom installation scripts

  ```bash
  curl -LO https://github.com/okineadev/dotload/releases/download/v1.1.0/dotload_1.1.0_all.snap
  sudo snap install dotload_1.1.0_all.snap --dangerous
  ```

  This snap pack is for gourmets only :)

  I do not recommend using it

</details> -->

Or you can run without installation on **any** OS with this command:

```bash
bash <(curl -sL https://github.com/okineadev/dotload/releases/latest/download/dotload) @username
```

## 🚀 Usage

```bash
dotload @username
dotload https://github.com/username/dotfiles.git
```

Where `username` is the **GitHub username** whose dotfiles you want to clone.

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
- [ ] Add installation options such as **Snap**, **AUR**, **RPM**
  - [x] **Snap**
  - [ ] **AUR**
  - [ ] **RPM**

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

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

<hr>

<img src="https://img.shields.io/badge/-black?style=for-the-badge&logo=githubcopilot&logoColor=black&label=AI%20Generated&labelColor=white&color=black" style="border-radius:5px;box-shadow:0px 0px 9px black;border:solid 1px black" alt="AI Generated" title="Partially AI generated content">

<sub><i>The code and content were partially generated by AI.</i></sub>

[github-release-date]: https://img.shields.io/github/release-date/okineadev/dotload
[github-actions-workflow-status]: https://img.shields.io/github/actions/workflow/status/okineadev/dotload/release.yml
[github-issues]: https://img.shields.io/github/issues/okineadev/dotload?color=shine-green
[github-license]: https://img.shields.io/github/license/okineadev/dotload
[made-with-love]: https://img.shields.io/badge/made_with-%E2%9D%A4%EF%B8%8F-white
[github-stars]: https://img.shields.io/github/stars/okineadev/dotload
[telegram-link]: https://t.me/okinea 'Telegram link'
[mit-license-link]: https://opensource.org/license/MIT
