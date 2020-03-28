# TIME SERIES - SEQUENCE OF DATA IN CHRONOLOGICAL ORDER
# IT IS AN OBJECT WHICH HAS TIME AS INDEX AND REPRESENTED IN X AXIS

"""
Basic Models
  White noise 

  Random walk 

  Auto Regression 

  Simple Moving Average 
"""

#EXPLORING RAW TIME SERIES

# Print the Nile dataset
print(Nile)

# List the number of observations in the Nile dataset
length(Nile)

# Display the first 10 elements of the Nile dataset
head(Nile,n=10)

# Display the last 12 elements of the Nile dataset
tail(Nile,n=12)

# Plot the Nile data
plot(Nile)

frequency(Nile)

# Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})")

# Plot the Nile data with xlab, ylab, main, and type arguments
#Type ="b" means it includes both lines and points represented in graph
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^{3})",main="Annual River Nile Volume at Aswan, 1871-1970",type="b")


#par can be used to set or query graphical parameters. Parameters can be set by specifying them as arguments to par in tag = value form, or by passing them as a list of tagged values.
par(mfrow=c(2,1))
plot(continuous_time_index,continuous_series, type = "b")

"""
Varieties of Time series data
  Equally spaced
  Approximately spaced
  Missed values

Basic Assumptions

  Consecutive observations are equally spaced
  Apply a discrete time observation index
  This may hold approximately

Sampling frequency - R functions

  The start() and end() functions return the time index of the first and last observations, respectively.
  The time() function calculates a vector of time indices, with one element for each time index on which the series was observed.
  The deltat() function returns the fixed time interval between observations and 
  the frequency() function returns the number of observations per unit time. Finally, the cycle() function returns the position in the cycle of each observation.

"""

#In this exercise, you'll practice applying these functions to the AirPassengers dataset, which reports the monthly total international airline passengers (in thousands) from 1949 to 1960.

# Plot AirPassengers
plot(AirPassengers)

# View the start and end dates of AirPassengers
start(AirPassengers)
end(AirPassengers)

# Use time(), deltat(), frequency(), and cycle() with AirPassengers 

time(AirPassengers)
deltat(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)

str(AirPassengers)

#Missing Values
# Impute mean values to NA in AirPassengers
AirPassengers[85:96] <- mean(AirPassengers, na.rm = TRUE)

# Add the complete AirPassengers data to your plot
rm(AirPassengers)
points(AirPassengers, type = "l", col = 2, lty = 3)


"""
Time series object
  Starts with vector of data
  Apply ts function

Why ts ()
  Improved Plotting
  Access to time index information

is.ts()
 to check whether object is timeseries
"""

data_vector <- runif(100,1,100)
plot(data_vector)

time_series <- ts(data_vector,start=2004,frequency = 4)
plot(time_series)
print(time_series)

is.ts(data_vector)
is.ts(AirPassengers)

is.ts(EuStockMarkets)

# View the start, end, and frequency of eu_stocks
start(EuStockMarkets)
end(EuStockMarkets)
frequency(EuStockMarkets)

plot(EuStockMarkets)

str(EuStockMarkets)

ts.plot(EuStockMarkets,col=1:4,xlab="Year",ylab="Index value",main="Major European Stock Indices,1991-1998") + legend("topleft",colnames(EuStockMarkets),lty=1,col=1:4,bty="n")



#Spotting Trends

"""
Trends - Periodic, Linear, Variance, Rapid Growth
"""

"""
Sample Transformations

  log() --> linearize rapid growth trend
            Stabilizes series with increasing variance

  diff() --> removes linear trend

  diff(,s)  --> seasonal difference transformation, remove periodic trends
          diff(x,s=4)

"""

"""
Removing trends in variability via the logarithmic transformation
The logarithmic function log() is a data transformation that can be applied to positively valued time series data. It slightly shrinks observations that are greater than one towards zero, while greatly shrinking very large observations. 
This property can stabilize variability when a series exhibits increasing variability over time. It may also be used to linearize a rapid growth pattern over time.

The time series rapid_growth has already been loaded, and is shown in the figure on the right. Note the vertical range of the data.
"""

# Generate the first difference of z
dz = diff(z)
# Plot dz
ts.plot(dz)
# View the length of z and dz, respectively
length(z)
length(dz)


  
