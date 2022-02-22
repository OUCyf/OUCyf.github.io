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



@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-20
@@

\note{If you already have experience with Franklin and just want to keep an eye on (new) tips and tricks, have a look at the short [demos](/demos/)
}

\warn{If you already have experience with Franklin and just want to keep an eye on (new) tips and tricks, have a look at the short [demos](/demos/)
}


| Name | Source | License | Navbar | JS  |
| ---- | ------ | ------- | ----- | --- |
| `"sandbox"`  | N/A    | MIT     | N/A | No |
| `"sandbox-extended"`  | N/A    | MIT     | N/A | No |
| `"basic"`  | N/A    | MIT     | Top | No |
| `"jemdoc"` | [jemdoc](https://github.com/jem/jemdoc) | N/A | Side | No |
| `"hypertext"` | [grav theme hypertext](https://github.com/artofthesmart/hypertext) | [MIT](https://github.com/artofthesmart/hypertext/blob/master/LICENSE) | Top | No |
| `"pure-sm"` | [pure css](https://purecss.io/layouts/side-menu/) | [Yahoo BSD](https://github.com/pure-css/pure-site/blob/master/LICENSE.md) | Side | No |
| `"vela"` | [grav theme vela](https://github.com/danzinger/grav-theme-vela) | [MIT](https://github.com/danzinger/grav-theme-vela/blob/develop/LICENSE) | Side (collapsable) | Yes |
| `"tufte"` | [Tufte CSS](https://github.com/edwardtufte/tufte-css), and a bit of [Lawler.io](https://github.com/Eiriksmal/lawler-dot-io) for the menu | [both](https://github.com/edwardtufte/tufte-css/blob/gh-pages/LICENSE)  [MIT](https://github.com/Eiriksmal/lawler-dot-io/blob/main/license.md) | Side | No |
| `"hyde"` | [Hyde](https://github.com/poole/hyde) | [MIT](https://github.com/poole/hyde/blob/master/LICENSE.md) | Side | No |
| `"lanyon"` | [Lanyon](https://github.com/poole/lanyon) | [MIT](https://github.com/poole/lanyon/blob/master/LICENSE.md) | Side (collapsable) | No |
| `"just-the-docs"` | [Just the docs](https://github.com/pmarsceill/just-the-docs) | [MIT](https://github.com/pmarsceill/just-the-docs/blob/master/LICENSE.txt) | Side/Top | No |
| `"minimal-mistakes"` | [Minimal mistakes](https://github.com/mmistakes/minimal-mistakes) | [MIT](https://github.com/mmistakes/minimal-mistakes/blob/master/LICENSE) | Side/Top | No |




## vedio

~~~
<input id="hidecode" class="hidecode" type="checkbox">
~~~
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
println("sssssss")
```
~~~
<label for="hidecode" class="hidecode"></label>
~~~

@@julia-video \video{lorenz.mp4, autoplay = true} @@





hhhhe1


```!
using CairoMakie
CairoMakie.activate!() # hide

f = Figure()

ax = Axis(f[1, 1], xlabel = "x label", ylabel = "y label",
    title = "Title")
save(joinpath(@OUTPUT, "comp_1.png"),f) # hide
save(joinpath(@OUTPUT, "comp_1.svg"),f) # hide
f
```

@@julia-fig \fig{comp_1.svg}@@


```!
println("SSSsss")
println("SSSsss")
println("SSSsss")

```

```julia:tr
println("222SSSsss")
println("SSSsss")
println("SSSsss")

```

@@ctable
Operation | Cost
:--- | :---
initial computation of $X^tX$ | $O(np^2)$
initial SVD of $X^tX$ | $O(p^3)$
computation of $VD_λz$ | $O(p^2)$ per $λ$
@@

@@ctable
Operation | Dominating Cost
:--- | :---
initial computation of $XX^t$ | $O(pn^2)$
initial SVD of $XX^t$ | $O(n^3)$
initial computation of $w = U^ty$ | $O(pn)$
computation of $X^t U D_λ w$ | $O(np)$ per $λ$
@@


| Heading 1 | Heading 2 | Heading 3 |
|-----------|-----------|-----------|
| LaTeX     | KaTeX     | MikTeX    |

s
---

ss
---

* item 1
* item 2
  * sub-item 1
    * sub-item 1
      * sub-item 1


1. item 1
1. item 2
  1. d
  1. subitem 1
    22. d
    1. dd



```plaintext
cd sksk
using j
kdkd
```


```julia:snippet1
using LinearAlgebra, Random
Random.seed!(555)
a = randn(5)
round(norm(a), sigdigits=4)
```

\show{snippet1}


```julia:gen
testcsv = "h1,h2,h3
152,some string, 1.5f0
0,another string,2.87"
write(joinpath(@OUTPUT,"testcsv.csv"), testcsv)
```

\tableinput{custom h1,custom h2,custom h3}{./code/output/testcsv.csv}


{{ addcomments }}
