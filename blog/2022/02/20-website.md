+++
title = "About the Website &ndash; Overview"
descr = ""
tags = ["website","git","CI-CD","github","franklin-jl"]
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
<!-- \toc -->




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

\note{
**git** usage: please refer to [git](/blog/2022/02/20-git/) document; **html-css** usage: please refer to [html-css](/blog/2022/02/20-html-css/) document.
}

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



## Build from scratch

Build new template from `FranklinTemplate.jl`

```julia-repl
julia> using Franklin
julia> newsite("mySite", template="minimal-mistakes")
julia> serve()
```

Then if you want to get a web like JTS, please refer to following:

- **CSS**: compare `mtSite` with `JTS`, do not change `franklin.css` and `minimal-mistakes.css` in `_css` folder, add `adjust-yinfu.css` and `bootstrap.min.css` into folder.
- **Javascript**: add `lunr.js` `navbar.js` `pad.js` `slider.js` into `_libs` folder.
- **HTML**: modify your own `HTML` files in `_layout` folder.
- **Adjust**: hide line 1326 and 1328 in `minimal-mistakes.css` as following:

```css
table {
  /* display: block; */
  margin-bottom: 1em;
  width: 100%;
  font-family: -apple-system, BlinkMacSystemFont, "Roboto", "Segoe UI", "Helvetica Neue", "Lucida Grande", Arial, sans-serif;
  /* font-size: 0.75em; */
  border-collapse: collapse;
  overflow-x: auto;
}
```

- **utils.jl**: add JTS `utils.jl`.

- **project.tomal**: 

When you have a `project.toml` file, whenever you start the server, Franklin will now activate the environment with that `Project.toml`

```julia-repl
(1.x) pkg> activate .
(myWebsite) pkg> add PyCall # add your packages
```

Once that's done, if you now start the server, Franklin will write

```julia-repl
julia> serve()
Activating environment at `~/Desktop/myWebsite/Project.toml`
```

Now you will get a JTS website from scratch.


## Deploying on Github

### Creating a repo
Your repository must be named username.github.io for a personal website, but for a project website it diff, please refer to Franklin.jl [document](https://franklinjl.org/workflow/deploy/).

### Synchronise your local folder
I usually have 3 branches, `master` branch is used to release new version; `dev` branch is used to write new blogs and have other changes; when the new blogs or code test passed in `dev` branch, `merge` branch `dev` into `master` branch. Now you can release your new website. The third branch `gh-pages` is used to store the html file. In your terminal, `cd` to your website folder and follow the steps below:

- In `dev` branch:
```bash
> cd OUCyf.github.io
> git switch dev
> git add .
> git commit -m "new blogs"
> git push origin dev
> git swtich master
```

- In `master` branch:
```bash
> git diff master dev # find the difference between master and dev branch
> git merge --no-ff -m "merge dev with new blogs" dev
> git status # check out the status
> git push origin master
> git switch dev # do next change
```

the GitHub action will be triggered and deploy the content of the `__site` folder to the `gh-pages` branch from which GitHub will deploy the website. The final step is to tell GitHub to deploy the gh-pages branch, for this, on the repository go to `Settings` then scroll down to `GitHub Pages` and in the `Source` dropdown, pick `gh-pages`.

Your website should now be online.

### Customising the GitHub action
Modify the file `.github/workflows/deploy.yml` in site folder, my `deploy.yml` show below:
```YAML
name: Build and Deploy
on:
  push:
    branches:
      - master  # when push to master will trigger the CI/CD, not the dev branch
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        persist-credentials: false

    # NOTE: Python is necessary for the pre-rendering (minification) step
    - name: Install python
      uses: actions/setup-python@v2
      with:
        python-version: '3.8'
    # NOTE: Here you can install dependencies such as matplotlib if you use
    # packages such as PyPlot.
    - run: pip install matplotlib

    - name: Install Julia
      uses: julia-actions/setup-julia@v1
      with:
        version: 1.7
    # NOTE
    #   The steps below ensure that NodeJS and Franklin are loaded then it
    #   installs highlight.js which is needed for the prerendering step
    #   (code highlighting + katex prerendering).
    #   Then the environment is activated and instantiated to install all
    #   Julia packages which may be required to successfully build your site.
    #   The last line should be `optimize()` though you may want to give it
    #   specific arguments, see the documentation or ?optimize in the REPL.
    - run: julia -e '
            using Pkg; 
            Pkg.add(["NodeJS", "Franklin", "OrderedCollections", "Makie"]);
            using NodeJS; 
            run(`$(npm_cmd()) install highlight.js`);
            run(`$(npm_cmd()) install lunr`);
            run(`$(npm_cmd()) install cheerio`);
            using Franklin;
            Pkg.activate("."); 
            Pkg.instantiate();
            serve(single=true, cleanup=false);
            lunr();
            optimize(minify=false, prerender=false)'
    - name: Build and Deploy
      uses: JamesIves/github-pages-deploy-action@releases/v3
      with:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        BRANCH: gh-pages  # store html files
        FOLDER: __site  # folder
```



## History:
@@small-font
- 2022-02-20: draft
- 2022-02-21: full edition
- 2022-02-22: add `project.tomal` file
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-22
@@

# Message Board ✨
{{ addcomments }}