<!-- markdownlint-disable no-inline-html first-line-h1 -->

[![GitHub Release Date][github-release-date]][github-release-page]
[![GitHub workflow status][github-workflow-status]][github-workflow-runs]
[![GitHub License][github-license]](../../LICENSE)
![Made with love][made-with-love]
![GitHub Repo stars][github-stars]

<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/okineadev/dotload">
    <!-- https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#specifying-the-theme-an-image-is-shown-to -->
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="../../public/banner-dark.png" alt="Banner">
      <source media="(prefers-color-scheme: light)" srcset="../../public/banner-light.png" alt="Banner">
      <img src="../../public/banner-dark.png" alt="Banner">
    </picture>
  </a>

  <h3 align="center">dotload</h3>

  <p align="center">
    <p>
    <b>dotload</b> - Jest to <b>proste</b>, <b>intuicyjne</b> i <b>szybkie</b>⚡ narzędzie do instalowania konfiguracji (dotfiles) i innych niezbędnych narzędzi na dowolnej maszynie!
    </p>
    <a href="#%EF%B8%8F-Instalacja"><b>Instalacja</b></a>
    ·
    <a href="https://github.com/okineadev/dotload/issues/new?labels=bug&template=bug_report.md"><b>Zgłoś błąd</b></a>
    ·
    <a href="https://github.com/okineadev/dotload/issues/new?labels=enhancement&template=feature_request.md"><b>Poproś o funkcję</b></a>
</div>

<a href="../../README.md"><img
  height="20"
  src="../../public/flag-us.png"
  alt="English">
</a>
<a href="../uk_UA/README.md"><img
  height="20"
  src="../../public/flag-ua.png"
  alt="Ukrainian">
</a>

## ℹ️ O projekcie

