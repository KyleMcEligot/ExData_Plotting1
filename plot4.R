##
##  This file contains the code for"Exploratory Data Analysis"'s
##  course project 1.
##  
##  The course project has four plots. This file handles "Plot 4"
##  with the function plot4(). 
##
##  Prior to runing the function, the zipped data file containing the 
##  dataset should be downloaded and unzipped into a folder called data.  
##  Dataset: 
##     Electric power consumption
##     https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


plot4 <- function()
{
    ## verify existance of data folder
    file_path <- "data/household_power_consumption.txt"
    if (!file.exists(file_path))
    {
        stop("data/household_power_consumption does not exist")
    }
    
    ## read in data
    input_data <-
        subset(read.table(file_path, header = TRUE, sep = ";", 
                          stringsAsFactors = FALSE, na.strings = c("?")),
               Date == "1/2/2007" |
                   Date == "2/2/2007")
    
    ## generate a date time column
    input_data$date_time <- 
        strptime(paste(input_data$Date, input_data$Time), "%d/%m/%Y %H:%M:%S")
    
    ## plot the data 
    png("plot4.png",width=480,height=480,units="px")
    
    par(mfrow = c(2,2))
    
    plot(input_data$date_time,input_data$Global_active_power, type = "l",
         xlab = "",
         ylab = "Global Active Power")
    
    plot(input_data$date_time,input_data$Voltage, type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    
    with(input_data, 
         plot(date_time, Sub_metering_1,type = "l", col = "black",
              xlab = "",
              ylab = "Energy sub metering"))
    with(input_data, 
         points(date_time, Sub_metering_2, type = "l", col = "red"))
    with(input_data, 
         points(date_time, Sub_metering_3, type = "l", col = "blue"))
    legend("topright",
           lwd = 2, bty = "n",
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(input_data$date_time,input_data$Global_reactive_power, type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    
    dev.off()
    
}