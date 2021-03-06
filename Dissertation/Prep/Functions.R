##### Printer function to save pictures as png #################################
# This file contains useful functions which help to write the dissertation
printer <- function(fig, folder, subfolder, name){
  # name is the filename
  # plot is the plot which will be saved
  # path is the path under which the figure will be saved
  path = paste0('Dissertation/Figures/',folder,'/', subfolder,'/',name,'.png')
  png(filename=path, height = 960, width = 1440, res = 300)
    plot(fig)
  dev.off()
}

##### Sinker function to save output to txt ####################################
sinker <- function(output, folder, subfolder, name){
  # name is the name of the file
  # output is the stuff which should be saved
  # path is the path to which the file will be saved
  path = paste0('Dissertation/Text/',folder,'/', subfolder, '/',name,'.txt')
  sink(path)
  print(output)
  sink()
}

##### Calculate MAD function ###################################################
# error_MAD <- function(series1, series2){
#   res <- series1 - series2
#   cumres <- sum(abs(coredata(res)))
#   return(cumres/length(series1))
# }

##### Other error measures #####################################################
MSE<-function(sigmafc,RV){
  MSE=1/length(sigmafc)*sum((sigmafc^2-RV)^2)
  return(MSE)
}

#QLIKE
QLIKE<-function(sigmafc,RV){
  p1 <- log(sigmafc)
  p2 <- log(RV/sigmafc)
  p3 <- p1-p2
  p3[is.infinite(p3)] <- NA
  p3 <- na.omit(p3)
  return(mean(p3))
}

