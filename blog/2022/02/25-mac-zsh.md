+++
title = "Mac+Iterm2+Oh-My-Zsh+p10k+Tmux(or Screen)"
descr = ""
tags = ["terminal"]
noeval = true
+++



<!-- ####################################
          [1]. Abstract
#################################### -->

@@blog
<!-- a.blog title -->
@@blog-title 
**{{title}}** 
@@
<!-- b.blog intro -->
@@blog-intro
- My terminal configuration for MacOS with iterm2, oh-my-zsh, p10k, and tmux.
- All configuration used locally not in server.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# Overview

- There is just a brief introduction, please refer to the references for details. 
- **Do not add any var** in `~/.zshrc`, just add var in `~/.bashrc`. Because we import `~/.bashrc` file in `~/.zshrc`.

**Requirements:**
- [iterm2](https://iterm2.com/)
- [Dracula](https://draculatheme.com/)
- [zsh](https://www.zsh.org/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [autojump](https://github.com/wting/autojump)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [colorls](https://github.com/athityakumar/colorls)
- [tmux(or screen)](https://github.com/tmux/tmux)

**The mainly configuration files include:**
- [`~/.bashrc`](https://github.com/OUCyf/my-terminal-config/tree/main/configuration_files), [`~/.zshrc`](https://github.com/OUCyf/my-terminal-config/tree/main/configuration_files), and [`~/.p10k.zsh`](https://github.com/OUCyf/my-terminal-config/tree/main/configuration_files), stored in [`./configuration_files`](https://github.com/OUCyf/my-terminal-config).
- [`font`](https://github.com/OUCyf/my-terminal-config/tree/main/fonts) package stored in [`./fonts`](https://github.com/OUCyf/my-terminal-config) 
- [`Dracula`](https://github.com/OUCyf/my-terminal-config/tree/main/iterm-Dracula) theme for iterm2 in [`./iterm-Dracula`](https://github.com/OUCyf/my-terminal-config) 



# Install

## iTerm2 and Dracula
- In official `iTerm2` website, click `Download` and then install in your Mac just like other App. **_my way_**
- `brew install cask iterm2`. **_recommend_**
- Download `Dracula` theme in official website.


## zsh
\note{
  Use `brew` to install `zsh`, and it seems like that MacOS come with `zsh` after 2019 which installed by `brew`. But we can also use brew to install just for checkout.
}
```bash
# install
$ brew install zsh
```

## oh-my-zsh
Use `curl` to install, which is also recommended by the author. **_my way_**
```bash
# install
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
\note{
  During the installation process, you also need to switch your `shell` to `zsh` which is need to enter password for authorization. Use `chsh -s /bin/zsh` to switch your `shell` to `zsh`, and use `cat /etc/shells` to check how many `shell` installed in your Mac
}


## p10k theme
- There are many themes in `oh-my-zsh`, and I choose `p10k`. Make sure you have installed `oh-my-zsh` firstly, then:

```bash
# install
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# then open `~/.zshrc` to set `ZSH_THEME`:
$ ZSH_THEME="powerlevel10k/powerlevel10k
```

- Install `Nerd Fonts`, download it in [p10k](https://github.com/romkatv/powerlevel10k#set-colors-through-Powerlevel10k-configuration-parameters) website and install manually.


## Plug-In
Install `oh-my-zsh` plug-in for better user experience. Jump To A Directory That Contains foo: `j foo`

### autojump
```bash
# download 'autojump' to '/.oh-my-zsh/custom'
$ git clone git://github.com/wting/autojump.git $ZSH_CUSTOM/plugins/autojump
# go to 'autojump' folder
$ cd $ZSH_CUSTOM/plugins/autojump
# python install.py:
$ ./install.py
```
> we can also download it in webpage and then install it.


### zsh-autosuggestions
- Terminal commands are automatically recommended, which records previously used commands. 
- When you enter the beginning of one command, previous commands are darkly displayed to select. You can press the right arrow key to select this command.

```bash
# git clone
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# open '~/.zshrc' and set the following line
$ plugins=(zsh-autosuggestions)
```

### zsh-syntax-highlighting
- Terminal command syntax highlighting.

```bash
# git clone
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# open '~/.zshrc' and set the following line
$ plugins=(zsh-syntax-highlighting)
```

### colorls
- Failed for China network...

```bash
# intall gem firstly
$ gem install colorls
```


## Terminal in VSCode
VSCode terminal can comes with a consistent interface, that just simply sets the font in VSCode setting as:

```bash
# set in vscode setting
terminal font = MesloLGS NF
```





# End

## References

1. [zhihu-超全教程](https://www.zhihu.com/column/p/145437836) (**_推荐_**)
1. [个性化p10k配置](https://suixinblog.cn/2019/09/beautify-terminal.html)
1. [个性化p10k配置](https://www.packetmania.net/2021/11/13/iTerm2-OMZ-Powerlevel10k/)
1. [少数派Ternimal主题推荐](https://sspai.com/post/53008)
1. [B站详细视频讲解](https://www.bilibili.com/video/BV19Z4y1P7ZL/?spm_id_from=autoNext)
1. [B站讲解tmux](https://www.bilibili.com/video/BV1rb411t7kd?from=search&seid=15827394807027530041&spm_id_from=333.337.0.0)
1. [大佬参考配置GitHub](https://github.com/wangshub/dotfile)
1. [大佬参考配置GitHub](https://github.com/thehalfspace/dotfiles2)
1. [洪鹤庭CSDN](https://blog.csdn.net/icestars/article/details/121098804?spm=1001.2014.3001.5501)

## History:
@@small-font
- 2022-02-25: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-25\\
@@


# Message Board ✨
{{ addcomments }}