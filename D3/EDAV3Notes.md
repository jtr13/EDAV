EDAV3 Notes
================

Adding D3 to `html` file
========================

Start with bare minimum `html` (w/ D3):

``` html
    <head>
        <meta charset="utf-8">
        <title>EDAV3</title>
        <script src="https://d3js.org/d3.v4.min.js"></script>
    </head>

    <body>
    </body>
```

Add svg
=======

``` js
<script id="s1">
d3.select("body").append("svg").attr("width", "500")
    .attr("height", "400");
</script>
```

Add more elements
=======

``` js
<script id="s2">
d3.select("body").append("svg").attr("width", "500")
    .attr("height", "400");
d3.select("svg").append("rect").attr("x", "0").attr("y", "0")
    .attr("width", "500").attr("height", "400").attr("fill", "lightblue");
d3.select("svg").append("circle").attr("cx", "200")
    .attr("cy", "100").attr("r", "25").attr("fill", "orange");
d3.select("svg").append("circle").attr("cx", "300")
    .attr("cy", "150").attr("r", "25").attr("fill", "red");  
</script>
```

Store selection in a variable
=======

Console:
``` js
var svg = d3.select("svg");
svg
var a = d3.select("svg").append("circle");
a
a.attr("cx", "300").attr("cy", "200").attr("r", "15").attr("fill", "green");  
var circ=d3.selectAll("circle");
circ.attr("fill", "blue");
```


Store selection in a variable
=======

``` js
<script id="s3">
var svg = d3.select("body").append("svg")
    .attr("width", "500").attr("height", "400");
svg.append("rect").attr("x", "0").attr("y", "0")
      .attr("width", "500").attr("height", "400").attr("fill", "lightblue");
svg.append("circle").attr("cx", "250").attr("cy", "150")
    .attr("r", "20").attr("fill", "blue");
</script>
```

Transitions start immediately
=======

``` js
<script id="s4">
var svg = d3.select("body").append("svg")
    .attr("width", "500").attr("height", "400");
svg.append("rect").attr("x", "0").attr("y", "0")
      .attr("width", "500").attr("height", "400").attr("fill", "lightblue");
svg.append("circle").attr("cx", "250").attr("cy", "150")
    .attr("r", "20").attr("fill", "blue");
svg.append("ellipse").attr("cx", "150").attr("cy", "100")
    .attr("rx", "30").attr("ry", "50").attr("fill", "yellow");
d3.select("circle").transition().duration(2000)
    .attr("cx", "400");
d3.select("ellipse").transition().duration(2000)
    .attr("cy","300");
</script>
```

Let's make them go back... not quite!
=======
``` js
<script id="s5">
var svg = d3.select("body").append("svg")
    .attr("width", "500").attr("height", "400");
svg.append("rect").attr("x", "0").attr("y", "0")
      .attr("width", "500").attr("height", "400").attr("fill", "lightblue");
svg.append("circle").attr("cx", "250").attr("cy", "150")
    .attr("r", "20").attr("fill", "blue");
svg.append("ellipse").attr("cx", "150").attr("cy", "100")
    .attr("rx", "30").attr("ry", "50").attr("fill", "yellow");
d3.select("circle").transition().duration(2000)
    .attr("cx", "400");
d3.select("ellipse").transition().duration(2000)
    .attr("cy","300");
d3.select("circle").transition().duration(2000)
    .attr("cx", "250");
d3.select("ellipse").transition().duration(2000)
    .attr("cy","100");
</script>
```

Add a delay
=======
``` js
<script id="">

</script>
```

Use `.on("end", function() {})`
=======
``` js
<script id="">

</script>
```

Practice
=======
``` js
<script id="">

</script>
```

Binding data... (fi)
=======
``` js
<script id="">

</script>
```
