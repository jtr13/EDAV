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
        //circ
        //circ.data();
        circ.data(dataset);
        //circ.data();
        circ.transition().duration(3000).attr("cx",d=>d).on("end",function(){
                circ.transition().duration(3000).attr("cx",d=>d/2)
                .attr("fill","red").on("end",function(){
                d3.select("#c3").transition().duration(3000).attr("cx",d=>d).on("end",function(){
                circ.transition().duration(3000).attr("cx",d=>d/4).attr("r","10").on("end",function(){
                circ.transition().duration(3000).attr("r",d=>d/10);
                        });
                        });
                        });
        });
</script>
