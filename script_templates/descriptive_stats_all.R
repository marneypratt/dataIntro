# the code below will calculate descriptive statistics for a variable of interest grouped by another variable
# the tidyverse package must be loaded before this will work

# replace the blank below with a continuous variable you want to summarize
x.var <- "___" 


# replace the blank below with the name of the dataframe
df.sum <- ___  |>  
  # remove missing values from continuous variables
  filter(!is.na(.data[[x.var]])) |> 
  
  # replace the blank with the categorical variable(s)
  group_by(___) |> 
  
  # calculate the descriptive stats
  summarize(mean = mean(.data[[x.var]]), 
            median = median(.data[[x.var]]), 
            SD = sd(.data[[x.var]]), 
            IQR = IQR(.data[[x.var]]), 
            min = min(.data[[x.var]]),
            max = max(.data[[x.var]]),
            N = n())

df.sum