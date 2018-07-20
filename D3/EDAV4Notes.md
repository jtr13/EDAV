EDAV4 Notes
================

Binding data
=======
### Number of DOM elements = number of data values

Start with data bound to our six circles:

``` html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>EDAV4Lect</title>
		<script src="https://d3js.org/d3.v4.min.js"></script>
	</head>

	<body>
		<svg width="500" height="500">
			<circle cx="50" cy="100" r="20" fill="blue"></circle>
			<circle cx="50" cy="150" r="20" fill="blue"></circle>
			<circle cx="50" cy="200" r="20" fill="blue"></circle>
			<circle cx="50" cy="250" r="20" fill="blue"></circle>
			<circle cx="50" cy="300" r="20" fill="blue"></circle>
			<circle cx="50" cy="350" r="20" fill="blue"></circle>
		</svg>

<!--Number of data values = number of DOM elements	-->

    <script id="s1">
			var svg = d3.select("svg");
		  var dataset = [34, 123, 70, 187, 200, 324];
		  var circ = svg.selectAll("circle");
	  </script>
  </body>
</html>
```

Check data binding
=======

Console:
``` js
circ.data();
```

Use bound data to modify attributes
=======
``` js
<script id="s2">

  circ.data(dataset);

  circ.attr("fill", "red");

  circ.attr("cx", d => d);

  circ.transition()
      .duration(2000)
      .attr("cx", d => 2*d);

  circ.transition()
      .delay(2000)
      .duration(2000)
      .attr("cx", d => d/2);

  var newdata = [145, 29, 53, 196, 200, 12];

  circ.data(newdata);

  circ.transition()
      .delay(4000)
      .duration(2000)
      .attr("cx", d => 2*d);

</script>
```

The data bind in depth
=======
[UpdateEnterExit.pdf](UpdateEnterExit.pdf)


Scenario 2: More DOM elements than data values
=======

``` js
<script id="s3">

  var circ = svg.selectAll("circle")
      .data([123, 52, 232, 90]);

  circ.attr("fill", "green");

  circ.exit().attr("fill", "red");

  circ.exit().transition()
      .duration(1000)
      .attr("cx", "600");

  circ.exit().transition()
      .delay(1000)
      .duration(1000)
      .attr("cx", "300");

  circ.exit().transition().delay(2000).remove();

</script>
```

Scenario 1: More data values than DOM Elements
=======
``` js
<script id="s4">

var circ = svg.selectAll("circle")
      .data([123, 52, 232, 90, 34, 12, 189, 110]);

  circ.enter()
      .append("circle")
        .attr("cx", "50")
        .attr("cy", (d, i) => i * 50 + 100)
        .attr("r", "20")
        .attr("fill", "red");

  // only acts on update selection
  circ.transition()
        .duration(3000)
        .attr("cx", "400");


</script>
```

Scenario 1: Combining update and enter selections with `.merge()`
=======

``` js
<script id="s5">
// simplified code after 3/27 class:

    var allcirc = circ  // all existing circles -- see script s1
        .data([123, 52, 232, 90, 34, 12, 189, 110])
        .enter()  // 2 placeholders
        .append("circle")  // placeholders -> circles
          .attr("cx", "50")  // acts on enter selection only
          .attr("cy", (d, i) => i * 50 + 100)
          .attr("r", "20")
          .attr("fill", "red")
	.merge(circ)  // combines enter and update selections
	
    allcirc.transition() // acts on all 8 circles
          .duration(3000)
          .attr("cx", "400")
          .attr("fill", "purple");

    allcirc.transition() // acts on all 8 circles
        .delay(3000)
        .duration(3000)
        .attr("cx", "50");

</script>
```

Scenario: no DOM elements exist
=======
### data / enter / append sequence

``` js
<script id="s6">

  var specialdata = [100, 250, 300];

  var bars = svg.selectAll("rect")
      .data(specialdata)
      .enter()
      .append("rect")
        .attr("x", d => d)
        .attr("y", d => d)
        .attr("width", "50")
        .attr("height", "30")
        .attr("fill", "green");

  d3.selectAll("circle").remove();


</script>
```

Practice 1: Horizontal Bar Chart
=======



Submit / view solutions here: [ExerciseSolutions.md](ExerciseSolutions.md)

1. Create a new html file (try to recreate the template without looking!). Add a script that adds an svg element and horizontal bars of the lengths (in pixels) specified in `bardata`. Create the bars with the data / enter / append sequence.

    `var bardata = [300, 100, 150, 225, 75, 275];`
    
    *Note: it's best to work in the Console for the following so you don't have to sequence the changes.*

1. Change the data to any six other values and update the lengths of the bars.

1. Bind a new dataset, `newbardata` to the bars, update the bar lengths, and remove any extra bars.

    `newbardata = [250, 125, 80, 100];`

1. Bind a new dataset, `reallynewbardata`, to the bars, then add additional bars so each data value has a bar. Make the outline (stroke) of the new bars a different color.

    `reallynewbardata = [300, 100, 250, 50, 200, 150, 325, 275];`

1. Use `.merge()` to combine the update and enter selections into one selection and then transition the height of all of the bars to half their current height.

1. Add text labels inside the bars at the right end with the length of the bar in pixels.</p></li>
