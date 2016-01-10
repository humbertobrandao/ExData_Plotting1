#reading the data set
varEnergy <- read.csv("household_power_consumption.txt", h=T, sep=";", na.strings="?");

#first column in a Date format
varEnergy$Date <- as.Date(varEnergy$Date, "%d/%m/%Y");

#getting the subset considering the date interval
subSetVarEnergy <- subset(varEnergy,Date >= "2007-02-01" & Date <= "2007-02-02");

#setting the path of the PNG file
png(filename="./plot1.png", width = 480, height = 480);

#making the histogram
hist(as.numeric(subSetVarEnergy$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

#finishing the session
dev.off()
