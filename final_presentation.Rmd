# Final Project Notes {#project}

![](images/banners/banner_presentation.png)

## Overview

This section goes over what's expected for the final project.

**General Note**: Please note that this sheet cannot possibly cover all the "do's and don'ts" of data analysis and visualization. You are expected to follow all of the best practices discussed in class throughout the semester.

## General Info

### Goal

The goal of this project is to perform an exploratory data analysis / create visualizations with data of your choosing in order to gain preliminary insights on questions of interest to you.

### Teams

You must work in teams of 2-4 people. (If you have specific interests you should try to find partners on [Piazza](https://piazza.com/){target="_blank"} first as we will not be able to match on specific criteria -- we will simply assign groups in the order in which responses come in.)

### Topics

Start with a topic / question that interests you and *then* look for data!

### Data

Choose data from the original source: that is, one that is not included in R (or similar), nor used in Kaggle (or similar) competitions, nor relatively well-known/well-trodden through some other forum. If in doubt, *ask*! 

A few examples are:

- [NYC Open Data](https://opendata.cityofnewyork.us/){target="_blank"}
- [US Bureau of Labor Statistics](https://www.bls.gov/){target="_blank"}

### Analysis

You have a lot of freedom to choose what to do, as long as you restrict yourselves to exploratory techniques (rather than modeling / prediction approaches). In addition, your analysis must be clearly documented and reproducible.

### Feedback

At any point, you may ask the head TA or the instructor (jtr13) for advice. Our primary role in this regard will be to provide general guidance on your choice of data / topic / direction. As always, you are encouraged to post specific questions to [Piazza](https://piazza.com/){target="_blank"}, particularly coding questions and issues. You may also volunteer to discuss your project with the class in order to get feedback--if you'd like to do this, [email the instructor](http://stat.columbia.edu/department-directory/name/joyce-robbins/){target="_blank"} to schedule a date.

### Peer Review

A portion of your grade is based on the feedback *you* give to other groups. After the due date, each individual will be assigned two project groups to review, and instructions will be provided.

**Note**: part of the grade you receive for the class is based on the quality of review that you *write*, not on the feedback that your project *receives.* Your grade for the project (as for all other assignments for the class) will be determined solely by the instructor and TAs.

### Report Format

With the exception of the interactive part, your project should be submitted to CourseWorks in the same manner as homework assignments, as **.Rmd** and **.html** files, with graphs / output rendered. You will lose points if we have trouble reading your file, need to ask you to resubmit with graphs visible, if links are broken, or if we have other difficulties accessing your materials. It's ok if code is in different files and different places, just make sure there are working links in your report to these locations. **Note**: Using Markdown + code chunks is supposed to make combining code, text and graphs easier. If it is making it more difficult, you are probably trying to do something that isn't well suited to the tool set. Focus on the text and graphs, not the formatting. If you're not sure if something is important to focus on or not, please ask.

*Advice*: don't wait to start writing.  Your overall project will undoubtedly be better if you give up trying to get that last graph perfect or the last bit of analysis done and get to the *writing*!

### A Note on Style

You are encouraged to be as intellectually honest as possible. That means pointing out flaws in your work, detailing obstacles, disagreements, decision points, etc. -- the kinds of "behind-the-scene" things that are important but often left out of reports. You may use the first person ("I"/"We") or specific team members' names, as relevant.

## Outline

Your report should include the following sections, with subtitles ("Introduction", etc.) as indicated:

### Introduction

Explain why you chose this topic, and the questions you are interested in studying.

List team members and a description of how each contributed to the project.

### Description of Data

Describe how the data was collected, how you accessed it, and any other noteworthy features.

### Analysis of Data Quality

Provide a detailed, well-organized description of data quality, including textual description, graphs, and code.

### Main Analysis (Exploratory Data Analysis)

Provide a detailed, well-organized description of your findings, including textual description, graphs, and code.  Your focus should be on both the results and the process. Include, as reasonable and relevant, approaches that didn't work, challenges, the data cleaning process, etc.

### Executive Summary (Presentation-style)

Provide a short nontechnical summary of the most revealing findings of your analysis  written for a nontechnical audience. The length should be approximately two pages (if we were using pages...) Take extra care to clean up your graphs, ensuring that best practices for presentation are followed.

**Note**: "Presentation" here refers to the style of graph, that is, graphs that are cleaned up for presentation, as opposed to the rough ones we often use for exploratory data analysis. You do not have to present your work to the class! However, you may choose to present your work as your community contribution, in which case you need to email me to set a date before the community contribution due date. (The presentation itself may be later.)

### Interactive Component

Select one (or more) of your key findings to present in an interactive format. Be selective in the choices that you present to the user; the idea is that in 5-10 minutes, users should have a good sense of the question(s) that you are interested in and the trends you've identified in the data. In other words, they should understand the value of the analysis, be it business value, scientific value, general knowledge, etc.

Interactive graphs must follow all of the best practices as with static graphs in terms of perception, labeling, accuracy, etc. 

You may choose the tool (D3, Shiny, or other) The complexity of your tool will be taken into account: we expect more complexity from a higher-level tool like Shiny than a lower-level tool like D3, which requires you to build a lot from scratch.   

Make sure that the user is clear on what the tool does and how to use it.

Publish your graph somewhere on the web and provide a link in your report in the interactive section. The obvious choices are [blockbuilder.org](http://blockbuilder.org/){target="_blank"} to create a block for D3, and [shinyapps.io](https://www.shinyapps.io/){target="_blank"} for Shiny apps but other options are fine. You are encouraged to share experiences on [Piazza](https://piazza.com/){target="_blank"} to help classmates with the publishing process.

As applicable, all of the following will be considered in the grading process:

*   Choice of data and plot types to present
*   Clear relevance to question(s), project in general
*   Design of interactive component(s)
*   Clarity of presentation, including instructions
*   Technical execution (include a description of what you would work on in the future, what you've attempted, etc. so we know it's on your radar)

### Conclusion

Discuss limitations and future directions, lessons learned.

## FAQ

1. **How long should the project be?** It should take the reader approximately 15-20 minutes to read the report. We cannot provide a specific number of graphs or pages since there are so many variables. Use your judgment to cover all of the important material without being repetitive.  You can report on what you've done without including all of the graphs; for example, if you looked at maps of each of the fifty states you can include 1 or 2 as examples.

2. **Do we have to present the project to the class?** No. Presenting your project as your community contribution is optional. 

3. **Someone has already used the same data, is that ok?** Yes. As long as you get the data from the original source, not a site like Kaggle, you're fine. You can check with the professor if you want to be sure.

4. **I spent 30 minutes looking at my data, and then 1000 hours building this super cool interactive app so users can analyze the data themselves. Can't you count the interactive part for 95% of my grade?** No. While skill sets overlap in the real world, and it's important to know something about building things, the assumption is that you are doing the work of the data scientist: actually analyzing the data rather than building tools for someone else to do it. The former (the data!) has been the main focus of this class and therefore is the primary focus of the final project.

## Executive Summary Notes

The executive summary should be a well-formatted, presentable final product of your results. Here are some notes to consider when putting it together:

*   Title, axis labels, tick mark labels, and legends should be comprehensible (easy to understand) and legible (easy to read / decipher).
*   Tick marks should not be labeled in scientific notation or with long strings of zeros, such as 3000000000. Instead, convert to smaller numbers and change the units: 3000000000 becomes "3" and the axis label "billions of views".
*   Units should be intuitive (An axis labeled in month/day/year format is intuitive; one labeled in seconds since January 1, 1970 is not.)
*   The font size should be large enough to read clearly. The default in ggplot2 is generally too small. You can easily change it by passing the base font size to the theme, such as `+ theme_grey(16)` (The default base font size is 11).
*   The order of items on the axes and legends should be logical. (Alphabetical is usually not the best option.)
*   Colors should be color-vision-deficiency-friendly.
*   If categorical variable levels are long, set up the graph so the categorical variable is on the y-axis and the names are horizontal. A better option, if possible, is to shorten the names of the levels.
*   Not all EDA graphs lend themselves to presentation, either because the graph form is hard to understand without practice or it's not well labeled. The labeling problem can be solved by adding text in an image editor. The downside is that it is not reproducible. If you want to go this route, for the Mac,  [Keynote](https://www.apple.com/keynote/){target="_blank"} and [Paintbrush](https://paintbrush.sourceforge.io/){target="_blank"} are good, free options. 
*   Err on the side of simplicity. Don't, for example, overuse color when it's not necessary. Ask yourself: does color make this graph any clearer? If it doesn't, leave it out.
*   Test your graphs on nontechnical friends and family and ask for feedback.

Above all, have fun with it :)
