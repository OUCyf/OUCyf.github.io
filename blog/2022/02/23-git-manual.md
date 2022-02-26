+++
title = "Git Manual"
descr = ""
tags = ["git","github"]
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
- This blog will introduce how to manage your daily work with git. 
- In the **Brief Intro** part give a brief introduction about git and a basic workflow. 
- In the **Install and Init** part introduce how to install and update git and initialize a git project. 
- In the **Manual** part give a detailed intro about the usually used command.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
\toc



<!-- ####################################
          [2]. Content
#################################### -->

# Brief Intro

**Linus** 在1991年创建了开源的`Linux`, 2005年 **Linus** 花了两周时间用`C`写了一个分布式版本控制系统, 用于管理`Linux`系统的源码。`Github`由 **Chris Wanstrath**, **PJ Hyett**, 和 **Tom Preston-Werner** 三位开发者在2008年4月创办，主要提供基于`git`的版本托管服务。付费用户可以建私人仓库，免费用户只能使用公共仓库(或者3名开发者以下的私有仓库)。**Git** 由三部分组成: **Working Directory** (工作区), **Index** (暂存区) and **Repository** (版本库)：

- **Working Directory**: 就是电脑里能看到的目录。
- **Index**: 也叫 _Stage_, 一般存放在 _.git_ 目录下的 index 文件`.git/index`中。
- **Repository**: 工作区有一个隐藏目录 _.git_，是版本库。通常由`branch`and`Head`组成, `Head`指向你最后一次提交的结果。


**创建新仓库**:
```bash
# 创建新文件夹，打开，然后执行
$ git init

# 检出仓库,执行如下命令以创建一个本地仓库的克隆版本：
$ git clone /path/to/repository

# 如果是远端服务器上的仓库，你的命令会是这个样子：
$ git clone username@host:/path/to/repository
```

**添加和提交**:
```bash
# 你可以提出更改（把它们添加到暂存区），使用如下命令：
$ git add <filename>
$ git add .
# 这是 git 基本工作流程的第一步；使用如下命令以实际提交改动：
$ git commit -m "代码提交信息"
# 现在，你的改动已经提交到了 HEAD，但是还没提交到你的远端仓库
```

![](/assets/blog-data/fig/2022-02-23-1.jpeg)

**推送改动**:
```bash
# 你的改动现在已经在本地仓库的 HEAD 中了。执行如下命令以将这些改动提交到远端仓库：
$ git push origin master
# 可以把 master 换成你想要推送的任何分支。

# 如果你还没有克隆现有仓库，并欲将你的仓库连接到某个远程服务器，你可以使用如下命令添加：
$ git remote add origin <server>
# 如此你就能够将你的改动推送到所添加的服务器上去了
```
![](/assets/blog-data/fig/2022-02-23-2.jpeg)


**分支和合并**:
```bash
# 创建一个叫做“feature_x”的分支，并切换过去：
$ git switch -c feature_x  # or: git checkout -b feature_x
# 切换回主分支：
$ git switch master        # or: git checkout master
# 再把新建的分支删掉：
$ git branch -d feature_x
# 除非你将分支推送到远端仓库，不然该分支就是不为他人所见的：
$ git push origin feature_x

# 要更新你的本地仓库至最新改动，以在你的工作目录中获取（fetch）并合并（merge）远端的改动：
$ git pull
# 要合并其他分支到你的当前分支（例如 master），执行：
$ git merge <branch>
# 在这两种情况下，git都会尝试去自动合并改动。遗憾的是，这可能并非每次都成功，并可能出现冲突（conflicts）。这时候就需要你修改这些文件来手动合并这些冲突（conflicts）。改完之后，你需要执行如下命令以将它们标记为合并成功：
$ git add <filename>
# 在合并改动之前，你可以使用如下命令预览差异：
$ git diff <source_branch> <target_branch>
```
![](/assets/blog-data/fig/2022-02-23-3.png)


# Install and Init

## Install and Update
MacOS 利用 Xcode 的 Command Line Tools 安装Git，安装位置在 `/usr/bin/git`, 安装完成后，需要设置 `username` 和 `email`保存到配置文件中`~/.gitconfig`:

```bash
$ git config --global user.name "Your Name"
$ git config --global user.email "email@example.com"
```

但 Xcode 自带的 Git 通常版本较低，想要升级的话需要使用 brew, 升级后不会覆盖原始配置文件`~/.gitconfig`, 不需要重新设置: 

```bash
$ brew install git

# 添加环境变量
$ vim ~/.bash_profile

# 然后在该文件中增加下面的内容保存
> export GIT=/usr/local/Cellar/git/2.35.1
> export PATH=$GIT/bin:$PATH

# 关闭该文件
$ source ~/.bash_profile
$ source ~/.zshrc # 我在 .zshrc 中导入了 .bash_profile 内的环境变量
$ git --version
```

## Config
在安装Git一节中，我们已经配置了`user.name`和`user.email`。还有许多别的配置

