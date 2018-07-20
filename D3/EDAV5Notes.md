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

// Create svg and initial bars

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

    var bars = svg.selectAll("rect")    // data join
        .data(data);


    bars.enter().append("rect")    // add new elements
        .attr("x", "30")
        .attr("y", (d, i) => i*50)
        .attr("width", d => d)
        .attr("height", "35")
        .attr("fill", "yellow")
      .merge(bars)    // merge
        .transition()
        .duration(2000)
        .attr("width", d => d)
        .attr("fill", "orange");

    bars.exit().remove();    // remove extra elements
    }

    </script>

  </body>

</html>
```

Practice 1
=======
Open [EDAV5_1.html](EDAV5_1.html) locally and practice running the `update()` function with different datasets in the Console.


Practice 2
=======
Change the bar chart to a vertical bar chart.

Solution: [EDAV5_2.html](EDAV5_2.html)

Practice 3
=======
Add "add" and "remove" buttons.

Solution: [EDAV5_3.html](EDAV5_3.html)

*Hint for 4 & 5: Take out the transitions and get the scales working. Then, if you want, add transitions back in.*

Practice 4
=======

Up to this point, we have assumed one-to-one correspondence between pixels and data values.  Scales allow flexibility in mapping data values to pixels. Add an ordinal scale to map the position of the bars appropriately given the width of the `svg` element, using `d3.scaleBand()`.

``` js
 var xScale = d3.scaleBand()
     .domain([...])
     .range([...]);
```

See: *IDVW*, Chapter 9, pp. 150-153  

Solution: [EDAV5_4_scaleBand.html](EDAV5_4_scaleBand.html)

Practice 5
=======
Add a linear scale for the y-axis using `d3.scaleLinear()`, so data will be scaled appropriately to the height of the `svg` element.

``` js
var yScale = d3.scaleLinear()
    .domain([...])
    .range([...]);
```

See: *IDVW*, Chapter 7 (Note that our dataset is one-dimensional so we only have `d`, not `d[0]` and `d[1]`.)

Solution: [EDAV5_5_scaleLinear.html](EDAV5_5_scaleLinear.html)
