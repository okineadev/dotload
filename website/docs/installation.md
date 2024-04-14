---
sidebar_position: 2
---

# ⚙️ Installation

You can install `dotload` using the following package managers:

<details>
  <summary><b>apt (PPA) (Reccomended) ✅</b></summary>

  ```bash
  sudo add-apt-repository ppa:salumin/tools
  sudo apt update
  sudo apt install dotload
  ```
</details>

<details>
  <summary><b>Snap ⚠️</b></summary>

  ⚠️ **WARNING**: The **snap** version of the package may not work with custom installation scripts

  ```bash
  curl -O https://github.com/okineadev/dotload/releases/download/v1.0.2/dotload_1.0.2_all.snap
  sudo snap install dotload_1.0.2_all.snap --dangerous
  ```
</details>

Or you can run without installation on **any** OS with this command:

```bash
bash <(curl -sL t.ly/dotload) @<username>
```