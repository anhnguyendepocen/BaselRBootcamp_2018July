---
title: "Dynamic Reports"
subtitle: "With RMarkdown"
author: "BaselRBootcamp July 2018<br/><a href='https://therbootcamp.github.io'>www.therbootcamp.com</a><br/><a href='https://twitter.com/therbootcamp'>@therbootcamp</a>"
output:
  html_document:
    css: practical.css
---




<figure>
<center>
  <img src="https://d33wubrfki0l68.cloudfront.net/00ed9c32053cbc805efa51b66be570558480a4c8/7a292/images/rmarkdownoutputformats.png" alt="Trulli" style="width:40%">
  <figcaption>www.rstudio.com</figcaption>
</figure>


## Overview

By the end of this practical you will know how to:

1. Create a new R Markdown file (`.Rmd`)
2. "Knit" an R Markdown file to an `.html` or `.pdf` report
3. Format text using formatting tags
4. Create code chunks
5. Add plots and tables
5. Include code output in sentences with inline chunks

## Packages

|Package| Installation|
|:------|:------|
|`tidyverse`|`install.packages("tidyverse")`|
|`knitr`|`install.packages("knitr")`|
|`DT`|`install.packages("DT")`|
|`broom`|`install.packages("broom")`|
|`rmdformats`|`install.packages("rmdformats")`|

### Cheatsheet

<a href="https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf">
  <center><img src="http://westandproud.info/wp-content/uploads/2018/04/reproducible-and-interactive-research-with-regard-to-cheat-sheet-r-markdown.png" width="600px">
</a>

## Datasets



