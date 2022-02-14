@def title = "Search"
@def hidden = true


~~~<p class="wordcloud"><img src="/assets/animation-padding.gif"></p>~~~

~~~
<form id="lunrSearchForm" name="lunrSearchForm">
    <input class="search-input" name="q" placeholder="Enter search term" type="text">
    <div class="search-icon">
        <a><i class="fa fa-search"></i></a>
    </div>
    <input class="search-enter" type="submit" value="✔️" formaction="/search/index.html">
</form>
~~~




# Search Result
Number of results found: ~~~<span id="resultCount"></span>~~~
~~~<div id="searchResults"></div>~~~