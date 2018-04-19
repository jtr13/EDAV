EDAV8 Notes
================

Debugging Tips
=======
* Make extensive use of Elements to see what's being added to the DOM.

* Make extensive use of Console to check the values of variables and/or test code.

* Use `console.log()` esp. in functions

* Post Minimal Working Examples on Piazza. See:

    ["How to create a Minimal, Complete, and Verifiable example"](https://stackoverflow.com/help/mcve)

    ["So you’ve been asked to make a reprex"](https://www.jessemaegan.com/post/so-you-ve-been-asked-to-make-a-reprex/)

* Use a text editor that helps you identify unmatched () {} [].

Helpful JavaScript
=======

### Arrow functions

Standard method:

``` js
d3.selectAll("circle")
    .attr("r", function(d) {
        return d;
        });
```

With an arrow function:

``` js
d3.selectAll("circle")
    .attr("r", d => d);
```

Note: don't use arrow functions with `this` -- it doesn't behave the same way.

### `.map()`

can be used to replace for-loops:

For example, the book method (p. 95) for creating an array of random numbers:

``` js
var dataset = [];
for (var i = 0; i < 25; i++) {
    var newNumber = Math.random() * 30;
    dataset.push(newNumber);
}
```

With `.map()` (and `d3.range()`):

``` js
var dataset = d3.range(25)
    .map( () => Math.random() * 30);
```

A simpler example:

``` js
[1, 2, 3].map(d => d + 1);
```
> `(3) [2, 3, 4]`

### Strings

ES6 makes it easier to combine character data and variables.

Book method:

``` js
.attr("transform", "translate(0," + (h - padding) + ")")
```

ES6 template literals:

``` js
.attr("transform", `translate(0, ${h - padding})`)
```

Don't forget to use back ticks (`) instead of quotation marks (") !!!!


Line Charts
=======

### SVG `<path>` element

ex.
``` html
<svg width = "500" height = "400">
  <path d="M 50 400 L 100 300 L 150 300 L 200 33 L 250 175
     L 300 275 L 350 250 L 400 125" fill="none"
      stroke="red" stroke-width="5">
  </path>
</svg>
```

`d` attribute:

M = move to

L = line to

More options: [https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d)

### SVG editors

ex. [SVG-edit](https://svg-edit.github.io/svgedit/releases/svg-edit-2.8.1/svg-editor.html)

### Save plots as SVG files in R

Save plots as SVG files:

``` r
> svg("xsquared.svg")
> plot(1:10, (1:10)^2, axes=F)
> dev.off()

> library(svglite)
> svglite("xsquared2.svg")
> plot(1:10, (1:10)^2, axes=F)
> dev.off()
```

Set graphics device to svg in code
chunk options:

``` r
    ```{r, dev="svg"}


    ```{r, dev="svglite"}
```

Back to line charts
=======

### What we have:

Day|High Temp
----|----
April 1|60
April 2|43
April 3|43
April 4|56
April 5|45
April 6|62
April 7|49

### What we need

Something like this:

``` html
<path class="line" fill="none" d="M0,116.66666666666669C27.777777777777786,155.5131766381766,55.55555555555557, 194.35968660968655,83.33333333333333,215.83333333333331C111.11111111111109,237.30698005698008,138.88888888888889,
241.40776353276354,166.66666666666666,215.83333333333331C194.44444444444443,190.2589031339031,222.22222222222223,
135.00925925925924,250,140C277.77777777777777,144.99074074074076,305.55555555555554,210.22186609686608,333.3333333333333,
204.16666666666666C361.1111111111111,198.11146723646723,388.8888888888889,120.76994301994304,416.6666666666667,
105.00000000000003C444.44444444444446,89.23005698005701,472.22222222222223,135.03169515669518,500,180.83333333333334"></path>
```

### Step 1: Create a line generator

Expects data in an array of 2-dimensional arrays, that is, an array of (x,y) pairs:

``` js
> var dataset = [ [0, 60], [1, 43], [2, 43], [3, 56], [4, 45], [5, 62], [6, 49] ];

> var mylinegen = d3.line()
```
Test it in the Console:

``` js
> mylinegen(dataset);
```

### Let's add scales

An ordinal scale for x:

``` js
> var xScale = d3.scaleBand()
    .domain(d3.range(dataset.length))
    .range([0, 500])
```    

A linear scale for y:

``` js    
> var yScale = d3.scaleLinear()
    .domain([d3.min(dataset, d => d[1]) - 20,
             d3.max(dataset, d => d[1]) + 20])
    .range([400, 0]);         
```             

*Why `d[1]` instead of `d`? (See p. 122)

### Add accessor functions `.x()` and `.y()` to the line generator

``` js
mylinegen
    .x(d => xScale(d[0]))
    .y(d => yScale(d[1]));
```

Test again:

``` js
> mylinegen(dataset);
```

Now let's add a `<path>` element with that `d` attribute: (this step is just for learning purposes...)

``` js
> var mypath = mylinegen(dataset);

> d3.select("svg").append("path").attr("d", mypath)
    .attr("fill", "none").attr("stroke", "red")
    .attr("stroke-width", "5");
```

### Step 2: Put the line generator to work

Now let's do it the direct way: bind the *datum* and calculate the path in one step:

``` js
> d3.select("svg").append("path")
    .datum(dataset)
    .attr("d", mylinegen)
    .attr("fill", "none")
    .attr("stroke", "teal")
    .attr("stroke-width", "5");
```

Finally, we'll add a class and style definitions:

``` html
<style>
  .linestyle {
    fill: none;
    stroke: teal;
    stroke-width: 5px;
  }
</style>
```

The `append("path")` line becomes:

``` js
svg.append("path")
    .datum(dataset)
    .attr("d", mylinegen)
    .attr("class", "linestyle");
```

Putting it all together, we have: [EDAV8_1_linegen.html](EDAV8_1_linegen.html)

And another example with axes [EDAV8_2_linechart.html](EDAV8_2_linechart.html)

(Also uses: `d3.timeParse()` and JavaScript [`Array.foreach()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) )


