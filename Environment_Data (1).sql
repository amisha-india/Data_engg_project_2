Create Database EnvironmentalData
Use EnvironmentalData

CREATE TABLE Sensors (
    SensorID INT PRIMARY KEY,
    SensorType VARCHAR(50),
    Location VARCHAR(100),
    InstallationDate DATE
);

CREATE TABLE AirQuality (
    ReadingID INT PRIMARY KEY,
    SensorID INT FOREIGN KEY REFERENCES Sensors(SensorID),
    PM25 DECIMAL(5, 2),
    PM10 DECIMAL(5, 2),
    ReadingDateTime DATETIME
);

CREATE TABLE WeatherConditions (
    WeatherID INT PRIMARY KEY,
    SensorID INT FOREIGN KEY REFERENCES Sensors(SensorID),
    Temperature DECIMAL(5, 2),
    Humidity DECIMAL(5, 2),
    WindSpeed DECIMAL(5, 2),
    WeatherDateTime DATETIME
);


CREATE VIEW PollutionLevels AS
SELECT 
    aq.ReadingID,
    aq.SensorID,
    aq.PM25,
    aq.PM10,
    wc.Temperature,
    wc.Humidity,
    wc.WindSpeed,
    aq.ReadingDateTime
FROM 
    AirQuality aq
JOIN 
    WeatherConditions wc 
ON 
    aq.SensorID = wc.SensorID 
AND 
    aq.ReadingDateTime = wc.WeatherDateTime;

-- Monitoring Air Quality
SELECT 
    SensorID,
    AVG(PM25) AS AvgPM25,
    AVG(PM10) AS AvgPM10,
    COUNT(*) AS TotalReadings
FROM 
    AirQuality
WHERE 
    ReadingDateTime BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY 
    SensorID;

-- 2. Track Pollution levels overtime
SELECT 
    ReadingDateTime,
    AVG(PM25) AS AvgPM25,
    AVG(PM10) AS AvgPM10
FROM 
    AirQuality
GROUP BY 
    ReadingDateTime
ORDER BY 
    ReadingDateTime ASC;

-- Calculate Average Temperature and Humidity
SELECT 
    AVG(Temperature) AS AvgTemperature,
    AVG(Humidity) AS AvgHumidity
FROM 
    WeatherConditions
WHERE 
    WeatherDateTime BETWEEN '2024-08-01' AND '2024-08-31';


