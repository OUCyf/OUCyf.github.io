+++
title = "Build Python Programming Environment on MacOS"
descr = ""
tags = ["python"]
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
- My configuration for the programming environment of python on MacOS.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->
```bash
```



# Installation on MAC

1. Download `Anaconda` from official website (or mirror of Tsinghua or USTC), and then click `install` button just like other App.

> Recommend to install GUI version, and install with the default **path**.

2. Set env variable

```bash
$ vim ~/.bash_profile

# add in .bash_profile file
> export PATH="/Users/yf/opt/anaconda3/bin:$PATH"

# refresh env (or source ~/.zshrc)
$ source ~/.bash_profile
```

3. Change the download channel for `conda`/`pip` (optional in china)

- Method-1:
```bash
# add in terminal
$ conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
```

- Method-2: (**_my way_**)
```bash
$ vim ~/.condarc 

# add in ~/.condarc 
channels:
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
  - https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
ssl_verify: true
show_channel_urls: true

# refresh env
$ source ~/.condarc
```


\note{I have not set `pip` download channel}


# Uninstallation on Mac

1. Download a clean package `Anaconda-Clean` by conda
```bash
$ conda install anaconda-clean
```

2. Remove every files related to Anaconda
```bash
$ anaconda-clean --yes
```

3. Then you will get a backup foler, and just remove without hesitation
```bash
$ rm -rf /Users/Username/.anaconda_backup/2018-11-24T003019
```

4. Now you also need to delete Anaconda App
```bash
$ cd /Applications
$ sudo rm -rf anaconda3
```

5. Finally delete env variable
```bash
# remove every env variable path related to anaconda
$ open ~/.bash_profile  

# refresh (or source ~/.zshrc)
$ source ~/.bash_profile
```



# Installation on Linux (Centos)

1. Download Anaconda from official website (or mirror of Tsinghua or USTC, the suffix must be `.sh`), or use `wget`
```bash
$ wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
```

2. Install and add environment variables by defalut as prompted
```bash
# install
$ bash Anaconda3-4.2.0-Linux-x86_64.sh
# refresh env
$ source /home/your-name/.bashrc
```

3. Change the download channel for conda/pip (optional in china)
```bash
$ vim ~/.condarc 

# add in ~/.condarc 
channels:
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
  - https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
ssl_verify: true
show_channel_urls: true

# refresh env
$ source ~/.condarc
```



# End

## References

1. [Installation](https://zhuanlan.zhihu.com/p/36334360)
1. [Installation](https://blog.csdn.net/zxxxiazai/article/details/102780990)
1. [Uninstallation](https://www.jianshu.com/p/d250a4245d81) (**_推荐_**)


## History:
@@small-font
- 2022-02-26: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-26\\
@@


# Message Board ✨
{{ addcomments }}