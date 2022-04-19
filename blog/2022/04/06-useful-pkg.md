
+++
title = "Useful package in my MacOS"
descr = ""
tags = ["package"]
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
- Common useful packages in my MacOS.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# pdf2svg
用来将 PDF 转成 svg 文件，以供文档浏览

- Download `pdf2svg`.
- Unpack the files and make the executable.
```bash
tar -zxf pdf2svg-0.2.3.tar.gz
cd pdf2svg-0.2.3
./configure --prefix=/usr/local
make
make install
```

- To use
```bash
pdf2svg example.pdf example-no1.svg
```
# End

## References
1. [https://cityinthesky.co.uk/opensource/pdf2svg/](https://cityinthesky.co.uk/opensource/pdf2svg/)
2. [https://www.bookstack.cn/read/dochub/env-pdf2svg.md](https://www.bookstack.cn/read/dochub/env-pdf2svg.md)

## History:
@@small-font
- 2022-04-06: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-04-06\\
@@


# Message Board ✨
{{ addcomments }}