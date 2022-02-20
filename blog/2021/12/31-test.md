+++
title = "Test Blog ❗️ "
descr = """
    just test the function of this blog.
    """
tags = ["test"]
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
- Hey guys 💗
- 你好呀 💗
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
\toc



<!-- ####################################
          [2]. Content
#################################### -->

# Welcome ✨

Hello world~ Welcome to my personal website. 🙌

| Name | Description |
| ---- | ----------- |
| | |

@@alert,alert-info
**NOTE❗️**: none.
@@

> **Note**: none.

# Message Board ✨

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-20
@@

\note{If you already have experience with Franklin and just want to keep an eye on (new) tips and tricks, have a look at the short [demos](/demos/)
}

\warn{If you already have experience with Franklin and just want to keep an eye on (new) tips and tricks, have a look at the short [demos](/demos/)
}
{{ addcomments }}
