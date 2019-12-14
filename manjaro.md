### manjaro

- 选择中国镜像源：
```bash
# 在/etc/pacman.conf中添加以下
[archlinuxcn]    
SigLevel = Optional TrustAll    
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch 
# 执行
sudo pacman -Syy

```

- 安装中文输入法：
```bash
sudo pacman -S fcitx-googlepinyin
sudo pacman -S fcitx-im     # 全部安装
sudo pacman -S fcitx-configtool     # 图形化配置工具

sudo vim ~/.xprofile 
# 写入一下内容
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=”@im=fcitx”
```

- 替换文件夹名称为英文：
```bash
export LANG=en_US
xdg-user-dirs-gtk-update
# 在弹出框中选择更改文件夹名称
export LANG=zh_CN
# 重启后选择保留原始名称
```

- 交换大写及esc键位：在gnome桌面下， 选择tweek工具，选择键盘和鼠标选项， 选中想要交换的键位

- 替换shell为zsh， 并使用oh-my-zsh
# 替换默认bash为zsh
chsh -s /bin/zsh
# 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

- 添加shell快捷键： gnome-terminal(gnome下打开终端命令， 添加快捷键即可)

- 


