using Dates, OrderedCollections


####################################
#  [1]. Blog and Tag
####################################
const FIRST_YEAR = 2021

function hfun_posts()
    curyear = year(Dates.today())
    io = IOBuffer()
    for year in curyear:-1:FIRST_YEAR
        ys = "$year"
        isdir(joinpath("blog", ys)) || continue
        write(io, "\n\n### $year\n\n")
        write(io, "@@list,mb-5\n")
        for month in 12:-1:1
            ms = "0"^(month < 10) * "$month"
            base = joinpath("blog", ys, ms)
            isdir(base) || continue
            posts = filter!(p -> endswith(p, ".md"), readdir(base))
            days  = zeros(Int, length(posts))
            lines = Vector{String}(undef, length(posts))
            for (i, post) in enumerate(posts)
                ps  = splitext(post)[1]
                url = "/blog/$ys/$ms/$ps/"
                surl = strip(url, '/')
                title = pagevar(surl, :title)
                # println(pagevar(surl, :navigation))
                days[i] = parse(Int, first(ps, 2))
                pubdate = Dates.format(
                    Date(year, month, days[i]), "U d")

                tmp = "* ~~~<span class=\"post-date\">$pubdate</span><a href=\"$url\">$title</a>"
                descr = pagevar(surl, :descr)
                if descr !== nothing
                    tmp *= ": <span class=\"post-descr\">$descr</span>"
                end
                lines[i] = tmp * "~~~\n"
            end
            # sort by day
            foreach(line -> write(io, line), lines[sortperm(days, rev=true)])
        end
        write(io, "@@\n")
    end
    
    return Franklin.fd2html(String(take!(io)), internal=true)
end


@delay function hfun_list_tags()
    tagpages = globvar("fd_tag_pages")
    if tagpages === nothing
        return ""
    end
    tags = tagpages |> keys |> collect |> sort
    tags_num = length(tags)
    tags_count = [length(tagpages[t]) for t in tags]
    io = IOBuffer()
    write(io, """<div class="terms">""")
    write(io, """<p class="terms-title">Total Tags Number: $tags_num</p>""")
    for (t, c) in zip(tags, tags_count)
            write(io, """
              <a href=\"/tag/$t/\" class=\"tag-link\">$(replace(t, "_" => " "))<span class="tag-count"><sup>$c</sup></span></a>
            """)
    end
    write(io, """</div>""")
    return String(take!(io))
end

# doesn't need to be delayed because it's generated at tag generation, after everything else
function hfun_tag_list()
    tag = locvar(:fd_tag)::String
    items = Dict{Date,String}()
    for rpath in globvar("fd_tag_pages")[tag]
        title = pagevar(rpath, "title")
        # println(typeof(title))  #yf
        url = Franklin.get_url(rpath)
        surl = strip(url, '/')

        ys, ms, ps = split(surl, '/')[end-2:end]
        date = Date(parse(Int, ys), parse(Int, ms), parse(Int, first(ps, 2)))
        date_str = Dates.format(date, "U d, Y")

        tmp = "* ~~~<span class=\"post-date tag\">$date_str</span><nobr><a href=\"$url\">$title</a></nobr>"
        descr = pagevar(rpath, :descr)
        if descr !== nothing
            tmp *= ": <span class=\"post-descr\">$descr</span>"
        end
        tmp *= "~~~\n"
        items[date] = tmp
    end
    sorted_dates = sort!(items |> keys |> collect, rev=true)
    io = IOBuffer()
    write(io, """~~~<div class="franklin-content">~~~\n""")
    write(io, """~~~<div class="posts-container mx-auto px-3 py-5 list mb-5">~~~\n""")
    # write(io, "@@posts-container,mx-auto,px-3,py-5,list,mb-5\n")
    for date in sorted_dates
        write(io, items[date])
    end
    # write(io, "@@")
    write(io, """~~~</div>~~~""")
    write(io, """~~~</div>~~~""")
    return Franklin.fd2html(String(take!(io)), internal=true)
end

function hfun_current_tag()
    return replace(locvar("fd_tag"), "_" => " ")
end

hfun_svg_linkedin() = """<svg width="30" height="30" viewBox="0 50 512 512"><path fill="currentColor" d="M150.65 100.682c0 27.992-22.508 50.683-50.273 50.683-27.765 0-50.273-22.691-50.273-50.683C50.104 72.691 72.612 50 100.377 50c27.766 0 50.273 22.691 50.273 50.682zm-7.356 86.651H58.277V462h85.017V187.333zm135.901 0h-81.541V462h81.541V317.819c0-38.624 17.779-61.615 51.807-61.615 31.268 0 46.289 22.071 46.289 61.615V462h84.605V288.085c0-73.571-41.689-109.131-99.934-109.131s-82.768 45.369-82.768 45.369v-36.99z"/></svg>"""

