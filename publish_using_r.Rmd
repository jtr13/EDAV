# Publishing with R {#publish}

![](images/banners/banner_publish.png)

## Overview

This section discusses how we built *edav.info/* and includes references for building sites/books of your own using R.

## Bookdown

*edav.info/* is built using [Bookdown](https://bookdown.org/){target="_blank"}, "a free and open-source R package built on top of [R Markdown](https://rmarkdown.rstudio.com/){target="_blank"} to make it really easy to write books and long-form articles/reports."

The biggest selling-point for `bookdown` is that it allows you to make content that is both professional and adaptable. If you want to update a regular book, you need to issue another edition and go through a lot of hassle. With `bookdown`, you can publish it in different formats (including print, if desired) and be able to change things easily when needed.

We chose `bookdown` for *edav.info/* because it allows us to present a lot of content in a compact, searchable manner, while also letting students suggest updates and contribute to its structure. Again, it is professional *and* adaptable (The default `bookdown` output is essentially just an online book, but we tried to liven it up by adding a lot of helpful icons, logos, and banners to improve navigation).

Below are some helpful references we used in creating *edav.info/*, which may be helpful if you are interested in creating your own website or online resource with R.

## Essentials

- [How to Start a Bookdown Book](http://seankross.com/2016/11/17/How-to-Start-a-Bookdown-Book.html){target="_blank"}: The hardest part about `bookdown` is getting it up and running. [Sean Kross](http://seankross.com/about/){target="_blank"} has the best template instructions we found. We started this project by cloning his template repo and building off of it. Excellent descriptions on what all the files do and what is essential to start your project.

- [bookdown: Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/){target="_blank"}: This textbook by [Yihui Xie](https://yihui.name/en/){target="_blank"}, author of the `bookdown` package, explains everything `bookdown` is able to accomplish (published using `bookdown`...because of course it is). An incredible informative reference which we always kept close by. Author's blurb:

> A guide to authoring books with R Markdown, including how to generate figures and tables, and insert cross-references, citations, HTML widgets, and Shiny apps in R Markdown. 
>

- [RStudio Bookdown Talk](https://www.rstudio.com/resources/webinars/introducing-bookdown/){target="_blank"}: Yihui Xie (author of the `bookdown` package) discusses his package and what it can do in a one-hour talk. Good for seeing finished examples.

- [bookdown.org](https://bookdown.org/home/about.html){target="_blank"}: Site for the `bookdown` package. Has a bunch of popular books published using `bookdown` and some info about how to get started using the package.

- [Creating Websites in R](http://www.emilyzabor.com/tutorials/rmarkdown_websites_tutorial.html){target="_blank"}: This tutorial, written by [Emily Zabor](http://www.emilyzabor.com/){target="_blank"} (a Columbia alum), provides a thorough walkthrough for creating websites using different R tools. She discusses how to make different kinds of sites (personal, package, project, blog) as well as GitHub integration and step-by-step instructions for getting setup with templates and hosting. Very detailed and worth perusing if interested in making your own site.

## Trimmings

- **Custom Domain Names**: GitHub integration with custom domain names is easy to setup. GitHub has an article on [how to setup a custom domain with GitHub Pages](https://help.github.com/articles/using-a-custom-domain-with-github-pages/){target="_blank"} that will help to get your desired URL hooked up (custom domain names: the vanity plates of the internet). [GitHub Pages](https://pages.github.com/){target="_blank"} supports free hosting, which makes the whole process a lot easier. Also, if you are in the market for a cool domain name, [Google Domains](https://domains.google/#/){target="_blank"} is a great place to get the one of your dreams.

- **Custom 404 Page**: Your site may be lovely, but a default 404 page is always a let down. Not *if* but *when* someone types part of your URL incorrectly or a link gets broken, you should make sure there is something to see other than a boring backend page you had no input in designing. [This article](https://mycyberuniverse.com/developing/custom-404-page-for-website-hosted-on-github.html){target="_blank"} explains the process, but all you have to do is make a file called `404.html` in your root directory and GitHub will use it rather than the default. Because of this, there is really no excuse for not having one. Here's a look at [our 404 page](404.html). Hopefully you aren't seeing it that often. :)

    Some considerations:
    - **Always include a link back to the site**: Throw the user a life-saver.
    - **Make it clear that something went wrong**: Don't hide the fact that this page is because of some error.
    - **Other than that, have fun with it!**: There are [plenty of examples](https://www.canva.com/learn/404-page-design/){target="_blank"} of people making [excellent 404 pages](https://www.pagecloud.com/blog/best-404-pages){target="_blank"}. It should make a frustrating experience just a little bit more bearable.

## Other Resources

- [blogdown: Creating Websites with R Markdown](https://bookdown.org/yihui/blogdown/){target="_blank"}: Textbook on the `blogdown`package, another option for generating websites with R.







