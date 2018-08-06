# Networks {#network}

![](images/banners/banner_network.png)

<!--## ggnetwork (static)-->

## visNetwork (interactive)

`visNetwork` is a powerful R implementation of the interactive JavaScript `vis.js` library; it uses `tidyverse` piping: https://datastorm-open.github.io/visNetwork/

--> The Vignette has clear worked-out examples: https://cran.r-project.org/web/packages/visNetwork/vignettes/Introduction-to-visNetwork.html


The `visNetwork` documentation doesn't provide the same level of explanation as the original, so it's worth checking out the `vis.js` documentation as well:
http://visjs.org/index.html  In particular, the [interactive examples](http://visjs.org/network_examples.html){target="_blank"} are particularly useful for trying out different options. For example, you can test out physics options with this [network configurator](http://visjs.org/examples/network/physics/physicsConfiguration.html){target="_blank"}. 


### Minimum working example

Create a [node data frame](https://datastorm-open.github.io/visNetwork/nodes.html){target="_blank"} with a minimum one of column (must be called `id`) with node names:


```r
# nodes
boroughs <- data.frame(id = c("The Bronx", "Manhattan", "Queens", "Brooklyn", "Staten Island"))
```


Create a separate data frame of [edges](https://datastorm-open.github.io/visNetwork/edges.html){target="_blank"} with `from` and `to` columns. 



```r
# edges
connections <- data.frame(from = c("The Bronx", "The Bronx", "Queens", "Queens", "Manhattan", "Brooklyn"), to = c("Manhattan", "Queens", "Brooklyn", "Manhattan", "Brooklyn", "Staten Island"))
```


Draw the network with `visNetwork(nodes, edges)`


```r
library(visNetwork)
visNetwork(boroughs, connections)
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-5b7c466707610ce73f0c" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-5b7c466707610ce73f0c">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-ebb9babef189d27f3f8e" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-ebb9babef189d27f3f8e">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master


Add labels by adding a label column to `nodes`:


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
boroughs <- boroughs %>% mutate(label = id)
visNetwork(boroughs, connections)
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-e208052f17dde1fcf45f" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-e208052f17dde1fcf45f">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-d71b40d9a372a721a6d0" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-d71b40d9a372a721a6d0">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master



### Performance

`visNetwork` can be very slow. 

`%>% visPhysics(stabilization = FALSE)` starts rendering before the stabilization is complete, which does actually speed things up but allows you to see what's happening, which makes a big difference in user experience.  (It's also fun to watch the network stabilize).  Other performance tips are described [here](https://datastorm-open.github.io/visNetwork/performance.html){target="_blank"}.
  
### Helpful configuration tools  
  
`%>% visConfigure(enabled = TRUE)` is a useful tool for configuring options interactively.  Upon completion, click "generate options" for the code to reproduce the settings. More [here](https://datastorm-open.github.io/visNetwork/configure.html){target="_blank"} (Note that changing options and then viewing them requires a lot of vertical scrolling in the browser.  I'm not sure if anything can be done about this. If you have a solution, let me know!)
  
### Coloring nodes

Add a column of actual color names to the nodes data frame:


```r
boroughs <- boroughs %>% mutate(is.island = c(FALSE, TRUE, FALSE, FALSE, TRUE)) %>% mutate(color = ifelse(is.island, "blue", "yellow"))
visNetwork(boroughs, connections)
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-0b4c4e15b5e2e01b2352" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-0b4c4e15b5e2e01b2352">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-bea0d311d9ee6601ae67" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-bea0d311d9ee6601ae67">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master

### Directed nodes (arrows)


```r
visNetwork(boroughs, connections) %>% 
  visEdges(arrows = "to;from", color = "green")
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-90c9e8bf669cd84f74a0" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-90c9e8bf669cd84f74a0">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"arrows":"to;from","color":"green"}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-f2639b68a2a63b59bb48" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-f2639b68a2a63b59bb48">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"arrows":"to;from","color":"green"}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master

### Turn off the physics simulation

It's much faster without the simulation. The nodes are randomly placed and can be moved around without affecting the rest of the network, at least in the case of small networks.


```r
visNetwork(boroughs, connections) %>% 
  visEdges(physics = FALSE)
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-dcc9240c73840424b4ff" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-dcc9240c73840424b4ff">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"physics":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-d71a69e59f81045ce184" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-d71a69e59f81045ce184">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"physics":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master

### Grey out nodes far from selected (defined by "degree")

(Click a node to see effect.)


```r
# defaults to 1 degree
visNetwork(boroughs, connections) %>% 
  visOptions(highlightNearest = TRUE)
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-4301e97ebe28249c9db8" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-4301e97ebe28249c9db8">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-5b933ac72f16ba8db971" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-5b933ac72f16ba8db971">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master

```r
# set degree to 2
visNetwork(boroughs, connections) %>% 
  visOptions(highlightNearest = list(enabled = TRUE, 
                                     degree = 2))
```

<<<<<<< HEAD
<!--html_preserve--><div id="htmlwidget-397009fe3fcf4def9ee0" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-397009fe3fcf4def9ee0">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":2,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
=======
<!--html_preserve--><div id="htmlwidget-d79a1fcd6e4082c12ae4" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-d79a1fcd6e4082c12ae4">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":2,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
>>>>>>> master

