# Chart: Bar Graph {#bar}

![](images/banners/banner_bargraph.png)

## Overview

This section covers how to make bar graphs

## tl;dr
<!-- Gimme example -->
I want a nice example. Not tomorrow, not *after breakfast*. NOW! 

<!-- Explanation: -->
Here's a bar chart showing the survival rates of passengers aboard the *RMS Titanic*:

<img src="bargraph_files/figure-html/tldr-show-plot-1.png" width="864" />

And here's the code:

```r
library(datasets) # data
library(ggplot2) # plotting
library(dplyr) # manipulation

# Combine Children and Adult stats together
ship_grouped <- as.data.frame(Titanic) %>%
  group_by(Class, Sex, Survived) %>%
  summarise(Total = sum(Freq))

ggplot(ship_grouped, aes(x = Survived, y = Total, fill = Sex)) +
  geom_bar(position = "dodge", stat = "identity") +
  geom_text(aes(label = Total), position = position_dodge(width = 0.9), 
            vjust = -0.4, color = "grey68") +
  facet_wrap(~Class) +
  # formatting
  ylim(0, 750) +
  ggtitle("Don't Be A Crew Member On The Titanic",
          subtitle = "Survival Rates of Titanic Passengers by Class and Gender") +
  scale_fill_manual(values = c("#b2df8a", "#a6cee3")) +
  labs(y = "Passenger Count", caption = "Source: titanic::titanic_train") +
  theme(plot.title = element_text(face = "bold")) +
  theme(plot.subtitle = element_text(face = "bold", color = "grey35")) +
  theme(plot.caption = element_text(color = "grey68"))
```

For more info on this dataset, type `?datasets::Titanic` into the console.

## Simple examples
<!-- Simplify Note -->

<!-- Simple Explanation of Data: -->


### Bar graph using base R


<!-- Base R Plot Explanation -->
Base R scatterplots are easy to make. All you need are the two variables you want to plot. Although scatterplots can be made with categorical data, the variables you are plotting will usually be continuous.

### Bar graph using ggplot2

```r
library(ggplot2) # plotting
```

<!-- ggplot2 explanation -->

## When to use
<!-- Quick Note on When to use this plot -->

## Considerations

<!-- *   List of things to pay attention to with examples -->
### Example

## Modifications
<!-- Things to add on -->

## Theory
<!-- *Link to textbook -->
<!--*   For more info about adding lines/contours, comparing groups, and plotting continuous variables check out [Chapter 5](http://www.gradaanwr.net/content/ch05/){target="_blank"} of the textbook.-->

## External resources
<!-- - []](){target="_blank"}: Links to resources with quick blurb -->

