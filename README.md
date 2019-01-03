# Cluster-Plots

Clster-Plots is a simple and straightforward program for generating cluster specific profile plots. 

## Installation

One should have R (R Core Team, 2018) or later installed along with the most recent version of ggplot2 (Wickham, 2016). Group means are computed with dplyr (Wickham, François, Henry and Müller, 2018).

## Usage
 
 First, make sure to upload the necessary data to run the analysis.
 
 Second, run the function command to get the vis_results() function loaded into the working space. 
 
 Then, simply run like any other R function, ex.

```r
vis_results(
  var.names = c('V1', 'V2', 'V3'),
  class.id = 'K2' ,
  n.class = 2
) ## End Function
```

The function takes in the following arguments:

- data = DATA FRAME CONTAINING RAW DATA (default is 'mydata')
- var.names = NAMES OF VARIABLES TO PLOT BY CLUSTER
- class.id = CLUSTER ID MARKER VARIABLES
- n.class = NUMBER OF CLUSTERS
- output.bounds = Y-AXIS BOUNDS FOR PLOTTING, HELPS FORCE SIMILAR BOUNDS ACROSS CLUSTER SOLUTIONS
- var.ordered = T - AN INDICATOR SPECIFYING IF THE ORDER OR VARIABLES SUPPLIED IN var.names  SHOULD BE THE ORDER THAT VARIABLES ARE PLOTTED

## Sources

1. H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

2. Hadley Wickham, Romain François, Lionel Henry and Kirill Müller (2018). dplyr: A Grammar of Data Manipulation. R package version 0.7.8. https://CRAN.R-project.org/package=dplyr

3. R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
