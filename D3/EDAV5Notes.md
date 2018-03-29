EDAV5 Notes
================

General Update Pattern
=======

Also available here: [EDAV5_1.html](EDAV5_1.html)

``` js
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>EDAV5_1</title>
		<script src="https://d3js.org/d3.v4.min.js"></script> 
	</head>
	
	<body>
	
		<script id="s1">
		
// 1. Create svg and initial bars
		
	var svg = d3.select("body")
		.append("svg")
			.attr("width", "500")
			.attr("height", "400");
		
	var bardata = [300, 100, 150, 225, 75, 275];
		
	var bars = svg.selectAll("rect")
			.data(bardata);
		
	bars.enter().append("rect")
			.attr("x", "30")
			.attr("y", (d, i) => i*50)
			.attr("width", d => d)
			.attr("height", "35")
			.attr("fill", "lightgreen");
		
// General Update Pattern
			
	function update(data) {

  	var bars = svg.selectAll("rect")  // data join
    		.data(data);


  	bars.enter().append("rect")				// add new elements
				.attr("x", "30")
				.attr("y", (d, i) => i*50)
				.attr("width", d => d)
				.attr("height", "35")
				.attr("fill", "yellow")
    	.merge(bars)									// merge
				.transition()
		 		.duration(2000)
				.attr("width", d => d)
				.attr("fill", "orange");

		bars.exit().remove();					// remove extra elements
		}
			
		</script>

	</body>
  
</html>
```	
	
Practice 1
=======
Change the bar chart to a vertical bar chart.
[EDAV5_2.html](EDAV5_2.html)

Add "add" and "remove" buttons.
=======
[EDAV5_3.html](EDAV_3.html)

Add scales
=======
[EDAV5_4.html](EDAV_4.html)
