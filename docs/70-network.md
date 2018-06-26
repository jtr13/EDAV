# Networks {#networks}

![](images/banners/banner_network.png)

## ggnetwork (static)

## visNetwork (interactive)

`visNetwork` is a powerful R implementation of the interactive JavaScript `vis.js` library; it uses `tidyverse` piping: https://datastorm-open.github.io/visNetwork/

--> The Vignette has clear worked-out examples: https://cran.r-project.org/web/packages/visNetwork/vignettes/Introduction-to-visNetwork.html


The `visNetwork` documentation doesn't provide the same level of explanation as the original, so it's worth checking out the `vis.js` documentation as well:
http://visjs.org/index.html  In particular, the [interactive examples](http://visjs.org/network_examples.html) are particularly useful for trying out different options. For example, you can test out physics options with this [network configurator](http://visjs.org/examples/network/physics/physicsConfiguration.html). 


### Minimum working example

Create a [node data frame](https://datastorm-open.github.io/visNetwork/nodes.html)with a minimum one of column (must be called `id`) with node names:


```r
# nodes
boroughs <- data.frame(id = c("The Bronx", "Manhattan", "Queens", "Brooklyn", "Staten Island"))
```


Create a separate data frame of [edges](https://datastorm-open.github.io/visNetwork/edges.html) with `from` and `to` columns. 



```r
# edges
connections <- data.frame(from = c("The Bronx", "The Bronx", "Queens", "Queens", "Manhattan", "Brooklyn"), to = c("Manhattan", "Queens", "Brooklyn", "Manhattan", "Brooklyn", "Staten Island"))
```


Draw the network with `visNetwork(nodes, edges)`


```r
library(visNetwork)
visNetwork(boroughs, connections)
```

<!--html_preserve--><div id="htmlwidget-e03cc5e08ff08febb1e7" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-e03cc5e08ff08febb1e7">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


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

<!--html_preserve--><div id="htmlwidget-fbd2bfcdac57bee5440c" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-fbd2bfcdac57bee5440c">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->



### Performance

`visNetwork` can be very slow. 

`%>% visPhysics(stabilization = FALSE)` starts rendering before the stabilization is complete, which does actually speed things up but allows you to see what's happening, which makes a big difference in user experience.  (It's also fun to watch the network stabilize).  Other performance tips are described [here](https://datastorm-open.github.io/visNetwork/performance.html).
  
### Helpful configuration tools  
  
`%>% visConfigure(enabled = TRUE)` is a useful tool for configuring options interactively.  Upon completion, click "generate options" for the code to reproduce the settings. More [here](https://datastorm-open.github.io/visNetwork/configure.html) (Note that changing options and then viewing them requires a lot of vertical scrolling in the browser.  I'm not sure if anything can be done about this. If you have a solution, let me know!)
  
### Coloring nodes

Add a column of actual color names to the nodes data frame:


```r
boroughs <- boroughs %>% mutate(is.island = c(FALSE, TRUE, FALSE, FALSE, TRUE)) %>% mutate(color = ifelse(is.island, "blue", "yellow"))
visNetwork(boroughs, connections)
```

<!--html_preserve--><div id="htmlwidget-6354068d08661fd88ce9" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-6354068d08661fd88ce9">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### Directed nodes (arrows)


```r
visNetwork(boroughs, connections) %>% 
  visEdges(arrows = "to;from", color = "green")
```

<!--html_preserve--><div id="htmlwidget-921bee152ac7612c40e9" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-921bee152ac7612c40e9">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"arrows":"to;from","color":"green"}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### Turn off the physics simulation

It's much faster without the simulation. The nodes are randomly placed and can be moved around without affecting the rest of the network, at least in the case of small networks.


```r
visNetwork(boroughs, connections) %>% 
  visEdges(physics = FALSE)
```

<!--html_preserve--><div id="htmlwidget-fc81b1d3dcfb4fb2ef01" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-fc81b1d3dcfb4fb2ef01">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false},"edges":{"physics":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false},"byselection":{"enabled":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### Grey out nodes far from selected (defined by "degree")

(Click a node to see effect.)


```r
# defaults to 1 degree
visNetwork(boroughs, connections) %>% 
  visOptions(highlightNearest = TRUE)
```

<!--html_preserve--><div id="htmlwidget-28a90e57aff20d770c17" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-28a90e57aff20d770c17">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
# set degree to 2
visNetwork(boroughs, connections) %>% 
  visOptions(highlightNearest = list(enabled = TRUE, 
                                     degree = 2))
```

<!--html_preserve--><div id="htmlwidget-f1d560d18570b735c762" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-f1d560d18570b735c762">{"x":{"nodes":{"id":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"label":["The Bronx","Manhattan","Queens","Brooklyn","Staten Island"],"is.island":[false,true,false,false,true],"color":["yellow","blue","yellow","yellow","blue"]},"edges":{"from":["The Bronx","The Bronx","Queens","Queens","Manhattan","Brooklyn"],"to":["Manhattan","Queens","Brooklyn","Manhattan","Brooklyn","Staten Island"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot"},"manipulation":{"enabled":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":false,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":2,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->



<!-- Footer -->
<center>
</br></br>
[![EDAV](images/icons/edav_resource_small.png)](https://jtr13.github.io/EDAV/)
</br></br>
</center>
