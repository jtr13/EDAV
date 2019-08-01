# Publishing Resources {#publish}

![](images/banners/banner_publish.png)

## Overview

This section discusses how we built *edav.info/* and includes references for building sites and books of your own using R.

## tl;dr

Want to get started making a site complete with Travis CI like this one? Zach Bogart has created [a bookdown-template](https://github.com/zachbogart/bookdown-template){target="_blank"} you can clone and build off of to create your own site. For instructions, consult the README file. 

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
    
## Adding a custom domain name

There are several parts to adding a custom domain name.

1. Buy a domain name and edit DNS settings

We used [Google domains](https://domains.google.com/){target="_blank"}. In [the registrar page](https://domains.google.com/registrar){target="_blank"}, click the DNS icon and add the following to Custom resource records:

|NAME|TYPE|TTL|DATA|
|----|----|---|----|
|@|A|1h|185.199.108.153|
|www|CNAME|1h|@|

Note that some tutorials list older IP addresses.  Check [here](https://help.github.com/articles/troubleshooting-custom-domains/#dns-configuration-errors){target="_blank"} for the recommended ones.

2. Change settings in your repo

In Settings, add your custom domain name in the GitHub Pages section.

3. Add a CNAME file to the `gh-pages` branch

This is a very simple text file named CNAME (all caps). The contents should be one line with the custom domain name. 

For more detail on steps 2 and 3, see: [Emily Zabor's Tutorial on Custom Domains](http://www.emilyzabor.com/tutorials/rmarkdown_websites_tutorial.html#custom_domains){target="_blank"}

## Make a custom 404 page

Your site may be lovely, but a default 404 page is always a let down. Not *if* but *when* someone types part of your URL incorrectly or a link gets broken, you should make sure there is something to see other than a boring backend page you had no input in designing. [This article](https://mycyberuniverse.com/developing/custom-404-page-for-website-hosted-on-github.html){target="_blank"} explains the process, but all you have to do is make a file called `404.html` in your root directory and GitHub will use it rather than the default. Because of this, there is really no excuse for not having one. Here's a look at [our 404 page](404.html). Hopefully you aren't seeing it that often. <i class="far fa-smile"></i>

Some considerations:

- **Always include a link back to the site**: Throw the user a life-saver.
- **Make it clear that something went wrong**: Don't hide the fact that this page is because of some error.
- **Use absolute paths**: The URL that throws the 404 error may be nested within unexpected folders. Make sure if you have any images or links, they work regardless of the file path (use "/images/..." rather than "images/...", maybe link directly to css/homepage, etc.)
- **Other than that, have fun with it!**: There are [plenty of examples](https://www.canva.com/learn/404-page-design/){target="_blank"} of people making [excellent 404 pages](https://www.pagecloud.com/blog/best-404-pages){target="_blank"}. It should make a frustrating experience just a little bit more bearable.
    
## Hooking up Travis

This tutorial is designed to help you add Travis to your GitHub Pages bookdown web site.  It assumes you already have a working web site, with pages stored in a `gh-pages` branch. 

We're not necessarily recommending the `gh-pages` route; we chose it since we found examples that worked for us using this method.  Since the `/docs` folder is a newer and cleaner approach, it is certainly possible that it provides a better way to organize the repo.

That said, there are various tutorials for how to set up the `gh-pages` branch; it appears that the best way to do so is to create an orphan branch, as explained [here](https://www.bruttin.com/2017/12/22/github-ghpages-worktree.html){target="_blank}.

We should note that this makes it all seem very easy to add Travis, which actually was not the case at all for us.  I guess everything looks easy in retrospect. If you run into trouble, let us know by [filing an issue](https://github.com/jtr13/edav/issues){target="_blank"} or [submitting a pull request](https://github.com/jtr13/edav/pulls){target="_blank}. More info on all the contribution stuff can be found on our [contribute page](contribute.html).

### Add Travis files to GitHub repo

**Add these files** to your repo:

1. [https://github.com/rstudio/bookdown-demo/blob/master/.travis.yml](https://github.com/rstudio/bookdown-demo/blob/master/.travis.yml){target="_blank}
    - No changes

2. [https://github.com/rstudio/bookdown-demo/blob/master/_build.sh](https://github.com/rstudio/bookdown-demo/blob/master/_build.sh){target="_blank}
    - Remove the last two lines if you're only interested in a GitHub Pages book.

3. [https://github.com/rstudio/bookdown-demo/blob/master/_deploy.sh](https://github.com/rstudio/bookdown-demo/blob/master/_deploy.sh){target="_blank}
    - The only changes you need to make are to the `git config` lines. You need to use your GitHub email, but the username can be anything.

### Add Travis service

1. **Create a Travis account** on www.travis-ci.org by clicking on "Sign in with GitHub" on the top right.  Click Authorize to allow Travis to have proper access to GitHub.

2. Go back to GitHub and **create a personal access token (PAT)** if you don't have one already.  You can do so [here](https://github.com/settings/tokens){target="_blank"}. Note that you must save your PAT somewhere because you can't access it once it's created.  Also note that the PAT provides a means to access your GitHub repo through an API, an alternative means to logging in with your username/password (There is an API Token in Travis but this is *not* the one to use).

3. **Return to your Travis profile** (travis-ci.org/profile/[GITHUB username]) and click the button next to the appropriate repo to **toggle it on**.  Click on Settings next to the button and **add your saved GITHUB_PAT** under Environmental Variables: set "Name" to "GITHUB_PAT" and "Value" to the value of the token.

If all goes well, you can sit back, relax, and watch Travis do the work for you.

<center>
<iframe src="https://giphy.com/embed/uLP5x8WzYVzP2" width="480" height="258" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/funny-the-simpsons-uLP5x8WzYVzP2">via GIPHY</a></p>
</center>

## Notes on our workflow

### 

## Other resources

- [blogdown: Creating Websites with R Markdown](https://bookdown.org/yihui/blogdown/){target="_blank"}: Textbook on the `blogdown`package, another option for generating websites with R.
- [Getting Started with GitHub Pages](https://guides.github.com/features/pages/){target="_blank"}: Short article from [GitHub Guides](https://guides.github.com/){target="_blank"} on creating/hosting a website using [GitHub Pages](https://pages.github.com/){target="_blank"}.
- [A Beginner's Guide to Travis CI for R](https://juliasilge.com/blog/beginners-guide-to-travis/){target="_blank"}: Fantastic blog post by [Julia Silge](https://juliasilge.com/){target="_blank"}, includes debugging advice that helped us solve a problem involving installing packages with system requirements.

