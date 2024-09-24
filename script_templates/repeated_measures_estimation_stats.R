# the code below will calculate estimation statistics 
# this is for HRV data with 3 measurement blocks and repeated measures design
# the Exercise and Recovery treatments are each compared to Baseline
# to use this code, the following packages must be loaded
# tidyverse
# dabestr


#replace the first blank with the dataframe name
#replace the x blank with the continuous variable
#replace the y blank with the categorical variable
#replace the id_col blank with the subject label variable
est.stat.mod <- load(___,
                     x = ___, 
                     y = ___,
                     idx = c("Baseline", "Exercise", "Recovery"),
                     paired = "baseline", 
                     id_col = ___)  |> 
  mean_diff()

print(est.stat.mod)

#replace the blank with the continuous variable label
#this will label the graph, it can have spaces
dabest_plot(
  est.stat.mod,
  swarm_label = "___",
  raw_marker_size = 0.5, 
  raw_marker_alpha = 0.3)