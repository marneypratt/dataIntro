#the code below will calculate the Cohen's d effect size 
#you need the following packages loaded for this code to work
# rstatix
# tidyverse
# glue


#Define your variables and redefine your dataframe name here to avoid having to type them a lot
#replace the blank with the continuous variable of choice 
#(for example, replace the blank with "ln.RMSSD")
cont.var <- "___" 

#replace the blank with the categorical variable that is your factor (this is the grouping variable)
predictor <- "___"

#replace the blank with the name of the column that contains your subject identifers
subject.ID <- "___"

#replace the blank with the name of your dataframe here 
df <- ___

#define the formula using variable names above
response <- cont.var
formula_string <- paste0(response, " ~ ", predictor)
formula_object <- as.formula(formula_string)



#the code below will calculate the Cohen's d effect size when variances are unequal
#standardized effect size for normal data with equal variance
#Cohen's d
cohensD.results  <- 
  rstatix::cohens_d(
    data = df,         #put the dataframe name here
    formula_object,            #dependent variable ~ factor
    paired = TRUE,       #TRUE for within-subjects, FALSE for between-subjects
    var.equal = TRUE,    #TRUE for equal variance, FALSE for unequal variance
    hedges.correction = TRUE,
    ci = TRUE,
    conf.level = 0.95,
    ci.type = "bca",
    nboot = 1000)



#the code below creates a plot that connects the dots within subjects
#and also adds the Cohen's d results from the analysis above to the graph
line.plot <- df  |>    
  ggplot(aes(
    x=.data[[predictor]], 
    y=.data[[cont.var]], 
    group = .data[[subject.ID]])) +
  geom_point(size = 3,  
             color = "orange", 
             alpha = 0.5) +
  geom_line(linewidth = 0.2, 
            alpha = 0.5) + 
  stat_summary(fun = mean, 
               fun.min = mean, 
               fun.max = mean, 
               geom = "crossbar", 
               color = "black",
               width = 0.2, 
               size = 0.5,
               aes(group = .data[[predictor]] )) +
  xlab("Time of Measurement") +
  ylab("___") +   #use the metadata file or axis.lables.R script to add the units
  
  
#look at the cohensD.results and note which comparison is in the first row
#put the label from group1 in the first blank below, and put the label from group2 in the second blank
  labs(title = 
         glue_data(cohensD.results[1, ], 
                   "___ - ___: Cohen's d = {signif(unname(effsize), digits=2)} (95% CI: {signif(conf.low, digits=2)} to {signif(conf.high, digits=2)})")
  ) +
  
  
  #look at the cohensD.results and note which comparison is in the second row
  #put the label from group1 in the first blank below, and put the label from group2 in the second blank
  labs(subtitle = 
         glue_data(cohensD.results[2, ], 
                   "___ - ___: Cohen's d = {signif(unname(effsize), digits=2)} (95% CI: {signif(conf.low, digits=2)} to {signif(conf.high, digits=2)})")
  ) +
  
  
  #additional formatting
  theme_classic(base_size = 14)  +  #sets the font size
  theme(
    plot.title = element_text(size = 12),  # Set title size
    plot.subtitle = element_text(size = 12) # Set subtitle size to the same value
  ) +
  theme(legend.position = "none")   #controls legend/key

line.plot
