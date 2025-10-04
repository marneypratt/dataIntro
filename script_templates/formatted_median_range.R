# to use this code, the following poackages must be loaded
# tidyverse
# flextable
 
#make sure you have imported your data and defined your variables before running this code

#see https://davidgohel.github.io/flextable/ for more info & formatting options

#see https://davidgohel.github.io/flextable/ for more info & formatting options

# Use the following for digits in the `round` function
# -   rounding to the hundreds place use digits=-2
# -   rounding to the tens place use digits=-1
# -   rounding to the ones place use digits=0
# -   rounding to the tenths place use digits=1
# -   rounding to the hundredths place use digits=2


#set the number of digits to round to based on the rules above (this blank should be just a number)
round.digit <- ___


#calculate descriptive stats
#replace the blank below with the name of the dataframe
df.sum <- df |> 
  
  # replace the blank with the categorical variable(s)
  group_by(.data[[factor.var]]) |> 
  
  # remove missing values 
  filter(!is.na(.data[[cont.var]])) |> 
  
  #calculate the rounded values
  summarise(Median = round(median(.data[[cont.var]]), digits=round.digit),
            min = round(min(.data[[cont.var]]), digits=round.digit),
            max = round(max(.data[[cont.var]]), digits=round.digit),
            N = n()) |> 
  mutate(Range = paste(min, max, sep = "-")) |> 
  dplyr::select(-min, -max) |> 
  relocate(N, .after = last_col())

#create the formatted table
ft <- flextable(df.sum,
                cwidth = 0.75) |>  #can vary cell width as needed
  
  #bold the headings
  bold(part = "header") |> 
  
  #center columns & autofit
  align(align = "center", part = "all" ) |> 
  set_table_properties(layout = "autofit")

#print the table
#right click on the table, choose select all, 
#choose copy, then paste in your document
#finish formatting as needed in your document
ft