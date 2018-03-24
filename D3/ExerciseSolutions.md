Exercise Solutions
================

### EDAV 1

**Part C: Interactivity**

4. Add the same event listern to the ellipse.

``` js
d3.select("ellipse").on("mouseover", goyellow);
```

5. Create a function `goblue()` that changes the fill color to blue.

``` js
function goblue() {d3.select(this).attr("fill", "blue")};
```

6. Add event listeners to the circle and ellipse that will trigger a call to `goblue()` on a *mouseout*.

``` js
d3.select("circle").on("mouseout", goblue);
d3.select("ellipse").on("mouseout", goblue);
```



### EDAV 3

**Practice 1**

Solution 1 

``` js
 <svg width="500" height="400">
     <rect x="0" y="0" width="500" height="400" fill="aliceblue"></rect>
     <circle cx="50" cy="100" r="20" fill="blue"></circle>
     <circle cx="50" cy="150" r="20" fill="blue"></circle>
     <circle id="c3" cx="50" cy="200" r="20" fill="blue"></circle>
     <circle cx="50" cy="250" r="20" fill="blue"></circle>
     <circle cx="50" cy="300" r="20" fill="blue"></circle>
     <circle cx="50" cy="350" r="20" fill="blue"></circle>
</svg>

<script>
     d3.selectAll("circle").transition().duration(3000).attr("cx","450");
     d3.selectAll("circle").transition().delay(3000).duration(3000).attr("cx","50").attr("fill","red");
     d3.select("#c3").transition().delay(6000).duration(3000).attr("cx","450");
     d3.selectAll("circle").transition().delay(9000).duration(3000).attr("cx","250")
     d3.selectAll("circle").transition().delay(12000).duration(3000).attr("cy","250");
</script>
```

Solutions 2 (all elements created dynamically)

``` js
<script id="practice_1">		

var svg = d3.select("body").append("svg")
    .attr("width", "500").attr("height", "400");
svg.append("rect").attr("x", "0").attr("y", "0")
      .attr("width", "500").attr("height", "400").attr("fill", "lightblue");

svg.append("circle").attr("cx", "50").attr("cy", "50")
    .attr("r", "20").attr("fill", "blue");
svg.append("circle").attr("cx", "50").attr("cy", "100")
    .attr("r", "20").attr("fill", "blue");
svg.append("circle").attr("cx", "50").attr("cy", "150")
    .attr("r", "20").attr("fill", "blue").attr("id", "important");
svg.append("circle").attr("cx", "50").attr("cy", "200")
    .attr("r", "20").attr("fill", "blue");
svg.append("circle").attr("cx", "50").attr("cy", "250")
    .attr("r", "20").attr("fill", "blue");
svg.append("circle").attr("cx", "50").attr("cy", "300")
    .attr("r", "20").attr("fill", "blue");

d3.selectAll("circle").transition().duration(1000)
    .attr("cx", "400");
d3.selectAll("circle").transition().delay(1000).duration(1000)
    .attr("cx", "50").attr("fill", "red");
d3.select("#important").transition().delay(2000).duration(1000)
    .attr("cx", "400").on("end", function() {
    	d3.selectAll("circle").transition()
      		.duration(1000).attr("cx", "250");
  		d3.selectAll("circle").transition().delay(1000)
      		.duration(1000).attr("cy","200");

    });

</script>
```

**Practice 2**

``` js
<script id="practice_2">
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


  var dataset = [100, 150, 200, 250, 300, 350];

	var circ = d3.selectAll("circle");

	circ.data(dataset);

	circ.transition().duration(2000)
		.attr("cx", function(d) {
			return d;
		});
</script>
```

If you find any errors, please submit a pull request to this file.

You are encouraged to add solutions to later assignments... it will count as your community contribution. Again, submit by making a pull request to this file.

(You don't have to know any git to do this. Just click the "edit this file" button on the top right -- the one that looks like a pencil. Add some code following the pattern of previous examples, add a commit note, such as "added EDAV2 solutions", and click Commit Changes. I will review your proposed changes before merging. Fear not, you can't mess anything up no matter what you do. It's a good chance to practice.)
