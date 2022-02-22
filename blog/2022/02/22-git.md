+++
title = "Use Github in China"
descr = """
    set github ip for china characteristic network
    """
tags = ["ip","dns","github"]
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
- This blog will introduce how to set github ip for china characteristic network
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->
# China Characteristic

`Github` 没有被墙, 但由于 DNS 解析出现污染, 导致访问 `GitHub` 的域名在中国异常的慢。 如果域名解析直接指向 `GitHub` 的 IP 地址, 以此来绕过DNS 解析, 可加速访问`GitHub`。因此国内有 programer 专门解析维护 `GitHub` 的 IP 解析地址, 实时查看GitHub的解析地址可查询网站 [ipaddress](https://ipaddress.com/website/www.github.com)。 将查询到的 IP 添加到 `/etc/hosts` 文件中, 并刷新 `source /etc/hosts`.

## 手动更新

### 查看最新GitHub 的最新ip地址
在 [ipaddress](https://ipaddress.com/website/www.github.com) 网站查询GitHub相关的网站对应的最新IP地址, 通常查询下述4个域名:

```plaintext
github.com
github.global.ssl.fastly.net
assets-cdn.github.com
codeload.github.com
```

或者可以将ip查询网站拼接在之后进行查询:

- [github.global.ssl.fastly.net.ipaddress.com/](http://github.global.ssl.fastly.net.ipaddress.com/)\\
- [github.com.ipaddress.com/](http://github.com.ipaddress.com/)\\
- [assets-cdn.github.com.ipaddress.com/](http://assets-cdn.github.com.ipaddress.com/)\\
- [codeload.github.com.ipaddress.com/](http://codeload.github.com.ipaddress.com/)\\

### 修改本地hosts文件映射ip地址
找到对应的IP地址后，将IP地址与网站地址进行对应，并将对应关系写入本地hosts文件中, 修改 `sudo vim /etc/hosts`。
> hosts文件直接编辑修改时需要权限

```bash
# Github-DNS 映射格式如:  [ip] [domainName]
199.232.69.194 github.global.ssl.Fastly.net
140.82.114.4 GitHub.com
185.199.108.153 assets-cdn.Github.com
140.82.114.9 codeload.Github.com
```
刷新 hosts `source /etc/hosts`, 并刷新DNS缓存来访问新的映射 `sudo killall -HUP mDNSResponder` for `version > MacOS-10.4`. 刷新完成后，再次打开github网站时速度会明显提升，需要注意的是以上github网站的ip经常发生变化，如果访问再次变慢可以重新更新映射信息。



## 自动更新
实时更新 `GitHub` 相关 IP 的项目 [GitHub520](https://github.com/521xueweihan/GitHub520), 项目服务器网站 [HelloGitHub 镜像站](https://raw.hellogithub.com/)。 参考 [知乎](https://zhuanlan.zhihu.com/p/394470267) 网友提供的 `Python` 自动化脚本，实时 `request GitHub520` 提供的 IP, 并自动修改 `/etc/hosts` 文件, 代码如下:

~~~<input id="hidecode-2" class="hidecode" type="checkbox">~~~
<!-- \input{python}{/assets/blog-data/script/update-host-github.py}   -->
```python
"""
##############################
##  origin /etc/hosts file  ##
##############################
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
255.255.255.255 broadcasthost
::1             localhost
"""

from shutil import copyfile
import datetime
import os
import requests
import sys

class GithubHost:
    winHostsPath='C:\Windows\System32\drivers\etc\hosts'
    macHostsPath='/etc/hosts'

    hostsDic = {'win32':winHostsPath, 'darwin':macHostsPath}
    dnsRefreshDic = {'win32':'ipconfig /flushdns', 'darwin':''}

    githubHostUrl='https://raw.hellogithub.com/hosts'
    googleHostUrl=''

    def refreshHosts(self):
        # 备份原hosts文件
        hosts=self.hostsDic[sys.platform]
        self.backUpHosts(srcfile=hosts)
        
        # 获取并更新github新host内容
        self.updateHosts(hosts, self.githubHostUrl, '# GitHub520 Host Start', '# GitHub520 Host End')

        # 获取并更新google新host内容
        # self.refreshHosts(hosts, self.googleHostUrl, '', '')

        # 刷新
        refreshCmd=self.dnsRefreshDic[sys.platform]
        os.system(refreshCmd)


    def updateHosts(self, hosts, hosturl, beginRowStr, endRowStr):
        # 删除原有内容
        self.removePartOfFile(hosts, beginRowStr, endRowStr)
        self.addHostsFromURL(hosts, hosturl)


    def removePartOfFile(self, file, beginRowStr, endRowStr):
        lines = []
        with open(file, 'r') as oldhosts:
            lineInRange = False
            for line in oldhosts:
                # 如果在beginRowStr 与 endRowStr 之间的，就不记录在新文件中
                if line.strip() == beginRowStr.strip():
                    lineInRange = True
                if not lineInRange and line.strip() != '': # 删除空行
                    lines.append(line)
                if line.strip() == endRowStr.strip():
                    lineInRange = False

        with open(file, 'w') as newHosts:
            for line in lines:
                if len(line) != 0 and line is not os.linesep:
                    newHosts.write(line)
        

    def backUpHosts(self, srcfile):
        dstfile = srcfile + datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
        copyfile(src=srcfile, dst=dstfile)

    def addHostsFromURL(self, hostfile, hostsurl):
        '''从github项目地址：读取最新的github的IP记录'''
        with open(hostfile, 'a+') as fw:
            # 字符串给出当前平台使用的行终止符。例如，Windows使用'\r\n'，Linux使用'\n'而Mac使用'\r'。
            # fw.write(os.linesep)
            fw.write(requests.get(hostsurl).text.strip())

if __name__ == '__main__':
    GithubHost().refreshHosts()
```
~~~<label for="hidecode-2" class="hidecode"></label>~~~



\note{修改系统文件权限: `sudo python xxx.python`, 记得将原始文件进行备份; 会更新修改 line from `# GitHub520 Host Start` to `# GitHub520 Host End` 之间的内容, 不会删除或修改其他内容。}

文件 `/etc/hosts` 修改内容示例:

~~~<input id="hidecode-1" class="hidecode" type="checkbox">~~~
```bash
# GitHub520 Host Start
140.82.113.26                 alive.github.com
140.82.113.25                 live.github.com
185.199.108.154               github.githubassets.com
140.82.114.21                 central.github.com
185.199.108.133               desktop.githubusercontent.com
185.199.108.153               assets-cdn.github.com
185.199.108.133               camo.githubusercontent.com
185.199.108.133               github.map.fastly.net
199.232.69.194                github.global.ssl.fastly.net
140.82.114.3                  gist.github.com
185.199.108.153               github.io
140.82.113.4                  github.com
192.0.66.2                    github.blog
140.82.112.5                  api.github.com
185.199.108.133               raw.githubusercontent.com
185.199.108.133               user-images.githubusercontent.com
185.199.108.133               favicons.githubusercontent.com
185.199.108.133               avatars5.githubusercontent.com
185.199.108.133               avatars4.githubusercontent.com
185.199.108.133               avatars3.githubusercontent.com
185.199.108.133               avatars2.githubusercontent.com
185.199.108.133               avatars1.githubusercontent.com
185.199.108.133               avatars0.githubusercontent.com
185.199.108.133               avatars.githubusercontent.com
140.82.112.10                 codeload.github.com
54.231.128.1                  github-cloud.s3.amazonaws.com
52.217.229.65                 github-com.s3.amazonaws.com
52.217.96.28                  github-production-release-asset-2e65be.s3.amazonaws.com
52.217.77.92                  github-production-user-asset-6210df.s3.amazonaws.com
52.217.172.9                  github-production-repository-file-5c1aeb.s3.amazonaws.com
185.199.108.153               githubstatus.com
64.71.144.202                 github.community
23.100.27.125                 github.dev
140.82.113.22                 collector.github.com
13.107.43.16                  pipelines.actions.githubusercontent.com
185.199.108.133               media.githubusercontent.com
185.199.108.133               cloud.githubusercontent.com
185.199.108.133               objects.githubusercontent.com


# Update time: 2022-02-22T20:07:23+08:00
# Update url: https://raw.hellogithub.com/hosts
# Star me: https://github.com/521xueweihan/GitHub520
# GitHub520 Host End
```
~~~<label for="hidecode-1" class="hidecode"></label>~~~



## `Optional`: 禁用 web 代理，例如 http.proxy
Git push 时如果设置了代理可能会出现下述错误，参考[SSL_connect: SSL_ERROR_SYSCALL...:443](https://blog.csdn.net/daerzei/article/details/79528153):

```bash
# error example:
Push failed: Failed with error: unable to access 'https://github.com/weidongcao/bigdata/': 
OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443
```

Git支持三种网络协议: `git://`, `ssh://`, and `http://`. 本来push的时候应该走ssh隧道的，但是如果设置了http代理，所以就走http的代理，于是出现上述报错。解决方案是取消http代理, 在github项目在本地的根目录下输入:

```bash
git config --global --unset http.proxy
```

## References
1. [https://blog.nowcoder.net/n/f78e6efcaefe4c6b81fd1ef2c00c3a47](https://blog.nowcoder.net/n/f78e6efcaefe4c6b81fd1ef2c00c3a47)
1. [https://blog.csdn.net/daerzei/article/details/79528153](https://blog.csdn.net/daerzei/article/details/79528153)
1. [https://juejin.cn/post/6844904193170341896](https://juejin.cn/post/6844904193170341896)
1. [https://zhuanlan.zhihu.com/p/394470267](https://zhuanlan.zhihu.com/p/394470267)
1. [https://github.com/521xueweihan/GitHub520](https://github.com/521xueweihan/GitHub520)
1. [https://juejin.cn/post/7019683061977579557](https://juejin.cn/post/7019683061977579557)



## History:
@@small-font
- 2022-02-22: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-22\\
@@


# Message Board ✨
{{ addcomments }}
