#reading the data set
varEnergy <- read.csv("household_power_consumption.txt", h=T, sep=";", na.strings="?");

#first column in a Date format
varEnergy$Date <- as.Date(varEnergy$Date, "%d/%m/%Y");

#getting the subset considering the date interval
subSetVarEnergy <- subset(varEnergy,Date >= "2007-02-01" & Date <= "2007-02-02");

#setting the path of the PNG file
png(filename="./plot2.png", width = 480, height = 480);

#making the plot
plot(subSetVarEnergy$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab = "", labels = F, axes=FALSE);
axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
box();

#finishing the session
dev.off()
