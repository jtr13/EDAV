Debugging Tips
================

### Submit a pull request to add to this file.

SVG elements don't appear
=======
Strategy: Click Elements in Javascript Console to see what happened

### Example 1:
``` js
<script>
	d3.select("body").append("svg")
	  .attr("width", "500").attr("height", "400")

	var dataset = [340, 210, 120, 43];

  d3.selectAll("circle")
	  .data(dataset)
		.enter()
		.append("circle")
		.attr("cx", "100")
		.attr("cy", d => d)
		.attr("r", 20)
		.attr("fill", "red");
	</script>
```

#### Elements
``` html
...
<svg width="500" height="400"></svg>
</body>
  <circle cx="100" cy="340" r="20" fill="red"></circle>
	<circle cx="100" cy="210" r="20" fill="red"></circle>
	<circle cx="100" cy="120" r="20" fill="red"></circle>
	<circle cx="100" cy="43" r="20" fill="red"></circle>
</html>
```

#### Diagnosis
The circles appear but are in the wrong place. Why? Because `svg` was never selected. With `append()` items are added to the parent node of the selection, so you must specify what that is with a selection before selectAll. If you don't -- as in this case -- the default parent is the document element (`<html>`), which explains why the circles appear after the `</body>` tag. Selections are explained in more detail here: ["How Selections Work"](https://bost.ocks.org/mike/selection/)

#### Solution
Change `d3.selectAll("circle")` to `d3.select("svg").selectAll("circle")`
