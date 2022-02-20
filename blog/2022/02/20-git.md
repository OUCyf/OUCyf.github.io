+++
title = "About This Website &ndash; Git and Deploy"
descr = """
    How to deploy your website with Github CI/CD.
    """
tags = ["website","html","css","javascript","julia","franklin-jl"]
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
- This blog will introduce the generally framework and technology about this website, which includes html css javascript and how to auto-deploy in github with CI/CD.
- Generally speaking, JTS website built with by Franklin.jl, Minimal Mistakes, and Julia programming language.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
\toc



<!-- ####################################
          [2]. Content
#################################### -->

Remove the files already added to git

Finally, you need to actually remove those DS Store files from your directory.

Use this great command from the top voted answer. This will go through all the folders in your directory, and remove those files from git.

find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch

Push .gitignore up to Github

Last step, you need to actually commit your .gitignore file.

git status

git add .gitignore

git commit -m '.DS_Store banished!'