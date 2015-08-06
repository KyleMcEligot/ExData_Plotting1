##
##  This file contains the code for"Exploratory Data Analysis"'s
##  course project 1.
##  
##  The course project has four plots. This file handles "Plot 1"
##  with the function plot1(). It generates a .png file with 
##  a histogram showing the frequency of "Global Active Power".
##
##  Prior to runing the function, the zipped data file containing the 
##  dataset should be downloaded and unzipped into a folder called data.  
##  Dataset: 
##     Electric power consumption
##     https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


plot1 <- function()
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
    
    ## plot the data - histogram of "Global Active Power" frequency
    png("plot1.png",width=480,height=480,units="px")
    hist(input_data$Global_active_power, col = "red",
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    dev.off()

}