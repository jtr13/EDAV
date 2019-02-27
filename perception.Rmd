# (PART) Other Topics {-}

# Perception/Color Resources {#percept}

![](images/banners/banner_percept.png)

## Overview

This section has resources for learning about graphical perception and how to use colors effectively. 

## Perception

Here are some links to some key books/articles on perception:

- [Graphical Perception: Theory, Experimentation, and Application to the Development of Graphical Methods](https://www.jstor.org/stable/2288400){target="_blank"}: Classic article from William Cleveland and Robert McGill
- [The Elements of Graphing Data](https://clio.columbia.edu/catalog/SCSB-8519758){target="_blank"}: Textbook by William Cleveland
- [
Visualizing Data](https://clio.columbia.edu/catalog/SCSB-1389825){target="_blank"}: Textbook by William Cleveland
- [Creating More Effective Graphs](https://clio.columbia.edu/catalog/5291007){target="_blank"}: Textbook by Naomi Robbins

## Color

Color is very subjective. It is important to choose the right ones so that your work is easy to understand.

- [Color Brewer](http://colorbrewer2.org/){target="_blank"}: Excellent resource for getting effective color palettes for different projects. Its main focus is on cartography, but it is super useful for any project involving color. You can choose between different types of data (sequential, diverging, qualitative), ensure your chosen palette is effective for colorblind users (or print friendly or photocopy safe), and easily export the color palette to different formats (Adobe, GIMP/Inkscape, JS, CSS). The best go-to for effective color palettes. 
- [Color Blindness Simulator](http://colorbrewer2.org/){target="_blank"}: Not sure how effective your project will be to a colorblind user? This tool can help. You can upload an image to see how it will look with different color vision handicaps.
- [ColorPick Eyedropper](https://chrome.google.com/webstore/detail/colorpick-eyedropper/ohcpnigalekghcmgcdcenkpelffpdolg?hl=en){target="_blank"}: This Chrome extension allows you to copy hex color values from webpages. Simple and intuitive, it will make creating your awesome color palettes a lot easier.

## Quick tips on using color with `ggplot2`

One of the most common problems is confusing `color` and `fill`. `geom_point()` and `geom_line` use `color`, many of the other geoms use `fill`. Some use both, such as `geom_tile()` in which case `color` is the border color and `fill` is the fill color.

### Continuous data

#### ColorBrewer

+ `scale_color_distiller(palette = "PuBu")` or `scale_fill_distiller(palette = "PuBu")`

(What *doesn't* work: `scale_color_brewer(palette = "PuBu")`)

#### Viridis

+ `scale_color_viridis_c()` or `scale_fill...`  (the c stands for continuous)

#### Create your own

`+ scale_color_gradient(low = "white", high = "red")` or `+ scale_fill...`

`+ scale_color_gradient2(low = "red", mid = "white", high = "blue", midpoint = 50)` or `+ scale_fill...`

`+ scale_color_gradientn(colours = c("red", "pink", "lightblue", "blue"))` or `scale_fill...`


### Discrete data

#### ColorBrewer

+ `scale_color_brewer(palette = "PuBu")` or `scale_fill...`

#### Viridis

+ `scale_color_viridis_d()` or `scale_fill...` (the d stands for discrete)

#### Create your own

`+ scale_color_manual(values = c("red", "yellow", "blue"))` or `scale_fill...`

`+ scale_fill_manual(values = c("red", "yellow", "blue"))` or `scale_fill...`

