+++
title = "Git and github"
descr = """
    how to use git with github.
    """
tags = ["git","github"]
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
- This blog will introduce how to manage your package by git.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->
# 1

Remove the files already added to git

Finally, you need to actually remove those DS Store files from your directory.

Use this great command from the top voted answer. This will go through all the folders in your directory, and remove those files from git.

find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch

Push .gitignore up to Github

Last step, you need to actually commit your .gitignore file.

git status

git add .gitignore

git commit -m '.DS_Store banished!'


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