|File  |Description| Rows | Columns |
|:----|:-----------------------------|:-----|:------|
|[mcdonalds.csv](https://raw.githubusercontent.com/therbootcamp/BaselRBootcamp_2018July/master/_sessions/_data/complete/mcdonalds.csv)| Nutrition information from McDonalds menu items| 260 | 24 |
|[happiness.csv](https://raw.githubusercontent.com/therbootcamp/BaselRBootcamp_2018July/master/_sessions/_data/complete/happiness.csv)| Results from the World Health Organisation happiness survey | 155 | 12 |

## Tasks

## A - Setup

1. Open your `baselrbootcamp` R project. It should already have the folders `1_Data` and `2_Code`. Make sure that the data files listed in the Datasets section above are in your `2_Data` folder



2. Because R Markdown looks quite a bit different from standard R code, the best way to look at examples is to see a new R Markdown document in action. In RStudio, click File -- New File -- R Markdown

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/rmarkdown_ss_A.png" width="60%" style="display: block; margin: auto;" />

3.  Give the document a title and an author. For the output format, select HTML (the default). Click Ok!

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/rmarkdown_ss_B.png" width="60%" style="display: block; margin: auto;" />

4. A new file that looks like this should open up. This is your first R Markdown document!

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/rmarkdown_ss_C.png" width="60%" style="display: block; margin: auto;" />

5. Save your markdown file *in your main project directory* (not in the `4_Markdown` folder! -- you'll put it there later!) under the name `mcdonalds.Rmd`

6. Now *knit* your document to an HTML file. To do this, click the *knit* button (or use the Command + Shift + K shortcut)

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/rmarkdown_ss_D.png" width="60%" style="display: block; margin: auto;" />

7. Now you should see your final, HTML document! Scroll up and down the document and see how she looks!

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/rmarkdown_ss_E.png" width="60%" style="display: block; margin: auto;" />

## B - Here's your goal!

1. Your goal in this practical is to create as much of [this html document](https://therbootcamp.github.io/BaselRBootcamp_2018July/_sessions/DynamicReports/DynamicReports_answers.html) as you can! Open the document and keep it open in a separate window as you work through the practical.

## C - Load packages, data and set default chunk options

1. You should always start your markdown file by loading packages and data in a code chunk. We'll do this inside of the first chunk with the `setup` label. Inside of this chunk, write the comment `# Load Packages -------------`. Then, using the `library()` function, load the packages listed in the `Packages` section above. 

<img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/setup_chunk.jpg" width="50%" style="display: block; margin: auto;" />

2. Knit your document! Make sure you don't get any errors!

3. Now it's time to load your datafiles. In the *same* `setup` chunk, load each of the data files listed in the `Datasets` section. 


```r
# --- Load packages
library(XX)
library(XX)

# --- Load data
XXX <- read_csv()
XXX <- read_csv()
```

4. Knit your document! Make sure you don't get any errors!

5. Now it's time to change some of the default chunk options. In your *setup* chunk, change the existing values of `knitr::opts_chunk$set` to the following:


```r
# INCLUDE ALL OF THIS CODE IN YOUR FIRST CHUNK!

knitr::opts_chunk$set(fig.width = 6,        # Figure width (in)
                      fig.height = 4,       # Figure height (in)
                      echo = FALSE,          # Repeat code
                      eval = TRUE,          # Evaluate chunks
                      message = FALSE,      # Don't print messages
                      warning = FALSE,      # Don't print warnings
                      fig.align = 'center') # Center figures

options(digits = 2)  # Round all output to 2 digits
```

6. Knit your document! Make sure you see an output!

## D - Add formatted text and an image

1. Below your last markdown chunk, write the necessary text and Markdown tags to create the following sentence. Be sure to create italic and bold text using the proper formatting tags!

- In this practical, I will analyse two datasets and show reproducible results in a dynamic document created in R Markdown. R Markdown is great because I can integrate R code directly into my document, and easily use *italics* and **bold** using formatting tags.

2. Create a new first level header with the text "Fast Food Nutrition" using a single hashtag.

3. Knit the document!

4. Create a new code chunk by either clicking the "Insert - R" button, or by using the "Command + Option + I"" shortcut on Mac

5. Now it's time to add an image to your document! In the chunk you just created, use the following template to include [this image of a burger](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cheeseburger.jpg/2560px-Cheeseburger.jpg) in your document. You can find the image at the following link: [Link](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cheeseburger.jpg/2560px-Cheeseburger.jpg).


```r
# Include a buger image

include_graphics(path = "XXX")
```

6. Knit the document!

7. Was your image too big? To make the image a bit smaller, include the chunk argument `out.width = "30%"`.

8. Knit the document!

9. Include the appropriate text and formatting to write the sentence below. When writing the number of columns and rows, use in-line chunks to get the data directly from the `mcdonalds` object! You can get the number of columns with `ncol(mcdonalds)` and the number of rows with `nrow(mcdonalds)`

- The `mcdonalds` data has 24 columns and 260 rows. Each row corresponds to a different menu item. The data originally come from [https://www.kaggle.com/mcdonalds/nutrition-facts](https://www.kaggle.com/mcdonalds/nutrition-facts).

10. Knit the document!

## E - Add a formatted table with `datatable()`

1. Create a new code chunk.

2. Inside the chunk, include the following code which uses the `datatable` function to render a dataframe as a nicely formatted HTML table.


```r
datatable(mcdonalds %>% select(1:6))
```

3. Knit the document! Do you see your nicely formatted table?

4. Play around with your table. Instead of selecting the first 6 columns, select the columns `Item`, `Category`, `Calories`, `Sodium`

5. Knit the document!

## F - Add plots

1. Write the appropriate combination of markdown, text, and code to create the following output. Be sure to specify the mean and maximum umber of calories using inline chunks!. Here's some `ggplot2` code that might help in creating your plot.

<img src="https://github.com/therbootcamp/therbootcamp.github.io/blob/master/_sessions/_image/calories_histogram.jpg?raw=true" width="75%" style="display: block; margin: auto;" />


```r
# Create a histogram of Calories

ggplot(data = mcdonalds,
       aes(x = XX)) +
  geom_histogram(col = "white") +
  labs(title = "XX",
       subtitle = "XX",
       caption = "XX") +
  theme_bw()
```

2. Knit the document! Diagnose and correct any errors!

3. Write the appropriate combination of markdown, text, and code to create the following output (Here's some `ggplot2` code that might help!):

<img src="https://github.com/therbootcamp/therbootcamp.github.io/blob/master/_sessions/_image/calories_sodium_ss.jpg?raw=true" width="75%" style="display: block; margin: auto;" />


```r
# Create a scatterplot showing the relationship
#  between Calories and Sodium

ggplot(data = XX,
       aes(x = XX, y = XX)) +
  geom_point() +
  labs(title = "XX",
       subtitle = "XX",
       caption = "XX") +
  theme_bw()
```

4. Knit the document! Diagnose and correct any errors!

## G - Add a table of statistical test results

Now let's show the results of a regression analysis predicting the sodium content of an item as a function of its calories.

1. Create a new code chunk. Inside of the chunk, create an object called `cal_sod_lm`  that is the result of a regression analysis predicting `Sodium` as a function of `Calories`. Use the following template


```r
# Create regression model predicting Sodium from Calories

cal_sod_lm <- lm(formula = XX ~ XX,
                 data = mcdonalds)
```

2. Now, using the following template for help, write the appropriate text / code to create the following output.


```r
# Export cal_sod_lm to a nicely formatted table

kable(x = tidy(cal_sod_lm), 
      digits = 3, 
      caption = "Regression analysis predicting Sodium from Calories")
```

<img src="https://github.com/therbootcamp/therbootcamp.github.io/blob/master/_sessions/_image/regression_output.jpg?raw=true" width="75%" style="display: block; margin: auto;" />

3. Knit the document! Diagnose and correct any errors!

## H - Keep going!

1. Add the appropriate code to add the following output. 

<img src="https://github.com/therbootcamp/therbootcamp.github.io/blob/master/_sessions/_image/calories_category_ss.jpg?raw=true" width="75%" style="display: block; margin: auto;" />


```r
ggplot(data = mcdonalds,
       aes(x = XX, y = XX, fill = XX)) +
  stat_summary(geom = "bar", fun.y = "mean") +
  guides(fill = FALSE) +
  labs(title = "McDonalds Menu Items",
       subtitle = "Created with ggplot2",
       caption = "Source: Kaggle.com") +
  theme_bw()
```

2. Knit the document! Diagnose and correct any errors!

3. Add the appropriate code to add the following table of summary statistics of Calories for each category. Use the following code chunk below for help if you need it! 

<img src="https://github.com/therbootcamp/therbootcamp.github.io/blob/master/_sessions/_image/calories_category_summary_ss.jpg?raw=true" width="75%" style="display: block; margin: auto;" />


```r
# Calculate several summary statitics of Calories

Calories_agg <- mcdonalds %>%
  group_by(XX) %>%
  summarise(
    Min = min(Calories),
    Mean = mean(Calories),
    Median = median(Calories),
    Max = max(Calories)
  )

# Export Calories_agg to an HTML table
kable(x = XX)
```

4. Knit the document! Diagnose and correct any errors!

## I - Managing working directories with Markdown

1. Now it's time to move your Markdown file to your `4_Markdown` folder. Move your `speffanalysis.Rmd` file to your `4_Markdown` folder using your computer file browser (Finder on Mac, Windows explorer on PC). Now, try knitting your document. You should get an error! What happened?!

2. The problem is that when you knit your Markdown file, R changes your working directory to the folder where your markdown file is located. However, now that you moved your file to your `4_Markdown` folder, this isn't true anymore. You need to tell Markdown that the root directory of your project is one directory up! Thankfully this is easy to do. Just add the following code to your initial `setup` R chunk:


```r
# Tell R Markdown that the root directory is now one folder
#   up from the folder the markdown file is in

knitr::opts_knit$set(root.dir = "../")
```

3. Knit your document! Did everything work? If not, try to correct the working directory issues. Don't be afraid to ask for help!

## X - Add results from the happiness survey

1. If you've gotten this far, then you've really gotten the hang of R Markdown! Try adding the correct combination of text, tags, and code to add all of the results from the `happiness` data contained here: [https://therbootcamp.github.io/BaselRBootcamp_2018July/_sessions/DynamicReports/DynamicReports_answers.html](https://therbootcamp.github.io/BaselRBootcamp_2018July/_sessions/DynamicReports/DynamicReports_answers.html)


### References and Links

- The `rmdformats` package has many nice templates for .Rmd files. Look at their GitHub page at [https://github.com/juba/rmdformats](https://github.com/juba/rmdformats) for examples. If you install the package from CRAN with `install.packages('rmdformats')`, you'll get lots of new templates when you open a new Markdown file in RStudio. 

- If you want to use custom .css files, check out the the [R Studio HTML document guide](http://rmarkdown.rstudio.com/html_document_format.html#custom_css). You can also look at the .css files underlying the `rmdformats` package on their GitHub page here [https://github.com/juba/rmdformats](https://github.com/juba/rmdformats). For example, here is their .css file for the "html docco" template [https://raw.githubusercontent.com/juba/rmdformats/master/inst/templates/html_docco/docco.css](https://raw.githubusercontent.com/juba/rmdformats/master/inst/templates/html_docco/docco.css)