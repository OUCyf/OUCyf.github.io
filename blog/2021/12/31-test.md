+++
title = "Test Blog: "
descr = "- Just test the function in this blog"
tags = ["test"]
noeval = false
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
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
\toc



<!-- ####################################
          [2]. Content
#################################### -->
# Title

## Un-ordered List 
```plaintext
- item 1
- item 2
  - sub-item 1
    - sub-item 1
      - sub-item 1
```
- item 1
- item 2
  - sub-item 1
    - sub-item 1
      - sub-item 1


## Order List
```plaintext
1. item 1
1. item 2
    10. dddd
    10. dddd
        22. aaaa
        22. aaaa
```
1. item 1
1. item 2
    10. dddd
    10. dddd
        22. aaaa
        22. aaaa




# Cite
```plaintext
see e.g. \cite{bg97}

see e.g. \citep{bg97}
```
see e.g. \cite{bg97}

see e.g. \citep{bg97}



# Figure and Table

## Figure

```html
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-1.png"/>
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-2.png"/>
</div>
```

~~~
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-1.png"/>
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-2.png"/>
</div>
<br><br>
~~~


## Markdown table

- 以下 Markdown 语法失效:
  - |:--:| 居中对齐
  - |:--| 左对齐
  - |--:| 右对齐

```plaintext
| Heading 1 | Heading 2 | Heading 3 |
| --------- | --------- | --------- |
| LaTeX     | KaTeX     | MikTeX    |
| LaTeX     | KaTeX     | MikTeX    |
```

| Heading 1 | Heading 2 | Heading 3 |
| --------- | --------- | --------- |
| LaTeX     | KaTeX     | MikTeX    |
| LaTeX     | KaTeX     | MikTeX    |


## Frnaklin table

```plaintext
@@ctable
| Operation                    | Cost |
| :--------------------------- | :--- |
|initial computation of $X^tX$ | $O(np^2)$ |
|initial SVD of $X^tX$         | $O(p^3)$ |
|computation of $VD_λz$        | $O(p^2)$ per $λ$ |
@@
```

@@ctable
| Operation                    | Cost |
| :--------------------------- | :--- |
|initial computation of $X^tX$ | $O(np^2)$ |
|initial SVD of $X^tX$         | $O(p^3)$ |
|computation of $VD_λz$        | $O(p^2)$ per $λ$ |
@@





# Annotation


## Blue
```plaintext
@@alert,alert-info
**NOTE**: none.
@@
```
@@alert,alert-info
**NOTE**: none.
@@


## Gray
```plaintext
> **Note**: none.
```
> **Note**: none.


## Annotation
```plaintext
@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-20
@@
```
@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-20
@@


## Note
```plaintext
\note{note here...}
```
\note{note here...}


## Warn
```plaintext
\warn{warn here...}
```
\warn{warn here...}








# Run Julia

## Video

I use `julia:lorenz...` which mean the name of this script will be the `lorenz.jl`. 

~~~<input id="hidecode" class="hidecode" type="checkbox">~~~
```julia:lorenz
using GLMakie
GLMakie.activate!() # hide

Base.@kwdef mutable struct Lorenz
    dt::Float64 = 0.01
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x)
    dy = l.x * (l.ρ - l.z) - l.y
    dz = l.x * l.y - l.β * l.z
    l.x += l.dt * dx
    l.y += l.dt * dy
    l.z += l.dt * dz
    Point3f(l.x, l.y, l.z)
end

attractor = Lorenz()

points = Observable(Point3f[])
colors = Observable(Int[])

set_theme!(theme_black())

fig, ax, l = lines(points, color = colors,
    colormap = :inferno, transparency = true,
    axis = (; type = Axis3, protrusions = (0, 0, 0, 0),
        viewmode = :fit, limits = (-30, 30, -30, 30, 0, 50)))

record(fig, joinpath(@OUTPUT,"lorenz.mp4"), 1:120) do frame
    for i in 1:50
        push!(points[], step!(attractor))
        push!(colors[], frame)
    end
    ax.azimuth[] = 1.7pi + 0.3 * sin(2pi * frame / 120)
    notify.((points, colors))
    l.colorrange = (0, frame)
end
set_theme!() # hide
```
~~~<label for="hidecode" class="hidecode"></label>~~~

@@julia-video 
\video{lorenz.mp4, autoplay = true} 
@@





## Figure
I use `julia:plot-fig...` which mean the name of this script will be the `plot-fig.jl`

```julia:plot-fig
using CairoMakie
CairoMakie.activate!() # hide
f = Figure()
ax = Axis(f[1, 1], xlabel = "x label", ylabel = "y label",
    title = "Title")
save(joinpath(@OUTPUT, "comp_1.svg"),f) # hide
```

@@julia-fig 
\fig{comp_1.svg}
@@



## Println
I use `!...` which mean print the output, and there will be a output below.

```!
a = 1+10
println("Hello")
println("你好")
println("a=",a)
```


## Show
Use `\show{snippet1}` will also show the result

```julia:snippet1
using LinearAlgebra, Random
Random.seed!(555)
a = randn(5)
round(norm(a), sigdigits=4)
```

\show{snippet1}









## Tableinput


```julia:gen
testcsv = "h1,h2,h3
152,some string, 1.5f0
0,another string,2.87"
write(joinpath(@OUTPUT,"testcsv.csv"), testcsv)
```

\tableinput{custom h1,custom h2,custom h3}{./code/output/testcsv.csv}









# End

## References
1. \biblabel{bg97}{Beatson and Greengard (1997)} **Beatson**, **Greengard**, [A short course on fast multipole methods](https://math.nyu.edu/~greengar/shortcourse_fmm.pdf), 1997.

## History:
@@small-font
- 2022-02-25: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-26\\
@@


# Message Board ✨
{{ addcomments }}