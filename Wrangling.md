---
title: "Wrangling"
subtitle: ""
author: "Basel R Bootcamp<br/><a href='https://therbootcamp.github.io'>www.therbootcamp.com</a><br/><a href='https://twitter.com/therbootcamp'>@therbootcamp</a>"
date: "July 2018"
output:
  xaringan::moon_reader:
    css: ["default", "baselrbootcamp.css"]
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      ratio: '16:9'

---

layout: true

<div class="my-footer"><span>
<a href="https://therbootcamp.github.io/"><font color="#7E7E7E">Basel, July 2018</font></a>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
&emsp;&emsp;&emsp;&emsp;&emsp;
<a href="https://therbootcamp.github.io/"><font color="#7E7E7E">www.therbootcamp.com</font></a>
</span></div> 

---
  






.pull-left4[

# Where you're at...

1 - Loaded packages (like `tidyverse`) with `library()`<br>

2 - Loaded external files as a new dataframe<br>

3 - Explore dataframes

4 - Calculate descriptive statistics on specific columns<br>

<br><br><br>
What's next?... <high>Wrangling!</high>

]

.pull-right55[

<br><br>


```r
# Step 0) Load libraries

library(tidyverse)

# Step 1) Read file called baslers.txt 
#  in a data folder with read_csv()
#  and save as new object baslers

baslers <- read_csv(file = "data/baslers.txt")

# Step 2) Explore data

View(baslers)   # Open in new window
dim(baslers)    # Show number of rows and columns
names(baslers)  # Show names

# Step 3) Calculate descriptives on named colums

mean(baslers$age)   # What is the mean age?
table(baslers$sex)  # How many of each sex?

# Step 4) ...
```


]


---
.pull-left45[

# What is wrangling?

<font size = 5><high>Transform</high></font>

Change column names

Add new columns

<font size = 5><high>Organise</high></font>

Sort data by columns

Merging data from two separate dataframes

Move data between columns and rows

<font size = ><high>Aggregate</high></font>

Group data and summarise
]


.pull-right5[
<br>
<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/organise_transform_aggregate.png" height = "550px">
</p>

]

---



.pull-left45[

# `dplyr` & `tidyr`

To wrangle data in R, we will use the `dplyr` and `tidyr` packages.

<br>

```r
# Load packages individually

# install.packages('dplyr')
# install.packages('tidyr')

library(dplyr)
library(tidyr)

# Or just use the tidyverse!

# install.packages('tidyverse')

library(tidyverse)
```

]
 
.pull-right5[

<br><br><br>
<img src="https://raw.githubusercontent.com/therbootcamp/Erfurt_2018June/master/_sessions/_image/dplyr_tidyr_hex.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="100%" style="display: block; margin: auto;" />

]

---

# The Pipe!  <high>`%>%`</high>

.pull-left4[

`dplyr` makes extensive use of a new operator called the "Pipe" <high>`%>%`</high><br>

Read the "Pipe" <high>`%>%`</high> as "And Then..."

<br>


```r
# Start with data
data %>% # AND THEN...
  
DO_SOMETHING %>% # AND THEN...
  
DO_SOMETHING %>% # AND THEN...
  
DO_SOMETHING %>% # AND THEN...
```

]

.pull-right55[

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/MagrittePipe.jpg/300px-MagrittePipe.jpg" width = "450px"><br>
  This is not a pipe (but %>% is!)
</p>

]



---

# The Pipe!  <high>`%>%`</high>

.pull-left4[

Task: Calculate the mean of a vector of `scores`


```r
# Create a vector score
score <- c(8, 4, 6, 3, 7, 3)
```

Base-R method


```r
mean(x = score)
```

```
## [1] 5.167
```

Pipe <high>%>%</high> method


```r
score %>%  # AND THEN 
  mean()  
```

```
## [1] 5.167
```


]

.pull-right55[

<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/pipe_explanation_kn.png" height = "400px">
</p>

]

---

# The Pipe! <high>`%>%`</high>

.pull-left4[

Task: Calculate the mean of a vector of `scores` and round to 1 digit.


```r
# Create a vector score
score <- c(8, 4, 6, 3, 7, 3)
```

Base-R method


```r
round(x = mean(score), digits = 1)
```

```
## [1] 5.2
```

Pipe <high>%>%</high> method


```r
score %>%        # AND THEN
  mean() %>%       # AND THEN
  round(digits = 1)
```

```
## [1] 5.2
```

]

.pull-right55[

<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/pipe_explanation_kn.png" height = "400px">
</p>


]


---