```bash
# 让Git显示颜色
$ git config --global color.ui true

# 配置 log 命令 --> git lg
$ git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
- `alias` 是 git 命令的别名
- 每个仓库的Git配置文件都放在`.git/config`文件中
- 当前用户的Git配置文件放在用户主目录下的一个隐藏文件`~/.gitconfig`中

\note{配置Git的时候，加上`--global`是针对当前用户起作用的，如果不加，那只针对当前的仓库起作用。}



## Master and Main
2020-10-01后，GitHub库的默认分支变为`main`(中性词)，取代`master`(因为master带有主人等级观念，联系黑奴制), 但不会影响所有的现有库。但注意 Git 的默认分支仍然是`master`。所以要注意保持两者默认分支名字的一致性，建议把本地git的`master`改成`main`。手动修改 `~/.gitconfig` 文件并令 `defaultBranch = main`。或者使用 git config 命令, `git version > v2.28`:
```bash
$ git config --global init.defaultBranch main
```

对于原来的项目不建议也不需要修改默认分支名称，如果想要修改可以在master默认分支下重命名：
```bash
# 通过 `-m` 参数可修改分支名，而不影响 Git 提交历史, master 变成 main
$ git branch -m master main

# 但上述变更只是本地的，需要同步到远端。
$ git push -u origin main
```
上述命令将新建的 `main` 分支同步到远端并设置 `upstream` 到了该分支。


## Generate SSH Key
可支持多台机器，例如一个GitHub上的远程仓库，可以在家一台电脑，办公室一台电脑，都是用`SSH Key`进行提交代码，只需要把 Key 都放在`GitHub Setting`里。

```bash
# 生成 key
$ ssh-keygen -t rsa -C “your_Github_email@adrress”

# 添加到本地 ssh 配置文件中
$ cd ~/.ssh
$ vim id_rsa.pub

# and then copy the key info: Github website --> add Key

# check git ssh status 
$ ssh -T git@github.com  
```


## Init Locally

一个项目可以由两种方式创建: 从本地初始化后传到GitHub上, 从GitHub上clone下来。这里展示在本地初始化过程：

```bash
$ git init
$ git add .
$ git commit -m 'first commit'
```

添加远程仓库，与本地仓库保持同步，首先在GitHub上创建一个空仓库，然后在本地仓库关联远程仓库，origin是自己起的远程库的名字，可以任意替换

```bash
$ git remote add origin git@github.com:your_Github_name/reop_name.git
```

由于远程库是空的，我们第一次推送`main`分支时，加上了`-u`参数，Git不但会把本地的`main`分支内容推送到远程新的`main`分支，还会把本地的`main`分支和远程的`main`分支**关联**起来，在以后的推送或者拉取时就可以简化命令

```bash
$ git push -u origin main
```

从现在起，只要本地作了提交，就可以通过命令：
```bash
# or: git push
$ git push origin main 

# check the origin repository address
$ git remote -v 

# if you want to remove the current repository address 
$ git remote rm origin  
```



## Init Remotely
我喜欢的开发方式是: 先创建远程库，然后克隆到本地。假设你已经在GitHub创建了一个远程库，下一步`git clone`, 注意使用`ssh`协议（ssh在国内速度快，如果在国外也可以使用https协议）：

```bash
$ git clone git@github.com:your_Github_name/reop_name.git
```

接下来可以在本地正常开发了



# Manual

## 创建新分支
```bash
# 创建一个叫做“feature_x”的分支，并切换过去：
$ git switch -c feature_x            # or: git checkout -b feature_x

# 创建远程 origin 的 dev 分支到本地
$ git checkout -b dev origin/dev

# 切换回主分支：
$ git switch master                  # or: git checkout master
```

## 删除某分支
```bash
# 删除本地 <branch> 分支 
$ git branch -d <branch>

# 删除远程库 <branch> 分支 
$ git push origin --delete <branch>
```

## 比较两个分支差异
```bash
# 显示出所有有差异的文件列表
$ git diff branch1 branch2 --stat

# 显示指定文件的详细差异
$ git diff branch1 branch2 文件名(带路径)

# 显示出所有有差异的文件的详细差异
$ git diff branch1 branch2
```

## 合并分支
```bash
# 在 main(master) 分支下合并 dev 分支的内容
$ git merge dev

# --no-ff 禁止快速合并模式 Fast-forward，'-m' 会将本次合并作为一次 commit 提交，被记录下来
$ git merge --no-ff -m "merge dev --add new blog-1" dev
```

## 拉取提交
如果团队在 `dev` 分支开发，队友在`dev`上提交了新的`commit`，我们需要从GitHub上拉取这些`commit`到自己本地的`dev`分支上，然后再开发
```bash
# 首先指定本地dev分支与远程origin/dev分支的链接
$ git branch --set-upstream-to=origin/dev dev

# 拉取代码
$ git pull
```
\note{`git pull` = `git fetch` + `git merge`, `git fetch` 只会拉取远程代码到本地不会合并}


## Add Tag

```bash
# 切换到需要打标签的分支上
$ git tag v1.0

# 命令 git tag查看所有标签
$ git tag

# 用git show <tagname>查看标签信息
$ git show v0.9