hfun_svg_github() = """<svg width="30" height="30" viewBox="0 0 25 25" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"/></svg>"""

hfun_svg_twitter() = """<svg width="30" height="30" viewBox="0 0 335 276" fill="currentColor"><path d="M302 70A195 195 0 0 1 3 245a142 142 0 0 0 97-30 70 70 0 0 1-58-47 70 70 0 0 0 31-2 70 70 0 0 1-57-66 70 70 0 0 0 28 5 70 70 0 0 1-18-90 195 195 0 0 0 141 72 67 67 0 0 1 116-62 117 117 0 0 0 43-17 65 65 0 0 1-31 38 117 117 0 0 0 39-11 65 65 0 0 1-32 35"/></svg>"""

hfun_svg_tag() = """<a href="/tags/" id="tag-icon"><svg width="20" height="20" viewBox="0 0 512 512"><defs><style>.cls-1{fill:#141f38}</style></defs><path class="cls-1" d="M215.8 512a76.1 76.1 0 0 1-54.17-22.44L22.44 350.37a76.59 76.59 0 0 1 0-108.32L242 22.44A76.11 76.11 0 0 1 296.2 0h139.2A76.69 76.69 0 0 1 512 76.6v139.19A76.08 76.08 0 0 1 489.56 270L270 489.56A76.09 76.09 0 0 1 215.8 512zm80.4-486.4a50.69 50.69 0 0 0-36.06 14.94l-219.6 219.6a51 51 0 0 0 0 72.13l139.19 139.19a51 51 0 0 0 72.13 0l219.6-219.61a50.67 50.67 0 0 0 14.94-36.06V76.6a51.06 51.06 0 0 0-51-51zm126.44 102.08A38.32 38.32 0 1 1 461 89.36a38.37 38.37 0 0 1-38.36 38.32zm0-51a12.72 12.72 0 1 0 12.72 12.72 12.73 12.73 0 0 0-12.72-12.76z"/><path class="cls-1" d="M217.56 422.4a44.61 44.61 0 0 1-31.76-13.16l-83-83a45 45 0 0 1 0-63.52L211.49 154a44.91 44.91 0 0 1 63.51 0l83 83a45 45 0 0 1 0 63.52L249.31 409.24a44.59 44.59 0 0 1-31.75 13.16zm-96.7-141.61a19.34 19.34 0 0 0 0 27.32l83 83a19.77 19.77 0 0 0 27.31 0l108.77-108.7a19.34 19.34 0 0 0 0-27.32l-83-83a19.77 19.77 0 0 0-27.31 0l-108.77 108.7z"/><path class="cls-1" d="M294.4 281.6a12.75 12.75 0 0 1-9-3.75l-51.2-51.2a12.8 12.8 0 0 1 18.1-18.1l51.2 51.2a12.8 12.8 0 0 1-9.05 21.85zM256 320a12.75 12.75 0 0 1-9.05-3.75l-51.2-51.2a12.8 12.8 0 0 1 18.1-18.1l51.2 51.2A12.8 12.8 0 0 1 256 320zM217.6 358.4a12.75 12.75 0 0 1-9-3.75l-51.2-51.2a12.8 12.8 0 1 1 18.1-18.1l51.2 51.2a12.8 12.8 0 0 1-9.05 21.85z"/></svg></a>"""


@delay function hfun_page_tags()
    pagetags = globvar("fd_page_tags")
    pagetags === nothing && return ""
    io = IOBuffer()
    tags = pagetags[splitext(locvar("fd_rpath"))[1]] |> collect |> sort
    several = length(tags) > 1
    write(io, """<div class="tags">$(hfun_svg_tag()) """)
    for tag in tags[1:end-1]
        t = replace(tag, "_" => " ")
        write(io, """<a href="/tag/$tag/">$t</a>, """)
    end
    tag = tags[end]
    t = replace(tag, "_" => " ")
    write(io, """<a href="/tag/$tag/">$t</a></div>""")
    return String(take!(io))
end