![Screenshot](../../public/screenshot-dark.png#gh-dark-mode-only)
![Screenshot](../../public/screenshot-light.png#gh-light-mode-only)

`dotload` działa poprzez klonowanie repozytorium dotfiles **GitHub** określonego użytkownika

Narzędzie to zostało stworzone, aby **maksymalnie ułatwić** instalację dotfiles, wymaganych narzędzi programistycznych (takich jak **nodejs**, **php**, **etc**.) i innych pakietów.

### 🤔 Jak to działa?

Narzędzie to tworzy dowiązania symboliczne do dotfiles z katalogu `~/.dotload` do katalogu `$HOME`

Może również tworzyć dowiązania symboliczne do folderów (w tym podfolderów), których nazwa zaczyna się od kropki, na przykład `.configs`.

> [!WARNING]
> Dotfiles o identycznych nazwach będą nieuchronnie nadpisywane nowymi plikami z repozytorium!

Na przykład, jeśli masz plik `~/.bashrc` na swoim komputerze i w repozytorium, zostanie on nadpisany nowym z repozytorium, przed ich sklonowaniem upewnij się, że są one twoje lub wykonałeś kopię zapasową poprzednich konfiguracji

## ⚙️ Instalacja

Możesz zainstalować `dotload` używając następujących menedżerów pakietów:

<details>
  <summary><b>apt (PPA)</b></summary>
  <br/>

  Dzięki tej metodzie będziesz również otrzymywać dalsze aktualizacje

  ```bash
  sudo add-apt-repository ppa:salumin/tools
  sudo apt update
  sudo apt install dotload
  ```

</details>

<details>
  <summary><b>Homebrew</b></summary>
  <br/>

  Za pomocą [**brew**](https://brew.sh/) można zainstalować to narzędzie na **macOS** (a także **Linux**)

  > ℹ️ Uwaga: Jeśli nie masz zainstalowanego [**brew**](https://brew.sh/), zainstaluj go **teraz** za pomocą tego polecenia:

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  <hr/>

  📥 **Instalowanie**:

  ```bash
  brew tap okineadev/dotload
  brew install dotload
  ```

</details>

<details>
  <summary><b>Z install.sh (zalecane) ✅</b></summary>
  <br/>

  Dzięki tej metodzie można zainstalować **dotload** na prawie **każdym systemie**, włączając w to **Termux**

  📥 **Instalować**:

  ```bash
  curl -sL https://cutt.ly/dotload-install | bash
  ```

  🗑️ **Deinstalacja**:

  ```bash
  sudo rm $PREFIX/bin/dotload && hash -r
  ```

  > ℹ️ Note: Jeśli chcesz usunąć to narzędzie z **Termux**, musisz uruchomić powyższe polecenie bez `sudo`

</details>

<details>
  <summary><b>Ze źródeł</b></summary>
  <br/>

  Dzięki tej metodzie można łatwo zmodyfikować instalację i mieć pewność bezpieczeństwa.

  Kroki instalacji ze źródeł:

  1. Sklonuj repozytorium

  ``bash
  git clone https://github.com/okineadev/dotload.git --depth=1
  ```

  2. Przejdź do folderu projektu

  ``bash
  cd dotload
  ```

  3. Zainstaluj narzędzia

  Jeśli nie masz zainstalowanego `make', musisz go zainstalować:

  ``bash
  sudo apt install make
  ```

  Istnieje również wsparcie dla [**task**](https://taskfile.dev/).

  📥 **Instalować**:

  ```bash
  make install
  ```

  > 💡 Wskazówka: Jeśli wolisz używać bardziej nowoczesnego [**task**](https://taskfile.dev/) zamiast [**GNU make**](https://www.gnu.org/software/make/) , możesz użyć tego polecenia:

  ```bash
  task install
  ```

  🗑️ **Odinstalowywanie**:

  ```bash
  make uninstall
  # Or
  task uninstall
  ```

</details>

<details>
  <summary><b>Termux</b></summary>
  <br/>

  Dzięki tej metodzie będziesz również otrzymywać dalsze aktualizacje

  ```bash
  # Add Termux User Repository
  pkg install tur-repo
  pkg update && pkg install dotload
  ```

</details>

Można też uruchomić bez instalacji na **każdym** systemie operacyjnym za pomocą tego polecenia:

```bash
bash <(curl -sL https://cutt.ly/dotload) @username
```

### Tabela zgodności

| <div><img src="https://upload.wikimedia.org/wikipedia/commons/f/f1/Icons8_flat_linux.svg" alt="Linux logo" width="30"/></div> **Linux** | <div><img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/Termux.svg" alt="Termux logo" width="30"/></div> **Termux** | <div><img src="../../public/macos-dark-logo.svg#gh-light-mode-only" alt="macOS logo" width="30"/><img src="../../public/macos-light-logo.svg#gh-dark-mode-only" alt="macOS logo" width="30"/></div> **macOS** | <div><img src="https://github.com/okineadev/dotload/assets/81070564/99544c04-51e7-41b5-95f7-0828cfc97617" alt="Windows logo" width="30"/></div> **Windows** (on [msys shell](https://www.msys2.org/)) |
| :-: | :-: | :-: | :-: |
| ✅ | ✅ | ✅ | ✅ |

## 🚀 Użycie

```bash
dotload @username
dotload @username/repo_name
dotload https://github.com/username/dotfiles.git
```

Gdzie `username` to **nazwa użytkownika GitHub**, którego dotfiles chcesz sklonować.

`repo_name` - Nazwa repozytorium **dotfiles**, jeśli nie została określona - domyślnie zostanie użyta nazwa `dotfiles`.

Można również użyć adresów URL repozytoriów takich jak **GitLab**, **Codeberg**, itp.

> [!WARNING]
> Nazwa użytkownika nie może zawierać emotikonów, spacji ani innych niestandardowych znaków.

### Zaawansowane użycie

```bash
dotload @username branch_name
```

> [!TIP]
> Można również użyć flag `-b` lub `--branch`:

```bash
dotload @<nazwa_użytkownika> [--branch branch_name | -b branch_name]
dotload <repo_url> [--branch branch_name | -b branch_name]
```

Gdzie `branch_name` to gałąź repozytorium, którą chcemy sklonować. Jeśli nie zostanie podana, używana jest gałąź domyślna. Może to być przydatne w przypadku scenariuszy korzystania z wielu maszyn

---

Użyj flagi `--help` by uzyskać pomoc:

```bash
dotload --help
# Strona pomocy...
```

Istnieje również wsparcie dla `manpages`:

```bash
man dotload
```

### Niestandardowe skrypty instalacyjne

Można również dodać skrypt instalacyjny do repozytorium `dotfiles`, aby w pełni zautomatyzować instalację i uzyskać więcej funkcji

Plik instalacyjny może mieć następujące nazwy i lokalizacje:

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

Można również **określić niestandardowy skrypt instalacyjny**
lub uczynić go opcjonalnym w pliku `dotload.conf`, w tym celu przeczytaj dokumentację [**dotload.conf**](dotload_conf.md).

## 🛣️ Mapa drogowa

- [ ] Dodanie wielojęzycznej obsługi **README.md**
  - [x] 🇺🇦 Ukraiński
  - [x] 🇵🇱 Polski
  - [ ] 🇩🇪 Niemiecki
- [ ] Napisać instrukcje dla deweloperów (montaż pakietów)
- [ ] Przepisanie funkcji tworzenia **deb-pakietów** w celu wsparcia różnych wersji [**Ubuntu**](https://ubuntu.com/) - w trakcie 🚧
- [ ] Dodanie opcji instalacji takich jak **Snap**, **AUR**, **RPM**.
  - [x] **Snap**
  - [ ] **AUR**
  - [ ] **RPM**

## 🤝 Wkład

Wkład sprawia, że społeczność open-source jest tak niesamowitym miejscem do nauki, inspirowania i tworzenia. Każdy wkład jest **bardzo doceniany**.

Możesz zacząć rozwijać się na [**GitHub Codespaces**][codespaces-link] od razu

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/okineadev/dotload?quickstart=1)

To repozytorium zawiera ⚡[**prebuilds**][about-prebuilds], które pozwalają **pominąć** instalację pakietów i narzędzi.

Lub użyj zwykłej metody na komputerze:

1. Fork projekt
2. Utwórz gałąź Feature (`git checkout -b feature/AmazingFeature`)
3. Zatwierdź zmiany (`git commit -m 'Add some AmazingFeature'`)
4. Push do gałęzi (`git push origin feature/AmazingFeature`)
5. Otwórz Pull Request

Pamiętaj, aby odpowiednio zaktualizować testy.

Prosimy również o zapoznanie się z naszym [**Kodeksem postępowania**](../../CODE_OF_CONDUCT.md) i przestrzeganie go we wszystkich interakcjach z projektem.

## 📝 Licencja

Ten projekt jest objęty licencją [**MIT**][mit-license-link].

Zobacz [**LICENSE**](../../LICENSE)

## 📨 Kontakt

**Telegram:** [**@Okinea**][telegram-link]

## ❤️ Wsparcie

Ten projekt jest całkowicie **darmowy** i **open source**.

Jeśli spodobało Ci się to narzędzie - będę bardzo wdzięczny, jeśli wesprzesz mnie finansowo

Oto szczegóły dotyczące przelewów:

- 🍩 **Donatello**: <https://donatello.to/okineadev>
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
