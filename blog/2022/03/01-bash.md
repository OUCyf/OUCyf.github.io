
+++
title = "Bash Manual"
descr = ""
tags = ["bash"]
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
- A basic introduction about bash command.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# Kill

```bash
ps -ef | grep yinf | awk '{ print $2 }' | xargs kill -9
```
cd /cluster/datapool1/yinf/3.Project/MCMTpy_us/Green_Funcs/

# End

## References
1. [https://liam.page/2017/09/12/rescue-your-life-with-SSH-config-file/](https://liam.page/2017/09/12/rescue-your-life-with-SSH-config-file/)


## History:
@@small-font
- 2022-03-01: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-03-01\\
@@


# Message Board ✨
{{ addcomments }}