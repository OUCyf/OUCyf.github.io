+++
title = "About this website"
descr = """
    Julia Franklin HTML CSS.
    """
tags = ["website", "html", "css"]
+++


# Tags
{{page_tags}}



# Content
- working...

## H1
Remove the files already added to git

Finally, you need to actually remove those DS Store files from your directory.

Use this great command from the top voted answer. This will go through all the folders in your directory, and remove those files from git.

find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch

Push .gitignore up to Github

Last step, you need to actually commit your .gitignore file.

git status

git add .gitignore

git commit -m '.DS_Store banished!'

## H2
working


{{ addcomments }}