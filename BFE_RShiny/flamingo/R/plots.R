

#' AEP Curve
#' @description plot EP Curve
#' @param AEPData AEP data
#' @param years years
#' @export
plotAEPCurve <- function(AEPData, years = 1000) {

  idx <- AEPData[, 3]
  Value <- AEPData[, 4]
  Rank <- AEPData[, 5]
  RT <- years/Rank
  
  AEPData <- data.frame(IDX = idx, ReturnPeriod = RT, Loss = Value)
  AEPData <- melt(AEPData, id.vars=c("IDX", "ReturnPeriod", "Loss"))
  
  res <- ggplot(AEPData, aes(x = ReturnPeriod, y = Loss, color = IDX, group = IDX)) +
      geom_line() +
      scale_colour_gradient(low = "red")
  
  return(res)
  
}

#' IL plot
#' @param outputPlotData data for plot
#' @description plot IL using the current device
#' @param ... extra arguments to \link{plot}
#' @param interactive create interactive plot using \link{plotly::plot_ly}
#' @return nothing; the interactive plot object if \code{interactive = TRUE}
#' @importFrom plotly plot_ly add_trace layout
#' @export
plotIL <- function(outputPlotData, interactive = FALSE, ...) {
  
  if (!interactive) {
    
    returnPeriod <- outputPlotData$ReturnPeriod
    IL_AEP <- outputPlotData$IL_AEP
    IL_OEP <- outputPlotData$IL_OEP
    
    options("scipen" = 100, "digits" = 4)
    plot(x=returnPeriod, y=IL_AEP, ylab = "Loss", type = "o", col = "red", ...)+
        lines(x=returnPeriod, y=IL_OEP, type = "o", col = "blue")
    
    invisible()
    
  } else {
    
    plot_ly(outputPlotData, x = ~ReturnPeriod) %>%
        add_trace(y = ~IL_AEP, name = "AEP", mode = "lines+markers",
            type = "scatter") %>%
        add_trace(y = ~IL_OEP, name = "OEP", mode = "lines+markers",
            type = "scatter") %>%
        layout(title = "IL",
            xaxis = list(title = "Return Period"),
            yaxis = list(title = "Loss"))
    
  }
  
}

#' GUL plot
#' @description plot GUL using the current device
#' @param outputPlotData data for plot
#' @param ... extra arguments to \link{plot}
#' @param interactive create interactive plot using \link{plotly::plot_ly}
#' @return nothing; the interactive plot object if \code{interactive = TRUE}
#' @importFrom plotly plot_ly add_trace layout
#' @export
plotGUL <- function(outputPlotData, interactive = FALSE, ...) {
  
  if (!interactive) {
    
    returnPeriod <- outputPlotData$ReturnPeriod
    GUL_AEP <- outputPlotData$GUL_AEP
    GUL_OEP <- outputPlotData$GUL_OEP
    
    options("scipen" = 100, "digits" = 4)
    plot(x=returnPeriod, y=GUL_AEP, ylab = "Loss", type = "o", col = "red", ...)+
        lines(x=returnPeriod, y=GUL_OEP, type = "o", col = "blue")
    
    invisible()
    
  } else {
    
    plot_ly(outputPlotData, x = ~ReturnPeriod) %>%
        add_trace(y = ~GUL_AEP, name = "AEP", mode = "lines+markers",
            type = "scatter") %>%
        add_trace(y = ~GUL_OEP, name = "OEP", mode = "lines+markers",
            type = "scatter") %>%
        layout(title = "GUL",
            xaxis = list(title = "Return Period"),
            yaxis = list(title = "Loss"))
    
  }

}


#' funPlotOutput
#' @export
funPlotOutput <- function(outputPlotData) {
  # years <- 1000
  # idx <- AEPData[, 1]
  # Value <- AEPData[, 2]
  # Rank <- AEPData[, 5]
  # RT <- years/Rank
  outputData <- data.frame(ReturnPeriod = outputPlotData[,1], Loss = outputPlotData[,2])
  outputData <- melt(outputData, id.vars=c("ReturnPeriod", "Loss"))
  
  res <- ggplot(outputData, aes(x = ReturnPeriod, y = Loss)) +
      geom_line() +
      scale_colour_gradient(low = "red")
  return(res)
}

#' funPlotOutput2
#' @export
funPlotOutput2 <- function(outputPlotData) {
  AEPData <- NULL
  #  AEPData <- executeDbQuery(dbSettings, paste("exec dbo.getFileDataForFile 109"))
  #   years <- 1000
  #   years <- 1000
  #   idx <- AEPData[, 3]
  #   Value <- AEPData[, 4]
  #   Rank <- AEPData[, 5]
  #   RT <- years/Rank
  outputData <- data.frame(ReturnPeriod = outputPlotData[,1], Loss = outputPlotData[,2])
  outputData <- melt(outputData, id.vars=c("ReturnPeriod", "Loss"))
  
  res <- ggplot(aes(x='ReturnPeriod'),data=outputData) + 
      stat_function(outputPlotData[,2],color="blue") + 
      stat_function(outputPlotData[,3],color="red") 
  return(res)
}