####################################
#  [2]. navigation
####################################
function hfun_navigation()
  isempty(Franklin.PAGE_HEADERS) && return ""
  io = IOBuffer()
  write(io, """<div id="navbar">""")
  write(io, """<div class="sidebar sticky">""")
  write(io, """<nav class="nav__list">""")
  write(io, """<input id="ac-toc" name="accordion-toc" type="checkbox">""")
  write(io, """<label for="ac-toc">Toggle Menu</label>""")
 
  # 1.title classification
  key_title = 0
  md_titles = OrderedDict{Int64,Any}()
  for (key, val) in Franklin.PAGE_HEADERS
      order = val[3]
      if order == 1
          key_title += 1
          dict_one = OrderedDict()
          setindex!(dict_one, val, key)
          setindex!(md_titles, dict_one, key_title)
      elseif order == 2
          setindex!(md_titles[key_title], val, key)
      end
  end
  # 2.write(io) for page-content
  write(io, """<ul class="nav__items">""")
  for i = 1:key_title
      key = first(md_titles[i])[1]
      val = first(md_titles[i])[2]
      # title-level-1
      write(io, "<li>")
      write(io, """<div class="nav__sub-title">""")
      write(io, """<a  href=\"#$key\">$(val[1])</a>""")
      write(io, """</div>""")
      # title-level-small
      order=0
      order_base = first(md_titles[i])[2][3]
      for (key, val) in md_titles[i]
          if key != first(md_titles[i])[1]
              order = val[3]
              gap = order - order_base
              order_base = order
              if gap>0
                  for i=1:gap 
                      println(io, "<ul>")
                  end
              end
              if gap<0
                  for i=1:-gap
                      println(io, "</ul>")
                  end
              end
              text = string("- ", val[1])
              println(io, """<li><a href=\"#$key\" class="active">$(text)</a></li>""")
          end
      end
      for i = 1:order-first(md_titles[i])[2][3]
          println(io, "</ul>")
      end
      write(io, "</li>\n")
  end
  write(io, "</ul>")
  write(io, """</nav>""")
  write(io, """</div>""")
  write(io, """</div>""")

  return String(take!(io))
end


####################################
#  [3]. utteranc
####################################

"""
    {{ addcomments }}

Add a comment widget, managed by utterances <https://utteranc.es>.
"""
function hfun_addcomments()
    html_str = """
        <script src="https://utteranc.es/client.js"
            repo="OUCyf/Website-Comment"
            issue-term="pathname"
            label="Comment"
            theme="github-light"
            crossorigin="anonymous"
            async>
        </script>
    """
    return html_str
end



####################################
#  [4]. youtube video
####################################
"""
    {{youtube Hz9IMJuW5hU}}
Add a youtube video
"""
function hfun_youtube(params)
    id = params[1]
    return """
        <div style=position:relative;padding-bottom:56.25%;height:0;overflow:hidden>
          <iframe
            src=https://www.youtube.com/embed/$id
            style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border:0;"
            allowfullscreen
            title="YouTube Video">
          </iframe>
        </div>
        """
end



####################################
#  [5]. Makie video
####################################
"""
    \video{name [, autoplay = false, loop = true, controls = true]}
Add a makie vedio
"""
function lx_video(lxc, _)
    params = split(Franklin.stent(lxc.braces[1]), ",", limit = 2)
    rpath, kwstring = params[1], length(params) == 1 ? "" : params[2]
    alt = ""

    param_namedtuple = eval(Meta.parse("(;" * kwstring * ")"))

    path  = Franklin.parse_rpath(rpath; canonical=false, code=true)
    fdir, fext = splitext(path)

    # there are several cases
    # A. a path with no extension --> guess extension
    # B. a path with extension --> use that
    # then in both cases there can be a relative path set but the user may mean
    # that it's in the subfolder /output/ (if generated by code) so should look
    # both in the relpath and if not found and if /output/ not already last dir
    candext = ifelse(isempty(fext),
    (".mp4", ".mkv", ".mov"), (fext,))
    for ext ∈ candext
        candpath = fdir * ext
        syspath  = joinpath(Franklin.PATHS[:site], split(candpath, '/')...)
        isfile(syspath) && return html_video(candpath, alt; param_namedtuple...)
    end
    # now try in the output dir just in case (provided we weren't already
    # looking there)
    p1, p2 = splitdir(fdir)
    if splitdir(p1)[2] != "output"
        for ext ∈ candext
            candpath = joinpath(p1, "output", p2 * ext)
            syspath  = joinpath(Franklin.PATHS[:site], split(candpath, '/')...)
            isfile(syspath) && return html_video(candpath, alt; param_namedtuple...)
        end
    end
    return Franklin.html_err("Video matching '$path' not found.")
end

function html_video(path, alt; controls::Bool = true, loop::Bool = true, autoplay::Bool = false)
    """
    ~~~
    <video src="$path" width="100%" $(controls ? "controls" : "") $(loop ? "loop" : "") $(autoplay ? "autoplay muted playsinline" : "")></video>
    ~~~
    """
end
