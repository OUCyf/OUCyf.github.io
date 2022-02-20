+++
title = "About This Website &ndash; Overview"
descr = """
    Generally talk about this website -- Just the Seismology.
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

# Requirements
**Git and Github**
- [Git](https://git-scm.com/)
- [Github](https://github.com/OUCyf/OUCyf.github.io)

**julia**
- [Julia](https://julialang.org/)
- [Franklin.jl](https://github.com/tlienart/Franklin.jl)
- [FranklinTemplates.jl](https://github.com/tlienart/FranklinTemplates.jl)
- [Literate.jl](https://github.com/fredrikekre/Literate.jl)

**CSS**
- [minimal-mistakes.css](https://tlienart.github.io/FranklinTemplates.jl/templates/minimal-mistakes/index.html)
- [franklin.css](https://tlienart.github.io/FranklinTemplates.jl/templates/minimal-mistakes/index.html)
- [bootstrap.css](https://getbootstrap.com/)
- [adjust-yinfu.css](https://github.com/OUCyf/OUCyf.github.io): my personal css.

**Javascript**
- [node.js](https://nodejs.org/en/)
- [highlight.js](https://highlightjs.org/)
- [katex.js](https://katex.org/)
- [lunr.js](https://lunrjs.com/)
- [darkmode.js](https://darkmodejs.learn.uno/)
- [fontawesome.js](https://fontawesome.com/)
- [minimal-mistakes.js](https://tlienart.github.io/FranklinTemplates.jl/templates/minimal-mistakes/index.html)
- [navbar.js](https://github.com/OUCyf/OUCyf.github.io): modify from [Makie.jl](https://github.com/JuliaPlots/Makie.jl/blob/master/docs/_libs/navbar.js)
- [PDF.js](https://mozilla.github.io/pdf.js/): modify from lunr simple [example](https://mozilla.github.io/pdf.js/examples/).
- [slider.js](https://www.youtube.com/watch?v=kCQPg-58t74): modify from Youtube tutorial.





# Brief Introduction



## Quick start

Clone repository with git:

```bash
> git clone git@github.com:OUCyf/OUCyf.github.io.git
> cd OUCyf.github.io
> npm install lunr
> npm install cheerio
```
(you might have to add `sudo` before `npm`).

To install Franklin with Julia **≥ 1.7**,

```julia-repl
(v1.7) pkg> add Franklin
```

You can then just try it out:

```julia-repl
julia> using Franklin
julia> serve(minify=false, prerender=false)
julia> lunr()
julia> serve()
→ Initial full pass...
→ Starting the server...
✓ LiveServer listening on http://localhost:8000/ ...
  (use CTRL+C to shut down)
```

If you navigate to that URL in your browser, you will see the website. If you then open `index.md` in an  editor and modify it at will, the changes will be live rendered in your browser.

\note{
Git: please refer to [git document](/blog/2022/02/20-git/).\\
HTML-CSS: please refer to [html-css document](/blog/2022/02/20-html-css/).
}

## Build from scratch

Build new template from `FranklinTemplate.jl`

```julia-repl
julia> using Franklin
julia> newsite("mySite", template="minimal-mistakes")
julia> serve()
```

Then if you want to get a web like JTS, please refer to following:

- Compare `mtSite` with `JTS`, do not change `franklin.css` and `minimal-mistakes.css` in `_css` folder, add `adjust-yinfu.css` and `bootstrap.min.css` into folder.
- Add `lunr.js` `navbar.js` `pad.js` `slider.js` into `_libs` folder.
- Modify your own `HTML` files in `_layout` folder.






# Message Board ✨

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-20
@@

{{ addcomments }}