
+++
title = "Write a book with Latex and Julia"
descr = ""
tags = ["book","latex"]
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
- Write a book with Latex and Julia.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# Reporter

- **写报告**, 可以用 jupyter，weave.jl，pluto.jl (plutoreport) 



# Book

- Julia 原生态的 [books.jl](https://github.com/JuliaBooks/Books.jl) (不支持Windows) 挺好的，源代码是 Markdown，可以用 **Pandoc** 翻译成 **TeX** 与 **PDF**.
    - 例如书籍[《Julia Data Science》](https://github.com/JuliaDataScience/JuliaDataScience)

- Latex+Julia, 主要内容用 Latex 编写，里面可以插入 Julia 代码块与生成的图片.《Algorithms for Decision Making》这本书里边代码就是 Julia，这本书在致谢部分提供了，写 Julia 书的解决方案。Julia2019年会议也有人做了报告 [https://m.youtube.com/watch?v=ofWy5kaZU3g](https://m.youtube.com/watch?v=ofWy5kaZU3g). 以下是两个模板
    - [Tufte\_algorithms\_book](https://github.com/sisl/tufte_algorithms_book)
    - [Julia\_tufte\_beamer](https://github.com/mossr/julia-tufte-beamer)

- 最后就是用 Rbookdown, R 语言在数据分析，写书写博客这方面就是做的最好的，没有之一。 直接用它来加Julia语言代码也可以。



# My Scheme

我采用 Latex+Julia 的方案

```bash
ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.

We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.

jupyter-server 1.16.0 requires jupyter-client>=6.1.12, but you'll have jupyter-client 6.1.7 which is incompatible.
jupyter-server 1.16.0 requires jupyter-core>=4.7.0, but you'll have jupyter-core 4.6.3 which is incompatible.
jupyter-server 1.16.0 requires nbconvert>=6.4.4, but you'll have nbconvert 6.0.7 which is incompatible.
jupyter-server 1.16.0 requires nbformat>=5.2.0, but you'll have nbformat 5.0.8 which is incompatible.
jupyter-server 1.16.0 requires tornado>=6.1.0, but you'll have tornado 6.0.4 which is incompatible.
jupyter-server 1.16.0 requires traitlets>=5.1.0, but you'll have traitlets 5.0.5 which is incompatible.
sphinx-thebe 0.1.1 requires sphinx<5,>=3.5, but you'll have sphinx 3.2.1 which is incompatible.
```


# End

## References
1. [https://discourse.julialang.org/t/preparing-tutorials-and-books/59298](https://discourse.julialang.org/t/preparing-tutorials-and-books/59298)

1. [https://github.com/JuliaTeX](https://github.com/JuliaTeX)

## History:
@@small-font
- 2022-03-16: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-03-16\\
@@


# Message Board ✨
{{ addcomments }}