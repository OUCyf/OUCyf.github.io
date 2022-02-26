+++
title = "Build Julia Programming Environment on MacOS"
descr = ""
tags = ["julia"]
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
- My configuration for the programming environment of julia on MacOS.
- The following tutorial is for **Julia@1.6.2**.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->



<!-- ####################################
          [2]. Content
#################################### -->


# Install


- **_(not recommend)_** MacBook 与 Linux 直接从官网下载二进制安装包dmg格式，点击安装即可。然后将添加环境变量，如下：

```bash
$ vim ~/.bash_profile

# add env in ~/.bash_profile
> export PATH="/Applications/Julia-1.6.app/Contents/Resources/julia/bin/:$PATH"

# refresh
$ source ~/.bash_profile
```


- **_(recomend)_** 中文社区提供了一个 Python 安装程序 `jill` 可以一键安装 Julia 环境，管理不同版本与不同版本之间的链接转换。`pip` 安装 `jill`, 并添加到环境路径，使用教程见 [jill](https://github.com/johnnychen94/jill.py)

```bash
$ jill install 1.6   # 安装指定版本

$ jill list          # 查看所有安装的 Julia 版本

$ jill switch 1.6    # 设置默认版本是1.6
```




# Uninstall


- 二进制安装方式: Mac 直接删除 APP 应用，然后删除 `~/.Julia` 文件夹内的所有环境与安装库信息，即可。

- `jill` 包管理工具安装时, 安装多个版本，但仅删除指定版本: 
    - delete the julia folder in install_dir, e.g.: `/Applications/Julia-1.6.app`
    - optionally remove the symlinks in symlink_dir, e.g.: `~/.local/bin/julia-1.6`

\note{`~/.Julia` 目录是否需要删除的注意事项 
- All Julia packages are installed in `~/.julia/packages/` in version-agnostic manner; whether a specific package version is used depends on the environment you're using. 
- For instance, `~/.julia/environments/v1.6/Manifest.toml` specifies all julia package versions. There isn't `~/.julia/packages/v1.6` stuff. Thus you don't need to worry about this at all. 
- If you want to cleanup some spaces, you can try `pkg> gc` in Pkg mode. Or if you insist, another way is to manually remove `~/.julia/packages` folder and then `pkg> instantiate` to rebuild it.
- refer to [jill-issues-96](https://github.com/johnnychen94/jill.py/issues/96)}


# REPL Mode

共4中模式(官网是5种模式)，按住 `]` 进入包管理模式

- 按住 `;` 进入shell模式，可以使用 bash 中存在的 shell 命令，如 `ls`, `cd`..

- 按住 `?` 进入help模式，输入任意函数，即可返回使用说明

- 所有模式通过 `back` 返回

refer to [https://docs.juliacn.com/latest/stdlib/REPL/#Pkg-mode](https://docs.juliacn.com/latest/stdlib/REPL/#Pkg-mode)


# Run Script

- Bash terminal: `julia name.jl` 

- Julia REPL: `include("name.jl")`

- IDE 中，见后文 VScode 内容


# Source Channel

- 在 REPL 中键入，`ENV["JULIA_PKG_SERVER"]="https://mirrors.bfsu.edu.cn/julia"`, `bfsu`是北京外国语大学的镜像, 每次使用都需要设置一遍.

- 使用 `using PkgServerClient`，利用函数 `versioninfo()` 查看当前Julia环境信息，会根据用户当前网络状况，自动设置到最近镜像网站。Julia中文社区的成员写的。

- 以下加入到 `startup.jl` 启动文件中 (`path: ~/.julia/config/startup.jl`)

```julia
# add in startup.jl
if VERSION >= v"1.4"
    try
        using PkgServerClient
    catch e
        @warn "error while importing PkgServerClient" e
    end
end
```


# Pkg Command

- 安装开源包

```julia-repl
(@v1.7) pkg> status # 查看所有安装包的信息, 等价于 using Pkg; Pkg.status()

(@v1.7) pkg> add XXX # add XXX@1.6.2 安装指定版本？ help 模式下查看 Pkg.add 说明文档，可安装指定版本与本地包


(@v1.7) pkg> rm XXX  # 删除包


(@v1.7) pkg> update XXX  # 更新包

(@v1.7) pkg> test XXX  # 测试包

(@v1.7) pkg> add SeisIO; build [Package]; precompile  # example 测试包
```

- 安装本地包

```julia-repl
(@v1.7) pkg> dev .  # 在开发包的根目录

(@v1.7) pkg> dev package-path  # 或者给定开发包的路径 
```


# IDE

**VScode:**

另外可选的 `atom` 或者 `jupyterlab` or `jupyter notebook`

- 首先需要在自己环境中配置好 Julia，将其加入环境变量中

- 安装 VScode 中的 Julia 插件，如果 Julia 在环境变量中，VScode 会自动找到并配置好；如果想自己配置或者修改 julia 解释器路径，在 `setting` 中搜索 `Julia Extensions`, 找到 `Julia: Executable Path` 修改即可，例如修改为 `/Users/yf/.local/bin/julia-1.6`

- VScode 中执行 Julia 脚本有两种方式:
    - 点击`执行三角`符号，在 bash 中执行
    - 同时按住 `shift+回车`，在 Julia REPL 中执行，此时可以查看变量（推荐）

- `Control+回车`，会打开 VScode 中 Julia 的 REPL


**Jupyter:**

- 安装插件 

```julia-repl
(@v1.7) pkg> add IJulia 	# 我已经安装了 conda jupyter 不需要再使用 IJulia 安装一次 jupyter 
```

- Bash 中运行
```bash
jupyter lab # or jupyter notebook, 可选择Julia解释器
```

\note{注意 `jupyter` 似乎只能识别最高版本的 `Julia kernal` ? 我暂时没有解决方案}

- refer to 
    - [https://julialang.github.io/IJulia.jl/stable/manual/usage/](https://julialang.github.io/IJulia.jl/stable/manual/usage/)
    - [https://zhuanlan.zhihu.com/p/158912631](https://zhuanlan.zhihu.com/p/158912631)



# Some Package

**Seismology:**

- `SeisIO` 地震数据输入输出

- `SeisNoise` ambient noise 互相关



**Other:**

- `Revise`  VScode 中调用 Julia ？？ Hot-fix 在线修复，必须第一个加载然后再加载别的包; VScode自带Revise; 但其不是万能的，不能修改常量以及结构体的定义，这种情况仍然需要重启 Julia 

- `PkgServerClient` 自动匹配最优网络镜像

- `Plots` 画图包

- `IJulia` for jupyter

- `Pluto` notebook

- `OhMyREPL`

- `Latexify`

- `PowerMonitor`

- `BenchmarkTools`

- `Cthulhu`

- `Debugger`

- `ThreadPools` 多线程包






# Note

- Julia community 发展很快，一些包的接口会经常发生变化，导致不同版本之间的不兼容情况，例如
    - 使用 “SeisIO” Project.toml 文件说明需要 HDF5 = "0.12.3, 0.13" 版本
    - 但使用 “SeisNoise” 需要使用 “Plots” 包，新版本的 “Plots” 不支持 HDF5 = "0.12.3, 0.13" 这些老版本，code can run but warning
    - 解决办法是，使用老版本的 “Plots” 或者忽略 warning
    - reference: [https://github.com/JuliaPlots/Plots.jl/issues/3235](https://github.com/JuliaPlots/Plots.jl/issues/3235)

- Julia 的 JIT 技术导致第一次运行 code 时，速度很慢，所以适合在 IDE 中写代码，且对画图 plot 不太友好，建议用 `matplotlib` 可视化


# End

## References
1. [jill](https://github.com/johnnychen94/jill.py)
1. [https://github.com/JuliaPlots/Plots.jl/issues/3235](https://github.com/JuliaPlots/Plots.jl/issues/3235)
1. [https://julialang.github.io/IJulia.jl/stable/manual/usage/](https://julialang.github.io/IJulia.jl/stable/manual/usage/)
1. [https://zhuanlan.zhihu.com/p/158912631](https://zhuanlan.zhihu.com/p/158912631)
1. [https://docs.juliacn.com/latest/stdlib/REPL/#Pkg-mode](https://docs.juliacn.com/latest/stdlib/REPL/#Pkg-mode)


## History:
@@small-font
- 2022-02-26: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-26\\
@@


# Message Board ✨
{{ addcomments }}