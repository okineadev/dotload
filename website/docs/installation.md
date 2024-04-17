---
sidebar_position: 2
---

# ⚙️ Installation

You can install `dotload` using the following package managers:

<details>
  <summary><b>apt (PPA) (Reccomended) ✅</b></summary>

  You will also receive further updates with this method

  ```bash
  sudo add-apt-repository ppa:salumin/tools
  sudo apt update
  sudo apt install dotload
  ```
</details>

<details>
  <summary><b>With install.sh</b></summary>

  With this method, you can install dotload on almost **any system**, including Termux

  📥 **Install**:

  ```bash
  curl -sL https://raw.githubusercontent.com/okineadev/dotload/main/install.sh | bash
  ```

  🗑️ **Uninstall**:

  ```bash
  sudo rm $PREFIX/bin/dotload && hash -r
  ```

  > ℹ️ **Note**: If you want to remove this tool from **Termux**, you need to run the above command without `sudo`

</details>

<details>
  <summary><b>Snap ⚠️</b></summary>

  > ⚠️ **WARNING**: The **snap** version of the package may not work with custom installation scripts

  ```bash
  curl -O https://github.com/okineadev/dotload/releases/download/v1.1.0/dotload_1.1.0_all.snap
  sudo snap install dotload_1.1.0_all.snap --dangerous
  ```

  This snap pack is for gourmets only :)

  I do not recommend using it

</details>

Or you can run without installation on **any** OS with this command:

```bash
bash <(curl -sL https://github.com/okineadev/dotload/releases/latest/download/dotload) @<username>
```