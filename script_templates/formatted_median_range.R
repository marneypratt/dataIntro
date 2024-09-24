# to use this code, the following poackages must be loaded
# tidyverse
# flextable
#see https://davidgohel.github.io/flextable/ for more info & formatting options

# replace the blank below with a continuous variable you want to summarize
x.var <- "___" 

#calculate descriptive stats
#replace the blank below with the name of the dataframe
df.sum <- ___ |> 
  
  # replace the blank with the categorical variable(s)
  group_by(___) |> 
  
  # remove missing values 
  filter(!is.na(.data[[x.var]])) |> 
  
  #calculate the rounded values
  summarise(Median = round(median(.data[[x.var]]), digits=2),
            min = round(min(.data[[x.var]]), digits=2),
            max = round(max(.data[[x.var]]), digits=2),
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