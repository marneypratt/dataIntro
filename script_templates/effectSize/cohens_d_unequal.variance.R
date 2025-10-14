#to run this code, make sure the rstatix package is loaded
#make sure you have also already defined your variables (cont.var & factor.var)


#set the formula to use the defined variables 
#this makes it easier to change the variables at the top and rerun everything 
#without having to retype the variables in every code chunk
response <- cont.var
predictor <- factor.var
formula_string <- paste0(response, " ~ ", predictor)
formula_object <- as.formula(formula_string)


#standardized effect size for paired data with unequal variance
#Cohen's d for Welch test
effectSize.results  <- 
  rstatix::cohens_d(
    data = df,           #put the dataframe name here
    formula_object,      #continuous variable ~ factor (see above)
    paired = TRUE,       #TRUE for within-subjects, FALSE for between-subjects
    var.equal = FALSE,   #TRUE for equal variance, FALSE for unequal variance
    hedges.correction = TRUE,
    ci = TRUE,
    conf.level = 0.95,
    ci.type = "bca",
    nboot = 1000)

effectSize.results <- effectSize.results |> 
  mutate(comparison = paste(group1, group2, sep = "-")) 

effectSize.results