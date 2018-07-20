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
<script id="s6">
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
d3.select("circle").transition().delay(2000).duration(2000)
    .attr("cx", "250");
d3.select("ellipse").transition().delay(2000).duration(2000)
    .attr("cy","100");
</script>    
```

Use `.on("end", function() {})`
=======
``` js
<script id="s7">		

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
    .attr("cy","300").on("end", function() {

  d3.select("circle").transition()
      .duration(2000).attr("cx", "250");
  d3.select("ellipse").transition()
      .duration(2000).attr("cy","100");

});
</script>
```

Practice 1
=======
Download and open [EDAV3.html](EDAV3.html)

Create the same visualization we did last class, but this time, build all the elements and execute the transitions from within the .html file:

1. Create an svg, background rectangle, and six circles, one with an id.

1. Move all circles to the right.

1. Move them back to the left and change their color.

1. Move the circle with the id to the right.

1. Move all the circles to the middle of the screen, then move them all to the same location.

Binding data... (*finally*)
=======
``` js
<script id="s8">
  d3.select("body").append("h1").text("Data Driven Documents");
  var svg = d3.select("body").append("svg")
      .attr("width", "500").attr("height", "400");
  svg.append("rect").attr("x", "0").attr("y", "0")
        .attr("width", "500").attr("height", "400").attr("fill", "aliceblue");

  svg.append("circle").attr("cx", "50").attr("cy", "100")
      .attr("r", "20").attr("fill", "blue");
  svg.append("circle").attr("cx", "50").attr("cy", "150")
      .attr("r", "20").attr("fill", "blue");
  svg.append("circle").attr("cx", "50").attr("cy", "200")
      .attr("r", "20").attr("fill", "blue");
  svg.append("circle").attr("cx", "50").attr("cy", "250")
      .attr("r", "20").attr("fill", "blue");
  svg.append("circle").attr("cx", "50").attr("cy", "300")
      .attr("r", "20").attr("fill", "blue");
  svg.append("circle").attr("cx", "50").attr("cy", "350")
      .attr("r", "20").attr("fill", "blue");

</script>
```

Binding data (Console)
=======
``` js
var dataset = [90, 230, 140, 75, 180, 25];

var circ = d3.selectAll("circle");

circ

circ.data(); // nothing there

circ.data(dataset); // check Elements, nothing changed

circ.data();  // now we see data

circ.attr("cx", function(d) {return d;});

circ.attr("cx", function(d) {return d/2;});

circ.attr("cx", function(d) {return d/4;}).attr("r", "10");

circ.attr("r", d => d/10); // ES6 arrow functions
```

Practice 2
=======
Download and open [EDAV2.html](EDAV2.html)

Either in the Console or in the .html file bind data -- an array of exactly six values -- to the circles and use the data property to modify the circles.
