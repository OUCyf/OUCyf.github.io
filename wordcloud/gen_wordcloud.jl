using WordCloud
using Random

##############################
## 0. logo
##############################
Luxor = WordCloud.Render.Luxor

function cloudshape(height, args...; backgroundcolor=(0, 0, 0, 0))
    height = ceil(height)
    r = height / 2
    d = Luxor.Drawing((2.2height, 3height)..., :svg)
    Luxor.origin()
    Luxor.background(parsecolor(backgroundcolor))
    Luxor.setcolor(parsecolor((0.22, 0.596, 0.149)))
    Luxor.pie(0, 0, r, 0, 2π, :fill)
    Luxor.setcolor(parsecolor((0.584, 0.345, 0.698)))
    Luxor.pie(1r, 1.732r, r, -π, π, :fill)
    Luxor.setcolor(parsecolor((0.796, 0.235, 0.20)))
    Luxor.Luxor.pie(-1r, 1.732r, r, -π, π, :fill)
    Luxor.finish()
    return d
end

words = repeat(["just", "the", "seismology"], 70)
weights = randexp(length(words)) .* 2000 .+ rand(20:100, length(words));
# weights = repeat([1], length(words))
wc = wordcloud(
    words,
    weights,
    mask=cloudshape(500),
    transparent=(0, 0, 0, 0),
    colors=1,
    angles=-90:0,
    font="JuliaMono Black",
    density=0.7,
    )
generate!(wc, 2000, retry=1)
recolor!(wc, style=:main)
paint(wc, "logo2.png", background=false)


##############################
## 1. gif
##############################
textfile = "./docs/docs.txt"
wc = wordcloud(
    processtext(open(textfile), maxweight=1, maxnum=300), 
    mask=shape(ellipse, 600, 400, color=(0.98, 0.97, 0.99), backgroundsize=(700, 450)),  # , backgroundcolor=1
    colors=:seaborn_icefire_gradient,
    angles=-90:90,
    font = "JuliaMono Black",
    state=identity, # turn off the useless initword! and placewords! in advance
)

setwords!(wc, "source", "Just the Seismology") # replace the word 'Alice' with 'Alice in Wonderland'
setangles!(wc, "Just the Seismology", 0) # make it horizontal
setcolors!(wc, "Just the Seismology", "purple");
setfontsizes!(wc, "Just the Seismology", size(wc.mask, 2) / length("Just the Seismology"))
initword!(wc, "Just the Seismology")
r = size(wc.mask, 2) / size(getimages(wc, "Just the Seismology"), 2) * 0.95
setfontsizes!(wc, "Just the Seismology", r * size(wc.mask, 2) / length("Just the Seismology")) # set a big font size
initword!(wc, "Just the Seismology") # init it after adjust it's style
setpositions!(wc, "Just the Seismology", reverse(size(wc.mask)) .÷ 2, type=setcenter!) # center it

pin(wc, "Just the Seismology") do
    initwords!(wc) # init inside `pin` to reset the size of other words
    generate!(wc)
end
paint(wc, "custom-2.png")


gifdirectory = "animation-1"
pin(wc, "Just the Seismology") do
    initwords!(wc) # init inside `pin` to reset the size of other words
    @record gifdirectory overwrite=false generate!(wc, 100, optimiser=WordCloud.Momentum())
end 


##############################
# ## 2. with a mask-png
##############################
# textfile = "docs.txt"
# maskfile = "seismogram.png"
# # textfile = pkgdir(WordCloud)*"/res/alice.txt"
# # maskfile = pkgdir(WordCloud)*"/res/alice_mask.png"
# wc = wordcloud(
#     processtext(open(textfile), maxnum=2000), 
#     mask = maskfile,
#     maskcolor="gray",
#     outline = 1,
#     linecolor = "gray",
#     colors = ("#006BB0"),
#     angles = -90: 90,
#     font = "Tahoma",
#     density = 0.6) |> generate!
# paint(wc, "seismogram_wordcloud-3.png", ratio=0.5)


##############################
# ## 3. with a word
##############################
# mask = rendertext("seismogram", 1000, border=10, color=0.9, backgroundcolor=0.98, type=:svg, font="Sans Bold")
# words = repeat(["What", "Does", "not", "Kill", "You", "Makes", "You", "Stranger"], 150)
# weights = repeat([1], length(words))
# wc = wordcloud(
#         words, weights, 
#         mask=mask,
#         angles=0,
#         colors=("#006BB0", "#EFA90D", "#1D1815", "#059341", "#DC2F1F"),
#         density=0.55,
#         ) |> generate!
# println("results are saved to lettermask.svg")
# paint(wc, "lettermask.png" , background=false)
