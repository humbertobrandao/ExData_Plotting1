#reading the data set
varEnergy <- read.csv("household_power_consumption.txt", h=T, sep=";", na.strings="?");

#first column in a Date format
varEnergy$Date <- as.Date(varEnergy$Date, "%d/%m/%Y");

#getting the subset considering the date interval
subSetVarEnergy <- subset(varEnergy,Date >= "2007-02-01" & Date <= "2007-02-02");

#setting the path of the PNG file
png(filename="./plot4.png", width = 480, height = 480);

#combing plots (2 lines and 2 columns)
par(mfrow=c(2,2));

#making the 1st plot
plot(subSetVarEnergy$Global_active_power,type="l", ylab = "Global Active Power", xlab = "", labels = F, axes=FALSE);
axis(side=2, at=c(0,2,4,6), labels=c(0,2,4,6));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
box();

#making the 2nd plot
plot(subSetVarEnergy$Voltage,type="l", ylab = "Voltage", xlab = "datetime", labels = F, axes=FALSE);
axis(side=2, at=c(234,236,238,240,242,244,246), labels=c("234","","238","","242","","246"));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
box();

#making the 3rd plot
plot(subSetVarEnergy$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering", xlab = "", labels = F, axes=FALSE);
lines(subSetVarEnergy$Sub_metering_2, type="l", col="red");
lines(subSetVarEnergy$Sub_metering_3, type="l", col="blue");
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), , bty = "n");
box();

#making the 4th plot
plot(subSetVarEnergy$Global_reactive_power,type="l", ylab = "Global_reative_power", xlab = "datetime", labels = F, axes=FALSE);
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5));
axis(side=1, at=c(0, length(subSetVarEnergy$Date)/2, length(subSetVarEnergy$Date)), labels=c("Thu", "Fri", "Sat"));
box();

#finishing the session
dev.off()
