EDAV1.html: Overview
================

### Part A: Chrome Developer Tools, `d3.select()`

1.  Open a *downloaded version* of EDAV1.html. You can download the file:

    1.  from the Courseworks Files folder

    2.  from this repo by clicking [here](https://raw.githubusercontent.com/jtr13/EDAV/master/D3/EDAV1.html) and then File, Save Page As...

    3.  by downloading a ZIP of the whole repo by clicking [here](https://github.com/jtr13/EDAV/archive/master.zip)

2.  Click View, Developer, Developer Tools, then the Elements tab.

3.  Hover the mouse over various elements in the `<body> ... </body>` section.

4.  Click the Console tab. Type `d3.select("circle").attr("cx", "200");` at the prompt (`>`), press enter and see what happens.

5.  Now try some of the following and/or experiment on your own with changing attributes of the circle:

    ``` javascript
    d3.select("circle").attr("cx", "300");

    d3.select("circle").attr("cx", "400");

    d3.select("circle").attr("cx", "500");

    d3.select("circle").attr("cx", "600");

    d3.select("circle").attr("cx", "100");

    d3.select("circle").attr("r", "30");

    d3.select("circle").attr("r", "130");

    d3.select("circle").attr("r", "3");

    d3.select("circle").attr("r", "30");

    d3.select("circle").attr("fill", "red");

    d3.select("circle").attr("fill", "aliceblue");

    d3.select("circle").attr("fill", "lightseagreen");
    ```

6.  Refresh the page. What happened?

7.  Go to Elements. Look at the value of the `y1` attribute of the SVG `<line>` element. Go back to the Console and enter the following:

    ``` javascript
    d3.select("line").attr("y1", "10");
    ```

8.  Go back to Elements and observe. What happened?
9.  Stay in Elements and refresh the page. What happened to `y1`?

10. Now back to the Console to make style changes to the HTML elements:

    ``` javascript
    d3.select("h1").style("color", "purple");

    d3.select("h2").style("font-size", "50px");

    d3.select("h2").style("font-family", "Impact");
    ```

### Part B: Transitions (Ch. 9)

1.  Try these:

    ``` javascript
    d3.select("circle").transition().duration(2000).attr("cx", "400");

    d3.select("ellipse").transition().duration(2000).attr("transform", "translate (400, 400)");

    d3.select("line").transition().duration(2000).attr("x1", "400");

    d3.select("line").transition().duration(2000).attr("y1", "250");

    d3.select("p").transition().duration(2000).style("font-size", "72px");
    ```

2.  Experiment with more transitions.

### Part C: Interactivity (Ch. 10)

1.  Set up a function to turn the fill color to yellow:

    ``` javascript
    function goyellow() {d3.select(this).attr("fill", "yellow")};
    ```

2.  Add an event listener to the circle that will be trigger a call to `goyellow()` on a mouseover:

    ``` javascript
    d3.select("circle").on("mouseover", goyellow);
    ```

3.  Test it out.

4.  Add the same event listener to the ellipse. Test it out.

5.  Create a function `goblue()` that changes the fill color to blue.

6.  Add event listeners to the circle and ellipse that will trigger a call to `goblue()` on a *mouseout*. Test out your code.

7.  Try out a click event. (Note the use of an anonymous function.)

    ``` javascript
    d3.select("line").on("click", function()
      {d3.select(this).attr("stroke-width", "10");});
    ```

8.  Try another click event. What's happening?

    ``` javascript
    d3.select("svg").on("click", function()
      {d3.select("text").text(`(${d3.mouse(this)})`)});
    ```

### Part D: Student Submissions

Share your code! Submit a pull request to this file.

(You don't have to know any git to do this. Just click the "edit this file" button on the top right -- the one that looks like a pencil. Add some code, add a note, and click Commit Changes. I will review your proposed changes before merging. Fear not, you can't mess anything up no matter what you do. It's a good chance to practice.)

### from Oleh: move circle function

``` javascript
function move() {d3.select("circle").transition().duration(2000).attr("cx", "400")};

move();
```
