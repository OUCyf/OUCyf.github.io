
+++
title = "SSH and SSHFS Configuration on MacOS"
descr = ""
tags = ["ssh", "sshfs"]
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
- My configuration of SSH and SSHFS on MacOS.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# SSH Key

```bash
$ ssh-keygen
```


# SSH Config

I can use `ssh s1` `ssh s2` or...to login Server. Here is my ~/.ssh/config configuration:

~~~<input id="hidecode-2" class="hidecode" type="checkbox">~~~
<!-- \input{python}{/assets/blog-data/script/update-host-github.py}   -->
```bash
$ vim ~/.ssh/config

# here is config file
Host s1
  HostName 222.195.76.240
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinfu
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 22

Host core
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1010

Host m1
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1011

Host m2
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1012

Host m3
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1013

Host m4
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1014

Host crust
  HostName 222.195.74.184
  ForwardX11Trusted yes
  ForwardX11 yes
  User yinf
  IdentityFile /Users/yf/.ssh/id_rsa
  Port 1015
```
~~~<label for="hidecode-2" class="hidecode"></label>~~~


# SSHFS

Mount a remote hard disk to the local Mac using `sshfs`

```bash
sshfs -o follow_symlinks -p 1012 yinf@222.195.74.184:/ /Users/yf/share2/
```




# End

## References
1. [https://liam.page/2017/09/12/rescue-your-life-with-SSH-config-file/](https://liam.page/2017/09/12/rescue-your-life-with-SSH-config-file/)


## History:
@@small-font
- 2022-02-27: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-27\\
@@


# Message Board ✨
{{ addcomments }}