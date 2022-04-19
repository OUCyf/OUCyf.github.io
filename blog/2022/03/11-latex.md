
+++
title = "Latex Manual"
descr = ""
tags = ["latex"]
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
- A basic introduction about Latex.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->


# configruation

## Install

Mac 电脑已经安装了 Mactex, 从 USTC 的镜像网站下载 GUI 版本， 直接安装， 没有使用 brew 进行安装。
- 主页：[https://www.tug.org/mactex/](https://www.tug.org/mactex/)
- 校园地址：[http://mirrors.ustc.edu.cn/CTAN/systems/mac/mactex/MacTeX.pkg](http://mirrors.ustc.edu.cn/CTAN/systems/mac/mactex/MacTeX.pkg)


## Uninstall
参考官网提供的卸载方案 [https://www.tug.org/mactex/uninstalling.html](https://www.tug.org/mactex/uninstalling.html),
或者该博客（版本较老有错误）[https://changkun.de/blog/posts/delete-mactex/](https://changkun.de/blog/posts/delete-mactex/)
```bash
sudo rm -r /usr/local/texlive/2021
# 一般情况下，我们还可以看到texlive目录下除了2021，还有一个目录叫做texmf-local，官网上说这只是一个空得目录树，如果你有强迫症，那么，删掉它就彻底完事了。

sudo rm -r /Applications/Tex  # 对应的几个Mactex的APP
sudo rm -r /Library/TeX
sudo rm -r ~/Library/texlive/2021
```

## Upgrade
Latex的发行版本每年会更新一次，每次更新后 `tlmgr` 命令都无法使用，因为远程的仓库已经换成最新的版本，例如从“2021”变成了“2022”, 所以找不到
对应的远程仓库。有两种方法可以解决：
- 卸载旧版本重新安装 MacTeX (官网推荐)
- 滚动更新，参考教程如下 (不推荐)

[https://syvshc.github.io/2022-04-04-texlive-rolling-update/](https://syvshc.github.io/2022-04-04-texlive-rolling-update/)


## VScode

配置 VScode 编写 LaTex 的环境， 参考博客 [https://zhuanlan.zhihu.com/p/166523064](https://zhuanlan.zhihu.com/p/166523064) 配置 VScode 编写 LaTex 的环境， 参考博客

## Overleaf
在线开发，推荐使用 [overleaf](https://www.overleaf.com/project) 里面包含绝大多数杂志和高校的模板。
一个在线的模板网站 [https://typeset.io/documents/](https://typeset.io/documents/) 可将 word 等转换成 latex

## CV
使用 LaTeX 编写简历请参考田冬冬的 GitHub 开源简历 [https://github.com/seisman/cv](https://github.com/seisman/cv)
编写 .cls 文件可参考博客 [https://zhuanlan.zhihu.com/p/77537952](https://zhuanlan.zhihu.com/p/77537952)



# Introduction 

LaTex中常见的文件格式有 `.tex`, `.bib`, `.cls`, `.sty`, `.bbl` 等

- `.tex` 文件也就是我们写文档内容的文件
- `.bib` 是使用 bibligraphy 方式导入参考文献时，写参考文献的文档，.bbl是其编译之后形成的文件
- `.sty` 是包文件，通常使用 `\usepackage` 导入
- `.cls` 是类文件，通过文档最前面的 `\documentclass` 命令导入

对于常见的 article 类，可以通过 `\usepackage[a4paper, 12pt]{article}` 的方式导入，同时定义了文档的尺寸为A4，默认字体大小为 12pt。接下来，将会以简历的制作为例，从头开始编写新的 cls 文件。


# Run BibTeX
插入参考文献使用 BibTeX [https://www.cnblogs.com/yifdu25/p/8330652.html](https://www.cnblogs.com/yifdu25/p/8330652.html), 运行 BibTeX 分为下面四步

- 用 LaTeX 编译你的 `.tex` 文件 , 这是生成一个 `.aux` 的文件, 这告诉 BibTeX 将使用那些应用；
- 用 BibTeX 编译 `.bib` 文件；
- 再次用 LaTeX 编译你的 `.tex` 文件，这个时候在文档中已经包含了参考文献，但此时引用的编号可能不正确；
- 最后用 LaTeX 编译你的 `.tex` 文件，如果一切顺利的话, 这是所有东西都已正常了.


# AGU Template
如何使用杂志（如 AGU JGR）提供的 LaTeX 模板编写文章。可以参考陈蒙的文章：

- .tex 是写文章的 LaTeX 文件，文章的格式（如封面、字体大小、行间距、页眉页脚等）是通过在 `.tex` 的开始导入 `\documentclass[draft,jgrga]{AGUTeX}`  `AGUTeX.cls` 文件是 AGU 官网提供的格式文件，只要导入后就可以自动设置文章指定格式。

- 参考文献的导入，使用：`\bibliographystyle{agufull08.bst}` `\bibliography{paper3.bib}` `agufull08.bst` 是 AGU 提供的参考文献格式文件，paper3.bib 里面存放了所有的参考文献。

- 导入指定路径下的照片：`\graphicspath{{./figures/}}`






# End

## References
1. [中国科学技术大学学位论文 LaTeX 模板](https://github.com/ustctug/ustcthesis)
1. [https://www.zhihu.com/question/62943097](https://www.zhihu.com/question/62943097)
1. TeX Live 下载及安装说明： [https://liam.page/texlive/](https://liam.page/texlive/)
1. LaTeX 入门文档及「CTeX 和 LaTeX 都是啥」：[https://liam.page/2014/09/08/latex-introduction/](https://liam.page/2014/09/08/latex-introduction/)
1. [刘海洋的《LaTeX 入门》](https://liam.page/attachment/attachment/LaTeX-useful-tools/LaTeX_Docs_2014.zip ) 其博客：[http://liam0205.me/tags/LaTeX/](http://liam0205.me/tags/LaTeX/)


## History:
@@small-font
- 2022-03-11: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-03-16\\
@@


# Message Board ✨
{{ addcomments }}