# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the tidyverse package must be loaded before this will work

# replace the blank below with a continuous variable you want to summarize
cont.var <- "___" 

#replace the blank below with the categorical variable that is your factor (this is the grouping variable)
factor.var <- "___"


# replace the blank below with the name of the dataframe
df.sum <- ___  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[cont.var]])) |> 
  
  # replace the blank with the categorical variable(s)
  group_by(.data[[factor.var]]) |> 
  
  # calculate the descriptive stats
  summarize(Sample.size = n(),
            Min = min(.data[[cont.var]]),
            Q1 = quantile(.data[[cont.var]], .25),
            Median = median(.data[[cont.var]]),
            Q3 = quantile(.data[[cont.var]], .75),
            Max = max(.data[[cont.var]]),
            Mean = mean(.data[[cont.var]]),              
            SD = sd(.data[[cont.var]]))

df.sum