.pull-left35[

# `dplyr` Functions

There are <high>dozens of wrangling functions</high> in `dplyr`.

For an overview, check out <a href='http://dplyr.tidyverse.org/'>dplyr.tidyverse.org</a>

<p align="center"> <a href = 'https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf'>
  <img src="https://image.slidesharecdn.com/data-wrangling-cheatsheet-160705210122/95/data-wrangling-with-dplyr-and-tidyr-cheat-sheet-2-638.jpg?cb=1467752577g" height="270px"></a>
  <a href= 'https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf'> Wrangling Cheat Sheet</a>
</p>


]

.pull-right65[
<br><br>
<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/dplyr_functions.png" height="420px">
</p>

]


---





# Transformation Functions

.pull-left4[

<br>

| Function| Description|
|:-------------|:----|
| `rename()` | Change column names |
| `mutate()`|   Create a new column from existing columns|
| `case_when()`|  Recode values from a vector to another|
| `left_join()` | Combine multiple dataframes| 

]

.pull-right55[
<br>

```r
patients_df   # Demographic data
```

```
## # A tibble: 5 x 3
##      id     b     c
##   <dbl> <dbl> <dbl>
## 1    1.   37.    1.
## 2    2.   65.    2.
## 3    3.   57.    2.
## 4    4.   34.    1.
## 5    5.   45.    2.
```


]


---


# `rename()` 

.pull-left45[


Change <high>column names</high> with `rename()`.


```r
df %>%
  rename(NEW = OLD,
         NEW = OLD)
```


```r
patients_df  # Original
```

```
## # A tibble: 5 x 3
##      id     b     c
##   <dbl> <dbl> <dbl>
## 1    1.   37.    1.
## 2    2.   65.    2.
## 3    3.   57.    2.
## 4    4.   34.    1.
## 5    5.   45.    2.
```
]

.pull-right45[

Change the old name "b" to "age", and "c" to "arm"


```r
# 0) Start with patients_df data
patients_df %>% 

# 1) Change column names with rename()
  rename(age = b,  # New = Old
         arm = c)  # New = Old
```

```
## # A tibble: 5 x 3
##      id   age   arm
##   <dbl> <dbl> <dbl>
## 1    1.   37.    1.
## 2    2.   65.    2.
## 3    3.   57.    2.
## 4    4.   34.    1.
## 5    5.   45.    2.
```


]

---

# `mutate()` 

.pull-left35[

Calculate <high>new columns</high>, or change existing ones, with `mutate()`.


```r
df %>%
  mutate(
   NEW1 = DEFINITION1,
   NEW2 = DEFINITION2,
   NEW3 = DEFINITION3,
   ...
  )
```
]

.pull-right6[

Calculate two new columns `age_months` and `age_years`


```r
patients_df %>% 

  rename(age = b, 
         arm = c) %>%   # AND THEN...
  
# Create new columns with mutate()
  mutate(age_months = age * 12,
         age_decades = age / 10)
```

```
## # A tibble: 5 x 5
##      id   age   arm age_months age_decades
##   <dbl> <dbl> <dbl>      <dbl>       <dbl>
## 1    1.   37.    1.       444.        3.70
## 2    2.   65.    2.       780.        6.50
## 3    3.   57.    2.       684.        5.70
## 4    4.   34.    1.       408.        3.40
## 5    5.   45.    2.       540.        4.50
```

]

---

# `case_when()`

.pull-left4[

Use `case_when()` with `mutate()` to define <high>new columns based on logical conditions</high>.


```r
# Using mutate(case_when())
df %>%
  mutate(
    NEW = case_when(
      COND1 ~ VAL1,
      COND2 ~ VAL2
    ))
```


]

.pull-right55[


```r
patients_df %>% 

  rename(age = b, 
         arm = c) %>%
  
  # Create column arm_char based on values of arm
  
  mutate(arm_char = case_when(arm == 1 ~ "placebo",
                              arm == 2 ~ "drug"))
```

```
## # A tibble: 5 x 4
##      id   age   arm arm_char
##   <dbl> <dbl> <dbl> <chr>   
## 1    1.   37.    1. placebo 
## 2    2.   65.    2. drug    
## 3    3.   57.    2. drug    
## 4    4.   34.    1. placebo 
## 5    5.   45.    2. drug
```

]


---

# Joining data
 
<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/joining_data.png" height="450px">
</p> 


---

# `left_join()`

.pull-left35[

Use `left_join()` to <high>combine two data frames</high> based on one or more key columns


```r
# Join df2 to df1
#   using KEY as the key column
df1 %>%
  left_join(df2, 
      by = c("KEY"))
```

<br2>
<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/joining_data.png" height="190px">
</p> 

]

