Exercise Solutions
================

If you find any errors, please submit a pull request to this file.

You are encouraged to add solutions... it will count as your community contribution. Again, submit by making a pull request to this file.

(You don't have to know any git to do this. Just click the "edit this file" button on the top right -- the one that looks like a pencil. Add some code following the pattern of previous examples, add a commit note, such as "added EDAV2 solutions", and click Commit Changes. I will review your proposed changes before merging. Fear not, you can't mess anything up no matter what you do. It's a good chance to practice.)


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

Solution 2 (circles created statically but modified dynamically)
``` js
<script>
        var svg=d3.select("body").append("svg").attr("width", "500").attr("height", "400");
        svg.append("rect").attr("x", "0").attr("y", "0").attr("width", "500").attr("height", "400").attr("fill", "lightblue");

        svg.append("circle").attr("cy","100");
        svg.append("circle").attr("cy","150");
        svg.append("circle").attr("id","c3").attr("cy","200");
        svg.append("circle").attr("cy","250");
        svg.append("circle").attr("cy","300");
        svg.append("circle").attr("cy","350");

        var circ=d3.selectAll("circle");
	
        circ.attr("cx","50").attr("r","20").attr("fill","blue"); // saves a lot of typing ... compare to Solution 1

        circ.transition().duration(3000).attr("cx","450").on("end",function(){
            circ.transition().duration(3000).attr("cx","50")
                .attr("fill","red").on("end",function() {
                    d3.select("#c3").transition().duration(3000).attr("cx","450").on("end", function () {
                        circ.transition().duration(3000).attr("cx","250").on("end",function () {
                            circ.transition().duration(3000).attr("cy","250");
                            });
			});
		});
	});
</script>
```

Solution 3 (circles created dynamically)

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
```    

Solution 4

1. Create <svg> element from previous example 
2. Add <script> element to <body>
	
``` js	
<body>
    
        <svg width="500" height="400">  
			<rect x="0" y="0" width="500" height="400" fill="aliceblue"></rect>
			<circle cx="50" cy="100" r="20" fill="blue"></circle>
			<circle cx="50" cy="150" r="20" fill="blue"></circle>
			<circle id = "my_c" cx="50" cy="200" r="20" fill="blue"></circle>
			<circle cx="50" cy="250" r="20" fill="blue"></circle>
			<circle cx="50" cy="300" r="20" fill="blue"></circle>
			<circle cx="50" cy="350" r="20" fill="blue"></circle>
        </svg>
        
        <script>
            d3.selectAll("circle").transition().duration(2000).attr("cx", "400");
            d3.selectAll("circle").transition().delay(2000).duration(2000).attr("cx", "50").attr("fill","red");
            d3.select("#my_c").transition().delay(4000).duration(2000).attr("cx","400");
            d3.selectAll("circle").transition().delay(6000).duration(2000).attr("cx","200").transition().duration(2000).attr("cy","200")
        </script>

 </body>
=======
</script>
```

**Practice 2**

Solution 1

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

Solution 2 (with multiple transitions)

``` js
<script>
        var svg=d3.select("body").append("svg").attr("width", "500").attr("height", "400");
        svg.append("rect").attr("x", "0").attr("y", "0").attr("width", "500").attr("height", "400").attr("fill", "lightblue");

        svg.append("circle").attr("cy","100");
        svg.append("circle").attr("cy","150");
        svg.append("circle").attr("id","c3").attr("cy","200");
        svg.append("circle").attr("cy","250");
        svg.append("circle").attr("cy","300");
        svg.append("circle").attr("cy","350");

        var circ=d3.selectAll("circle");
        circ.attr("cx","50").attr("r","20").attr("fill","blue");

        var dataset=[90,230,140,75,180,25];

        circ.data(dataset);

        circ.transition().duration(3000).attr("cx",d=>d).on("end",function () {
                circ.transition().duration(3000).attr("cx",d=>d/2)
                    .attr("fill","red").on("end",function(){
                d3.select("#c3").transition().duration(3000).attr("cx",d=>d).on("end",function () {
                    circ.transition().duration(3000).attr("cx",d=>d/4).attr("r","10").on("end",function () {
                        circ.transition().duration(3000).attr("r",d=>d/10);
                        });
                    });
                });
        });
</script>
```

Solution 3 (using `.data(dataset).enter().append("circle")` to create circles)

``` js
<script>
        var svg=d3.select("body").append("svg").attr("width", "500").attr("height", "400");
        svg.append("rect").attr("x", "0").attr("y", "0").attr("width", "500").attr("height", "400").attr("fill", "lightblue");

        var dataset=[100,150,200,250,300,350];
        svg.selectAll("circle").data(dataset).enter().append("circle")

        var circ=d3.selectAll("circle");
        circ.attr("cx",d=>d).attr("cy",d=>d).attr("r","25").attr("fill","blue");
        circ.transition().duration(3000).attr("cx",40).on("end",function(){
                circ.transition().duration(3000).attr("cx",d=>d/2)
                .attr("fill","red").on("end",function(){
                circ.transition().duration(3000).attr("cy",250).attr("fill","green").on("end",function(){
                circ.transition().duration(3000).attr("cx",d=>d/4).attr("r","10").on("end",function(){
                circ.transition().duration(3000).attr("r",d=>d/10);
                        });
                        });
                        });
        });
</script>
```

