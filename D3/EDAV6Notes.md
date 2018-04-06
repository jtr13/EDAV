EDAV6 Notes
================

Scales
=======
[Scales.pdf](Scales.pdf)

Ordinal scale for x-axis [EDAV5_4_scaleBand.html](EDAV5_4_scaleBand.html)

Linear scale for y-axis
[EDAV5_5_scaleLinear.html](EDAV5_5_scaleLinear.html)

Axes
=======
[Axes.pdf](Axes.pdf)

Margins [EDAV6_1_margins.html](EDAV6_1_margins.html)

y-axis [EDAV6_2_yaxis.html](EDAV6_2_yaxis.html)

Practice
=======
Add an x-axis to the previous file.


Suggestion
========

Suggesting to move following 4 lines into function update(). So whenever/whereever there is an update call, the scale and axis will be updated according rather than only doing it when "click". e.g. when we update through console, the scales/axis will be updated too. And also, if we expand the file further to have updates other than "click", we don't have to copy these 4 lines again and again.

      xScale.domain(d3.range(data.length));

      yScale.domain([0, d3.max(data)]);

      svg.select(".xAxis")
          .transition()
          .duration(dur)
          .ease(d3.easeLinear)
          .call(xAxis);

      svg.select(".yAxis")
          .transition()
          .duration(dur)
          .ease(d3.easeLinear)
          .call(yAxis);