.pull-right6[


```r
# Join patients_df with results_df to create combined_df
combined_df <- patients_df %>% 
  rename(age = b, arm = c) %>%
  mutate(arm_char = case_when(arm == 1 ~ "placebo",
                              arm == 2 ~ "drug")) %>%
  
# Join with results_df with left_join()
  left_join(results_df, by = "id")

# Show a few columns
combined_df %>%
  select(id, arm, age, t1, t2)
```

```
## # A tibble: 5 x 5
##      id   arm   age    t1    t2
##   <dbl> <dbl> <dbl> <dbl> <dbl>
## 1    1.    1.   37.  123.  135.
## 2    2.    2.   65.  143.  140.
## 3    3.    2.   57.   NA    NA 
## 4    4.    1.   34.  100.  105.
## 5    5.    2.   45.   NA    NA
```

]

---


# Keep in mind

.pull-left35[

1 - Don't forget to start by assigning to a new (or existing) object with <-<br>

2 - Keep adding new functions connected by the pipe <high>%>%</high><br>

3 - Order matters! You can refer to new columns in later code
<br><br>



]

.pull-right6[


```r
# 0) Start with patients_df data
combined_df <- patients_df %>%
  
# 1) Change column names with rename()
  rename(age = b,  
         arm = c) %>%  # AND THEN...
  
# 2) Create new columns with mutate()
  mutate(age_months = age * 12,
         age_decades = age / 10,
         arm_char = case_when(arm == 0 ~ "placebo",
                              arm == 1 ~ "drug")
         ) %>%  # AND THEN..
  
# 3) Add data from results_df with left_join()
  left_join(results_df, by = "id")
```


]

---

# Organisation Functions

.pull-left35[

Organisation functions help you shuffle your data by <high>sorting rows</high> by columns, <high>filter rows</high> based on criteria, <high>select columns</high> (etc).

]

.pull-right6[

| Function| Purpose|Example|
|:--------|:----|:-------------|
| `arrange()` |Sort rows by columns|`df %>%`<br>`arrange(arm, age)`|
| `slice()`|   Select rows by location|`df %>%`<br>`slice(1:10)`|
| `filter()` | Select specific rows by criteria|`df %>%`<br>`filter(age > 50)`|
| `select()`|   Select specific columns|`df %>%`<br>`select(arm, t1)`|

]

---

# `arrange`

.pull-left3[

Use `arrange()` to <high>arrange (aka, sort) rows</high> in increasing or decreasing order of one (or more) columns.

To sort in descending order, use `desc()`

]

.pull-right65[

<font size = 5></font>


```r
# Sort combined_df by id 
# then in descending order of age
combined_df %>%
  arrange(id, desc(age))
```

```
## # A tibble: 5 x 6
##      id   age   arm arm_char    t1    t2
##   <dbl> <dbl> <dbl> <chr>    <dbl> <dbl>
## 1    1.   37.    1. placebo   123.  135.
## 2    2.   65.    2. drug      143.  140.
## 3    3.   57.    2. drug       NA    NA 
## 4    4.   34.    1. placebo   100.  105.
## 5    5.   45.    2. drug       NA    NA
```

]

---

# `filter`


.pull-left4[

Use `filter()` to <high>select rows</high> (and remove others) based on criteria

For complex conditions, chain multiple logical comparison operators with `&` (AND) and `|` (OR)

<high>`==`</high> - is equal to<br>
<high>`<`</high>, <high>`>`</high> - smaller/greater than<br>
<high>`≤`</high>, <high>`≥`</high> - smaller/greater than or equal<br>
<high>`&`</high>, <high>`&&`</high> - logical AND<br>
<high>`|`</high>, <high>`||`</high> - logical OR<br>

]

.pull-right55[

Select <i>only</i> patients over 30 given drug.


```r
# Filter patients older than 30 given drug
combined_df %>%
  arrange(id, desc(age)) %>%
  filter(age > 30 & arm_char == "drug")
```

```
## # A tibble: 3 x 6
##      id   age   arm arm_char    t1    t2
##   <dbl> <dbl> <dbl> <chr>    <dbl> <dbl>
## 1    2.   65.    2. drug      143.  140.
## 2    3.   57.    2. drug       NA    NA 
## 3    5.   45.    2. drug       NA    NA
```

]

---

# `select`

.pull-left4[

Use `select()` to <high>select columns</high> (and remove all others)


```r
# Select columns id, age
df %>% 
  select(id, age)
```

<high>Remove columns</high> with `-`.


```r
# Select everything BUT sex and id
df %>% 
  select(-sex, -id)
```


]

