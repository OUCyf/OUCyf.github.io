
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