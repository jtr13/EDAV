Exercise Solutions
================
[EDAV 1](#edav-1)

[EDAV 2](#edav-2)

[EDAV 3](#edav-3)

[EDAV 4](#edav-4)

If you find any errors, please submit a pull request to this file.

You are encouraged to add solutions. Again, submit by making a pull request to this file. Note that code chunks begin with

    ``` js

and end with

    ```

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

### EDAV 2

**Practice 1**

Solution

On the console, type the following commands :

``` js
d3.selectAll("circle").transition().duration(2000).attr("cx", "400");
d3.selectAll("circle").transition().duration(2000).attr("cx", "50").attr("fill","red");
d3.select("#my_circle").transition().duration(2000).attr("cx","400")
d3.selectAll("circle").transition().duration(2000).attr("cx","200").transition().duration(2000).attr("cy","200")

```

**Practice 2**

Solution

Step 1,2 -> Update EDAV2.html to add class to one of the circles and also add style sheet to the circle having that class
Code for `<style>` and `<svg>` below:

``` js
<style type="text/css">
            .my_circle {
                fill : green;
                stroke : orange;
                stroke-width: 10;
            }
</style>
```

``` js
<svg width="500" height="400">  
			<rect x="0" y="0" width="500" height="400" fill="aliceblue"></rect>
			<circle cx="50" cy="100" r="20" fill="blue"></circle>
			<circle cx="50" cy="150" r="20" fill="blue"></circle>
			<circle class= "my_circle" cx="50" cy="200" r="20" fill="blue"></circle>
			<circle cx="50" cy="250" r="20" fill="blue"></circle>
			<circle cx="50" cy="300" r="20" fill="blue"></circle>
			<circle cx="50" cy="350" r="20" fill="blue"></circle>
</svg>
```

Step 3-5 : On console as below :

``` js
d3.selectAll("circle").classed("my_circle", true)
d3.select("svg").append("text").attr("x", 50).attr("y",100).text("1").attr("fill","white");
d3.select("text").transition().duration(4000).text("2").attr("y",150);
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

1. Create `<svg>` element from previous example
2. Add `<script>` element to `<body>`

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

### EDAV 4

1. Create a new html file (try to recreate the template without looking!). Add a script that adds an `svg` element and horizontal bars of the lengths (in pixels) specified in `bardata`. Create the bars with the data / enter / append sequence.  (Available here: [EDAV4.html](EDAV4.html)).

    var bardata = [300, 100, 150, 225, 75, 275];

    ``` html
    <html lang="en">
	    <head>
	    	<meta charset="utf-8">
	    	<title>Bar Chart</title>
	    	<script src="https://d3js.org/d3.v4.min.js"></script>  <!-- link to D3 library -->
    	</head>
    	<body>
    		<script>

		        var svg = d3.select("body")
		            .append("svg")
		              .attr("width", "500")
		              .attr("height", "500");

		        var bardata = [300, 100, 150, 225, 75, 275];

		        var bars = svg.selectAll("rect")
		        	.data(bardata);

		        bars.enter()
		        	.append("rect")
		        	  .attr("x", "30")
				        .attr("y", (d, i) => i*50)
			      	  .attr("width", d => d)
			      	  .attr("height", "35")
			      	  .attr("fill", "lightgreen");

	    	</script>
	    </body>
    </html>
    ```

 *Note: it's best to work in the Console for the following so you don't have to sequence the changes.*

2. Change the data to any six other values and update the lengths of the bars.

 ``` js
 var bardata2 = [93, 21, 250, 78, 224, 140];

 var bars = svg.selectAll("rect")
     .data(bardata2);

 bars.attr("width", d => d);

 ```

3. Bind a new dataset, newbardata to the bars, update the bar lengths, and remove any extra bars.

    newbardata = [250, 125, 80, 100];

 Bind data and update bar lengths:

 ``` js
  var newbardata = [250, 125, 80, 100];

 var bars = svg.selectAll("rect")
 	   .data(newbardata);  

 bars.attr("width", d => d);

 ```

 Remove extra bars:

 ``` js
 bars.exit()
       .remove();
 ```

4. Bind a new dataset, reallynewbardata, to the bars, update old bar lengths, then add additional bars so each data value has a bar. Make the outline (stroke) of the new bars a different color.

     reallynewbardata = [300, 100, 250, 50, 200, 150, 325, 275];

 Bind data and update bar lengths:

  ``` js
  var reallynewbardata = [300, 100, 250, 50, 200, 150, 325, 275];

  var bars = svg.selectAll("rect")
			.data(reallynewbardata);

  bars.attr("width", d => d);
  ```

 Add and style new bars:

 ``` js
 var newbars = bars.enter()
	    .append("rect")
	      .attr("x", "30")
	      .attr("y", (d, i) => i*50)
      	.attr("width", d => d)
	      .attr("height", "35")
	      .attr("fill", "lightgreen")
				.attr("stroke", "purple")
				.attr("stroke-width", "3");
 ```

5. Use .merge() to combine the update and enter selections into one selection and then transition the height of all of the bars to half their current height.

 ``` js
 newbars.merge(bars)
		   .attr("width", d => d/2);
 ```

6. Add text labels inside the bars at the right end with the length of the bar in pixels.

 ``` js
 svg.selectAll("text")
     .data(reallynewbardata)
     .enter()
     .append("text")
       .attr("x", d => d/2 + 33)
       .attr("y", (d, i) => i*50 + 25)
       .text(d => d/2);
 ```
 
Solution 2

```js
<script id="s1">
             
             // 1) Create a new html file (try to recreate the template without looking!). Add a script that adds an svg element and horizontal bars of the lengths (in pixels) specified in bardata. Create the bars with the data / enter / append sequence.
             
             var bardata = [300, 100, 150, 225, 75, 275]
             
             d3.select("body")
                 .append("svg")
                    .attr("width", 500)
                    .attr("height","500");
             
             var svg = d3.select("svg");
                   
             var bars = svg.selectAll("rect")
                            .data(bardata)
                            .enter()
                            .append("rect")
                            .attr("x", "50")
                            .attr("y", (d,i) => i*50 + 50)
                            .attr("fill", "green")
                            .attr("height", 20)
                            .attr("width", d=> d);
             
             // 2) Change the data to any six other values and update the lengths of the bars.
             bardata = [200,180,160,140,120,100];
             
             bars.data(bardata).transition().delay(1000);
             bars.transition().delay(2000).attr("fill","red").attr("width",d=>d);
             
             // 3) Bind a new dataset, newbardata to the bars and remove any extra bars.
             var newbardata = [250, 125, 80, 100];
             var bars = svg.selectAll("rect")
                            .data(newbardata);
             
             bars.exit().transition().delay(4000).remove();
             bars.transition().delay(6000).attr("width", d=> d ). attr("fill","blue");
             
	     
             //Delays are not working below this line, so I used the below commands on console
             /*
             // 4) Bind a new dataset, reallynewbardata, to the bars, then add additional bars so each data value has a bar. Make the outline (stroke) of the new bars a different color.
             

             var reallynewbardata = [300, 100, 250, 50, 200, 150, 325, 275];
             var bars = svg.selectAll("rect")
                            .data(reallynewbardata);
                           
             bars.attr("width", d=> d )
                 .attr("fill","cyan");
             
             var all_bars = bars.enter()
                          .append("rect")
                          .attr("x", "50")
                          .attr("y",(d,i) => i*50+50)
                          .attr("height",20)
                          .attr("width",d=>d)
                          .attr("fill","cyan")
                          .attr("stroke","black")
                          .merge(bars);
              
             // 5) Use .merge() to combine the update and enter selections into one selection and then transition the height of all of the bars to half their current height.

             //merge done in previous step
             all_bars.transition().duration(4000)
                    .attr("width",d=>d/2)
                    .attr("fill","yellow")
                    .attr("stroke","red")
                    
            // 6) Add text labels inside the bars at the right end with the length of the bar in pixels.              
            var new_text = svg.selectAll("text")
			    .data(reallynewbardata)
                            .enter()
                            .append("text")
                            .text(d=>d/2)
                            .attr("fill","black")
                            .attr("x", d=> d/2+30)
                            .attr("font-size","9px")
                            .attr("y",(d,i) => i*50+65)
                            
            // If you want text aligned to Left end of bars( easier )
            
             var new_text = svg.selectAll("text")
			    .data(reallynewbardata)
                            .enter()
                            .append("text")
                            .text(d=>d/2)
                            .attr("fill","black")
                            .attr("x", "55")
                            .attr("font-size","9px")
                            .attr("y",(d,i) => i*50+65)
                            
                    
             */
             
                           
            </script>
```

Solution 3

With delays... runs as a single script: [EDAV4Sol.html](EDAV4Sol.html)
