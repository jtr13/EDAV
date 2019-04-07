# Final Project Assignment {#project}

![](images/banners/banner_presentation.png)

## Overview

This section goes over what's expected for the final project, **Spring 2019**. 

**General Note**: Please note that this sheet cannot possibly cover all the "do's and don'ts" of data analysis and visualization. You are expected to follow all of the best practices discussed in class throughout the semester.

## General info

### Goal

The goal of this project is to perform an exploratory data analysis / create visualizations with data of your choosing in order to gain preliminary insights on questions of interest to you.

### Teams

For this assignment you will work in teams of 2 people. If you wish to select your own partner, please do so by **Thursday, March 28, 2019.** Piazza is a good place to post your interests and look for partners. After March 28th, partners will be randomly assigned. (This is actually a better option in terms of preparing yourself for a work environment with colleagues that you don't know well.) If you wish to be assigned to a partner before that date so you can get started earlier (recommended) please email me.

Once you know who you wish to work with, sign up in the *People* section of CourseWorks. Do not click the *+Group* button; rather, drag your names into one of the groups already created with the name "Final Project <number>". (If you don't follow these instructions and create your own group, it will not be linked to the Final Project assignment and therefore you won't be able to submit your project properly as a team.)

Once the groups are set up, we will ask for a short description of your project ideas, so start planning!

### Topics

The topic you choose is open-ended... choose something that you are intereted in and genuinely curious about! Think of some questions that you don't know the answer to. Next look for data that might help you answer those questions.  

### Data

The data can be pulled from multiple sources; it does not need to be a single dataset. Be sure to get data from the original source. For example, if you wish to work with data collected and distributed by the [Centers for Disease Control](https://www.cdc.gov/DataStatistics/){target="_blank"}, that is where you should go to access the data, not a third party that has posted the data. Avoid overused datasets (think `Titanic`) as well as those used in Kaggle (or similar) competitions. 

### Code

All of your code should be stored on GitHub. We will spend some time in class learning how to set up a Git/GitHub workflow, but there is some leeway in terms of how you accomplish this.

Keep your project organized.  At a minimum, create a `data/raw` folder (maybe put in `.gitignore`), a `data/tidy` folder (or perhaps another name to indicate that you've worked on the data or subsetted it... it may not necessarily be tidy.), and `analysis` folder for your `.Rmd`s and `.html` (output) files. Use may also have an `R` folder for preprocessing scripts or functions that don't belong in the `.Rmd` file.

In your report, include a link to the repo, as well as links to specific files as relevant. The static visualizations should be done in R, but other pieces, such as data importation and cleaning do not. 


### Analysis

You have a lot of freedom to choose what to do, as long as you restrict yourselves to exploratory techniques (rather than modeling / prediction approaches). In addition, your analysis must be clearly documented and reproducible.

### Feedback

At any point, you may ask the TAs or the instructor (Joyce) for advice. Our primary role in this regard will be to provide general guidance on your choice of data / topic / direction. As always, you are encouraged to post specific questions to [Piazza](https://piazza.com/){target="_blank"}, particularly coding questions and issues. You may also volunteer to discuss your project with the class in order to get feedback--if you'd like to do this, [email the instructor](http://stat.columbia.edu/department-directory/name/joyce-robbins/){target="_blank"} to schedule a date.

### Peer review

After final projects are turned in, you will be asked write peer reviews of other projects. Each individual will be assigned two project groups to review, and instructions will be provided.

**Note**: part of the grade you receive for the class is based on the quality of review that you *write*, not on the feedback that your project *receives.* Your grade for the project (as for all other assignments for the class) will be determined solely by the instructor and TAs.

## Report format

The report should be about 15 pages with graphs, without code, approximately 5 pages for parts I.-IV. and 10 pages for parts V.-VII. You can check page length by looking at a browser print preview. All graphs should be accompanied by textual description / interpretation. You will likely produce many more graphs than you include in the report. You can keep them in separate files on GitHub, and link to them in the report as relevant.

With the exception of the interactive part, your project should be submitted to CourseWorks as an **.Rmd** and **.html**, with graphs / output rendered. The output format in the YAML should be:

```
output: 
  html_document:
    code_folding: hide
```

This format allows users to choose whether or not they wish to see the code. There will likely be pieces of your project that you can't include in the .Rmd / .html file combo. **In those cases, you should post those resources online and provide links to them in the report.** This is particularly relevant to the interactive graph section.

You will lose points if we have trouble reading your file, need to ask you to resubmit with graphs visible, if links are broken, or if we have other difficulties accessing your materials. It's ok if code is in different files and different places, just make sure there are working links in your report to these locations. **Note**: Using Markdown + code chunks is supposed to make combining code, text and graphs easier. If it is making it more difficult, you are probably trying to do something that isn't well suited to the tool set. Focus on the text and graphs, not the formatting. If you're not sure if something is important to focus on or not, please ask. 

*Advice*: don't wait to start writing.  Your overall project will undoubtedly be better if you give up trying to get that last graph perfect or the last bit of analysis done and get to the *writing*!

You are encouraged to be as intellectually honest as possible. That means pointing out flaws in your work, detailing obstacles, disagreements, decision points, etc. -- the kinds of "behind-the-scene" things that are important but often left out of reports. You may use the first person ("I"/"We") or specific team members' names, as relevant.

## Outline

Your report should include the following sections, with headings ("I. Introduction", etc.) as indicated:

### I. Introduction {-}

Explain why you chose this topic, and the questions you are interested in studying. Provide context for readers who are not familiar with the topic.


### II. Description of the data source {-}

Describe the data source: who is responsible for collecting the data? How is it collected?  If there were a choice of options, explain how you chose. 

Provide some basic information about the dataset: types of variables, number of records, etc.

Describe any known issues / problems about the data.

(You should be able to write this section without actually working with the data.)

### III. Description of data import / cleaning / transformation {-}

Describe the process of getting the data into a form in which you could work with it in R.

### IV. Analysis of missing values {-}

Describe any patterns you discover in missing values.

### V. Results  {-}

Provide a short nontechnical summary of the most revealing findings of your analysis  written for a nontechnical audience. Take extra care to clean up your graphs, ensuring that best practices for presentation are followed, as described in the [presentation style section](#presentation-style) below.

**Note**: "Presentation" here refers to the style of graph, that is, graphs that are cleaned up for presentation, as opposed to the rough ones we often use for exploratory data analysis. You do not have to present your work to the class! 

### VI. Interactive component {-}

Select one (or more) of your key findings to present in an interactive format. Be selective in the choices that you present to the user; the idea is that in 5-10 minutes, users should have a good sense of the question(s) that you are interested in and the trends you've identified in the data. In other words, they should understand the value of the analysis, be it business value, scientific value, general knowledge, etc.

Interactive graphs must follow all of the best practices as with static graphs in terms of perception, labeling, accuracy, etc. 

You may choose the tool (D3, Shiny, or other) The complexity of your tool will be taken into account: we expect more complexity from a higher-level tool like Shiny than a lower-level tool like D3, which requires you to build a lot from scratch.   

Make sure that the user is clear on what the tool does and how to use it.

Publish your graph somewhere on the web and provide a link in your report in the interactive section. The obvious choices are [blockbuilder.org](http://blockbuilder.org/){target="_blank"} to create a block for D3, and [shinyapps.io](https://www.shinyapps.io/){target="_blank"} for Shiny apps but other options are fine. You are encouraged to share experiences on [Piazza](https://piazza.com/){target="_blank"} to help classmates with the publishing process.

Note: the interactive component is worth approximately 25\% of the final project grade. Therefore, do not spend 90\% of your time on it... concentrate on the exploratory data analysis piece.

### VII. Conclusion {-}

Discuss limitations and future directions, lessons learned.

## Presentation style

As we've discussed throughout the semester, standards are higher for clarity in graphs designed to be shared with others. While "good enough" is our standard for EDA, we need to go the extra mile for presentation. The following is checklist of items to address to make your graphs presentation ready.  (You do not have to worry about these items for the EDA section.)

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

Above all, have fun with it <i class="far fa-smile-beam"></i>

## Grading

We are more impressed by *quality* than *quantity*.

In determining grades, we take the following into account:

* **Originality** Are your questions thought-provoking? Do they encourage the reader to think about the topic in a new way?

* **Real world context** Do your graphs and textual descriptions reflect a solid understanding of what your data mean? Is it clear *why* you are asking the questions that you are asking? Are your interpretations reasonable?

* **Reproducibility** Did you provide all of your code in a manner that will be easy for the reader to rerun your analysis, and include an explanation for any pieces that cannot be reproduced? Is your code clear? 


* **Multidimensionality** Do you examine multidimensional relationships and present them clearly?

* **Choice of graph forms** Are your graph forms good choices for your data?

* **Parameters / design decisions** Have you made good choices in parameters, color, etc.?

* **Standards** Do your graphs meet [presentation style standards](#presentation-style)?

* **Interactive part** How well does the interactive component connect with the goals of the project? Does it help the reader understand the main conclusions?


## Resources

["Tidy Tuesday Screencast: analyzing college major & income data in R"](https://www.youtube.com/watch?v=nx5yhXAQLxw){target="_blank"} David Robinson explores a dataset in R live, without looking at the data in advance. This may be helpful in figuring out how to get started.
