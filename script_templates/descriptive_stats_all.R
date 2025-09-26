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
  summarize(mean = mean(.data[[cont.var]]), 
            median = median(.data[[cont.var]]), 
            SD = sd(.data[[cont.var]]), 
            IQR = IQR(.data[[cont.var]]), 
            min = min(.data[[cont.var]]),
            max = max(.data[[cont.var]]),
            N = n())

df.sum