# 为过去某次commit打上标签，f52c633是'commit id'
$ git tag v0.9 f52c633

# 创建带有说明的标签，用-a指定标签名，-m指定说明文字
$ git tag -a v0.1 -m "version 0.1 released" 1094adb

# 删除标签
$ git tag -d v0.1

# 推送某个标签到远程
$ git push origin v1.0

# 一次性推送全部尚未推送到远程的本地标签
$ git push origin --tags

# 标签已经推送到远程，要删除远程标签就麻烦一点，先从本地删除
$ git tag -d v0.9

# 然后从远程删除，删除命令也是push
$ git push origin :refs/tags/v0.9
```

默认情况下，`git push` 命令并不会传送标签到远程仓库服务器上。在创建完标签后你必须显式地推送标签到共享服务器上, 这个过程就像共享远程分支一样, 你可以运行 `git push origin <tagname>`

\note{标签总是和某个`commit`挂钩。如果这个`commit`既出现在`master`分支，又出现在`dev`分支，那么在这两个分支上都可以看到这个标签}


## 查看历史
```bash
$ git log --graph --pretty=oneline --abbrev-commit
$ git log --pretty=oneline --abbrev-commit
$ git log --pretty=oneline

# 查看上一次记录
$ git log -1

# 大神操作
$ git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
```

## 版本回退 (working...)
\warn{最新版本的git已经使用git restore 代替了原来的reset和checkout命令了。}

在 Git 中，用`HEAD`表示当前版本, 上一个版本是`HEAD^`，上上一个版本是`HEAD^^`，往上100个版本`HEAD~100`。但推荐使用`commit id`来退回版本：

```bash
# 退回到上一个版本
$ git reset --hard HEAD^

# 首先查看历史 commit 的 id
$ git log

# 例如发现 id 是 1094a，退回到该版本
$ git reset --hard 1094a
```

\note{Git的版本回退速度非常快，因为Git在内部有个指向当前版本的HEAD指针，当你回退版本的时候，Git仅仅是把HEAD从指向append GPL。}

现在退回到过去的版本了，想回到未来的版本：
```bash
# 要重返未来，用'git reflog'查看命令历史，以便确定要回到未来的哪个版本
$ git reflog

# 例如发现未来的 id 是 1094a，退回到该版本
$ git reset --hard 1094a
```

## 撤销修改 (working...)
\warn{需要替换成最新版本的 git restore}

```bash
$ git checkout -- xx.txt 
```


## 删除文件
```bash
# 要从版本库中删除该文件，那就用命令 'git rm' 删掉，并且 'git commit'
$ git rm test.txt
$ git commit -m "remove test.txt"

# 还可以直接删除，然后 'git add' 和 'git commit'
$ rm text.txt
$ git add .
$ git commit -m "remove test.txt"
```

## 删除本地库 Untracked Files
在编译git库拉下来的代码时，往往会产生一些中间文件，这些文件我们根本不需要，尤其是在成产环节做预编译，检查代码提交是否能编译通过这种case时，我们往往需要编译完成后不管正确与否，还原现场，以方便下次sync代码时不受上一次的编译影响。

```bash
# 删除 untracked files
$ git clean -f

# 连 untracked 的目录也一起删掉
$ git clean -fd

# 连 gitignore 的 untrack 文件/目录也一起删掉 （慎用，一般这个是用来删掉编译出来的 '.o' 之类的文件用的）
$ git clean -xfd
```
 
在用上述`git clean`前，强烈建议加上`-n`参数来先看看会删掉哪些文件，防止重要文件被误删

```bash
$ git clean -nxfd
$ git clean -nf
$ git clean -nfd
```

## Remove '.DS_Store' Files

We need to remove those `.DS_Store` files from the directory which **already added** to git. Use this great command which will go through all the folders in your directory, and remove those files from git.

```bash
$ find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```

Add `.DS_Store` to the file `.gitignore`, which can be found at the top level of your repository (or create the file if it isn't there already). You can do this easily with this command in the top directory:

```bash
$ echo .DS_Store >> .gitignore
```

Last step, we need to actually commit the `.gitignore` file.

```bash
$ git status
$ git add .gitignore
$ git commit -m '.DS_Store banished!'
```

Clean the files recorded in `.gitignore`

```bash
$ git clean -X -f
```



## Fig
Link from [git-tips](https://github.com/521xueweihan/git-tips) project.

![](https://github.com/521xueweihan/git-tips/blob/master/assets/git.png?raw=true)




# End

## References

1. [廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/896043488029600/900375748016320) **_推荐_**
1. [Git 奇技淫巧](https://github.com/521xueweihan/git-tipss)  **_推荐_**
1. [Git 菜鸟教程](https://www.runoob.com/git/git-tutorial.html)
1. [Git 简明教程](https://www.runoob.com/w3cnote/git-guide.html)
1. [Git 简明指南](https://rogerdudler.github.io/git-guide/index.zh.html)

## History:
@@small-font
- 2022-02-23: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-26\\
@@


# Message Board ✨
{{ addcomments }}