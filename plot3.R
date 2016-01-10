#reading the data set
varEnergy <- read.csv("household_power_consumption.txt", h=T, sep=";", na.strings="?");

#first column in a Date format
varEnergy$Date <- as.Date(varEnergy$Date, "%d/%m/%Y");

#getting the subset considering the date interval
subSetVarEnergy <- subset(varEnergy,Date >= "2007-02-01" & Date <= "2007-02-02");

#setting the path of the PNG file
png(filename="./plot3.png", width = 480, height = 480);

#making the plot
plot(subSetVarEnergy$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering", xlab = "", labels = F, axes=FALSE);
lines(subSetVarEnergy$Sub_metering_2, type="l", col="red");
lines(subSetVarEnergy$Sub_metering_3, type="l", col="blue");
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1));
box();

#finishing the session
dev.off()
