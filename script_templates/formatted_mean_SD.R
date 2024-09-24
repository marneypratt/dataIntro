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
  summarise(Mean = round(mean(.data[[x.var]]), digits=2), 
            SD = signif(sd(.data[[x.var]]), digits=2),
            N = n())

#create the formatted table
ft <- flextable(df.sum,
                cwidth = 0.75) |>  #can vary cell width as needed
  
  #bold the headings
  bold(part = "header") |> 
  
  #center columns
  align(align = "center", part = "all" )

#print the table
#right click on the table, choose select all, 
#choose copy, then paste in your document
#finish formatting as needed in your document
ft