.pull-right55[

Remove `age_months` and `age_decades` colummns.


```r
combined_df %>%
  
  arrange(id, desc(age)) %>%
  
  filter(arm_char == "drug" & age > 30) %>%
  
# Drop age and arm columns
  select(-age, -arm)
```

```
## # A tibble: 3 x 4
##      id arm_char    t1    t2
##   <dbl> <chr>    <dbl> <dbl>
## 1    2. drug      143.  140.
## 2    3. drug       NA    NA 
## 3    5. drug       NA    NA
```

]


---

# Grouped Aggregation

<p align="center">
  <img src="https://raw.githubusercontent.com/therbootcamp/therbootcamp.github.io/master/_sessions/_image/summarsed_data_diagram.png" height="470px">
</p> 



---

# `group_by`, `summarise`

.pull-left45[

Use `group_by()` to <high>group data</high> according to one or more columns

After grouping data, use `summarise()` to <high>calculate summary statistics</high> across groups of data

<u>Statistical functions</u>

| Function| asdf |
|:-------------|:---|
| `n()`| Number of cases in each group|
| `mean()`, `median()`, `max()`, `min()` `sum()` | Summary stats|
]

.pull-right45[





```r
# Group data by arm, and calculate many
#  summary statistics
combined_df %>%
  group_by(arm) %>%
  summarise(
    N = n(),
    age_mean = mean(age),
    t1_mean = mean(t1, na.rm = TRUE),
    t2_mean = mean(t2, na.rm = TRUE)
  )
```

```
## # A tibble: 2 x 5
##   arm         N age_mean t1_mean t2_mean
##   <chr>   <int>    <dbl>   <dbl>   <dbl>
## 1 drug        3     55.7    143.    140.
## 2 placebo     2     35.5    112.    120.
```


]


---

# Reshaping data

.pull-left45[

Two key functions that allow you to <high>`reshape`</high> a dataframe between 'wide'and 'long' formats.

Some functions require data to be in a certain shape.

#### Two key tidyr functions

| Function | Result |
|:----------|:-------|
|`gather()`|Move data from 'wide' to 'long' format|
|`spread()`|Move data from 'long' to 'wide' format|

]

.pull-right5[

#### 'Wide' vs. 'Long' data




```r
# Wide format
stock_w
```

```
##   id t1 t2
## 1  a 10 20
## 2  b 20 26
## 3  c 15 30
```


```r
# Long format
stock_l
```

```
##   id time measure
## 1  a   t1      10
## 2  b   t1      20
## 3  c   t1      15
## 4  a   t2      20
## 5  b   t2      26
## 6  c   t2      30
```

]

---

.pull-left45[

# `gather`


```r
# Show wide data
stock_w
```

```
##   id t1 t2
## 1  a 10 20
## 2  b 20 26
## 3  c 15 30
```


```r
# "Gather" wide data to long
stock_w %>% 
  gather(time,    # New group column
         measure, # New target column
         -id)     # ID column
```

```
##   id time measure
## 1  a   t1      10
## 2  b   t1      20
## 3  c   t1      15
## 4  a   t2      20
## 5  b   t2      26
## 6  c   t2      30
```

]

.pull-right45[

# `spread`


```r
# Show long data
stock_l
```

```
##   id time measure
## 1  a   t1      10
## 2  b   t1      20
## 3  c   t1      15
## 4  a   t2      20
## 5  b   t2      26
## 6  c   t2      30
```



```r
# "Spread" long data to wide
stock_l %>% 
  spread(time,    # Old group column
         measure) # Old target column
```

```
##   id t1 t2
## 1  a 10 20
## 2  b 20 26
## 3  c 15 30
```

]


---

# Summary

.pull-left4[

1 - Start by assigning your result to a new object to save it!

2 - "Keep the pipe <high>%>%</high> going" to continue working with your data frame.

3 - The output of dplyr functions will (almost) always be a <high>tibble</high>.

4 - You can almost always include <high>multiple operations</high> within each function.

]

.pull-right55[


```r
# Assign result to baslers_agg

baslers_agg <- baselers %>% 
  
  # Change column names with rename()
  rename(age_years = age,
         weight_kg = weight)  %>% # PIPE!

  # Select specific rows with filter()
  filter(age_years < 40)  %>% # PIPE!
  
  # Create new columns witb mutate()
  mutate(debt_ratio = debt / income)  %>% # PIPE!
  
  # Group data with group_by()
  group_by(sex) %>% # PIPE!
  
  # Calculate summary statistics with summarise()
  summarise(income_mean = mean(income),
            debt_mean = mean(debt),
            dr_mean = mean(dr))
```

]

---

# Practical


<p>
  <font size=6>
    <a href="https://therbootcamp.github.io/BaselRBootcamp_2018July/_sessions/Wrangling/Wrangling_practical.html"><b>Link to practical<b></a>
  </font>
</p>
