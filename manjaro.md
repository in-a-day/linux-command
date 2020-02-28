### manjaro
- virtaulbox 中安装manjaro
  - 安装完成还会进入boot启动项, 需下拉选择正确的启动
  - 安装增强功能:
  ```bash
  sudo pacman -S virtualbox-guest-iso
  sudo mount /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso /mnt
  cd /mnt
  sudo sh VBoxLinuxAdditions.run
  报错:
  This system is currently not set up to build kernel modules.
  Please install the Linux kernel “header” files matching the current kernel
  for adding new hardware support to the system.
  查看内核版本
  uname -r 
  选择正确的内核安装
  sudo pacman -S linux-headers 
  最后执行
  sudo sh VBoxLinuxAdditions.run
  ```
- 选择中国镜像源：
```bash
sudo pacman-mirrors -i -c China -m rank //更新镜像排名
sudo pacman -Syy //更新数据源
# 在/etc/pacman.conf中添加以下
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
# 执行
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
```

- 安装中文输入法：
```bash
sudo pacman -S fcitx-lilydjwg-git fcitx-configtool fcitx-qt5
sudo pacman -S qtwebkit
sudo pacman -S fcitx-sogoupinyin

sudo vim ~/.xprofile 
# 写入一下内容
export LC_ALL=zh_CN.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

- gnome替换文件夹名称为英文：
```bash
export LANG=en_US
xdg-user-dirs-gtk-update
# 在弹出框中选择更改文件夹名称
export LANG=zh_CN
# 重启后选择保留原始名称
```
- kde在设置/应用程序/地点设置为默认

- 交换大写及esc键位：在gnome桌面下， 选择tweek工具，选择键盘和鼠标选项， 选中想要交换的键位

- 替换shell为zsh， 并使用oh-my-zsh
- 替换默认bash为zsh
```bash
chsh -s /bin/zsh
```
- 安装oh-my-zsh
```bash
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

- 解决wine qq， idea 等无法输入中文：
```bash
# 在其启动脚本中添加以下内容：
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
```


> 添加shell快捷键： gnome-terminal(gnome下打开终端命令， 添加快捷键即可)

> 在bash中使用vi模式： set -o vi , 写入.bahsrc中持久化


##### 软件安装
- anki 安装：
> 官网下载linux版本：https://apps.ankiweb.net/


