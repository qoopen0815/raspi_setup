# raspi_setup
Raspbian stretch 用

# Installation
初回のアプデ作業は必須。  
ファイルシステムの拡張もついでに行っておく。
```bash
sudo sudo apt update && sudo apt -y upgrade
sudo raspi-config nonint do_expand_rootfs      # Expand Filesystem
sudo reboot
```

raspi_setup.shを起動
```bash
source raspi_setup.sh
```

ROSのインストールで死ぬ場合があるので、その時は根気よく粘る。
そのうち修正する。