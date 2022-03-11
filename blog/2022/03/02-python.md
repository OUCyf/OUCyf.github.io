
+++
title = "Python Manual"
descr = ""
tags = ["python"]
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
- A basic introduction about python.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->

# subprocess.Popen

```bash
ps -ef | grep yinf | awk '{ print $2 }' | xargs kill -9
```


参考网页：https://docs.python.org/zh-cn/3/library/subprocess.html
命令：subprocess.Popen 本质是创建一个子进程，主（父）进程是调用它的Python程序。子进程创建完成后，父进程会继续执行子进程后面的程序而不管
    子进程有没有执行结束。所以可以阻塞父进程，等待子进程结束再执行后面的语句，使用Popen.wait()函数命令，使之变成串行程序。
    subprocess.call()函数自带阻塞功能。

Python 中使用 subprocess 模块的 Popen 方法调用 SAC，通过 p.communicate() 
将命令 s.encode() 传递给 SAC

1. os.putenv("SAC_DISPLAY_COPYRIGHT", '0') 
    # a. 设置环境变量 SAC_DISPLAY_COPYRIGHT 的值为 0，这样就不用打印启动sac程序的欢迎页面了

2. p = subprocess.Popen(["sac"], stdin=subprocess.PIPE, stdout=open('dirtest.txt','w'))  
    # a. stdin=subprocess.PIPE表示标准输入通过管道p.communicate输入
    # b. stdout=open('dirtest.txt','w')表示将标准输出到一个文本文件中,也可以使用subprocess.PIPE这个时候就不会打印到屏幕了，
        而是托管到第三方PIPE下面，不打印到主进程下
    # c. ["sac"]列表第一个字符串表示要执行的命令程序，列表后面的字符串表示该命令程序的输入

3. p.communicate(s.encode()) 
    # a. p.communicate表示向 stdin 发送数据，或者从stdout和stderr中读取数据（参数stdin必须
        被设置为PIPE。同样，如果希望从stdout和stderr获取数据，必须将stdout和stderr设置为PIPE）
    # b. s.encode() 表示指定字符串s的编码格式

4. 利用系统的 Shell 命令执行时，需要确保 shell=True，第一个变量例如 cmd_cat 就是shell格式下命令字符串.cwd='/'用于设置该子进程
    执行的路径。
    注意：系统的shell命令有自己的通配符正则化形式，所以这里的*会起到通配符的作用，第1、2、3中的通配符*将不起作用，会解释为字符串*
    cmd_cat = 'cat %s >> %s' % ('*_PZs_*','SAC.PZs1')  # shell命令的字符串格式
    subprocess.Popen(cmd_cat, shell=True,cwd='/')  # 利用Popen执行shell命令
    或者 subprocess.Popen('cat *_PZs_* >> SAC.PZs1', shell=True,cwd='/')

5. a=subprocess.getstatusoutput('MCMTpy -h') 返回在 shell 中执行 cmd 产生的 (exitcode, output)

6. subprocess.Popen(['rdseed', '-pdf',seed_name],cwd=file_path) 注意 seed_name 只能用相对路径，
    因为popen命令只会找当前路径下的文件名称，该文件名称不包含路径信息


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
