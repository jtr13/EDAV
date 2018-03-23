Exercise Solutions
================

EDAV 1

Part C: Interactivity

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

If you find any errors, please submit a pull request to this file.

You are encouraged to add solutions to later assignments... it will count as your community contribution. Again, submit by making a pull request to this file.

(You don't have to know any git to do this. Just click the "edit this file" button on the top right -- the one that looks like a pencil. Add some code following the pattern of previous examples, add a commit note, such as "added EDAV2 solutions", and click Commit Changes. I will review your proposed changes before merging. Fear not, you can't mess anything up no matter what you do. It's a good chance to practice.)

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

