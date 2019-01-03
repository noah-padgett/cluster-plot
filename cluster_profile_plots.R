## Creating Cluster Specific Profiles
## Created: 2018-12-20
## By: R. Noah Padgett
## 
## This file may contain errors
## ...
## you were warned...

## Set working directory
## setwd("C:/Users/USERNAME/desktop")

## Packages
library(readstata13)
library(ggplot2)
library(dplyr)
## Read in Data
mydata <- read.dta13("AATI Pilot1_us_11-28wkgB.dta")

vis_results <- function(
  data=mydata, var.names, class.id, n.class, 
  output.bounds = c(0,100),
  var.ordered = T
  )
{
  # data=mydata
  # var.names = c('Tpsp', 'Tpsn', 'Tprp')
  # class.id = 'K2'
  # n.class = 2
  # output.bounds = c(35,65)
  # var.ordered = T
  # # Set classid as a factor wtih new labels
  data[,class.id] <- factor(
    data[,class.id], 
    levels=1:n.class,
    labels=paste0('Class ',1:n.class)
  )
  data$id.temp <- 1:nrow(data)
  dat <- reshape(
    data, varying = list(var.names), 
    idvar = 'id.temp',
    #ids = 1:(nrow(data)*n.class),
    timevar = 'Variable',
    times = var.names,
    direction = 'long'
  )
  ## Do some relabeling/coding for figures
  dat$Value <- dat[,var.names[1]]
  dat$Class <- dat[,class.id]
  
  ## Force Var. Names to display in order given
  if(var.ordered == T){
    dat$Variable <- factor(
      dat$Variable, 
      levels = var.names,
      labels = var.names,
      ordered = T
    )
  } ## End forcing ordered

  ## Compute Class Means
  class.profiles <- dat %>%
    group_by(Class, Variable) %>%
    summarise( grp.means = mean(Value))
  class.profiles$Center = rep(50, nrow(class.profiles))
    ## Class specific Bar of distribution of scores
    print(
      ggplot(class.profiles, 
        aes(x=Variable, y=grp.means)) + 
        #geom_point() + 
        geom_segment(aes(yend=Center, 
                         xend=Variable, 
                         size=2)) +
        geom_hline(yintercept = 50, linetype='dashed')+
        theme_bw() +
        labs(y='', x='') +
        facet_wrap(~Class) +
        theme(legend.position="none") +
        lims(y=output.bounds)
    ) # end print
} ## End plotting function


vis_results(
  var.names = c('Tpsp', 'Tpsn', 'Tprp', 
                'Tprn', 'Tftp','Tftn'),
  class.id = 'K2' ,
  n.class = 2)

vis_results(var.names = c('Tpsp', 'Tpsn', 'Tprp', 
                          'Tprn', 'Tftp','Tftn'),
            class.id = 'K3' ,
            n.class = 3)


vis_results(var.names = c('Tpsp', 'Tpsn', 'Tprp', 
                          'Tprn', 'Tftp','Tftn'),
            class.id = 'K4' ,
            n.class = 4)



vis_results(var.names = c('Tpsp', 'Tpsn', 'Tprp', 
                          'Tprn', 'Tftp','Tftn'),
            class.id = 'K10' ,
            n.class = 10)



