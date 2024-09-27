INSERT INTO Sensors (SensorID, SensorType, Location, InstallationDate)
VALUES 
(1, 'Air Quality Sensor', 'Central Park', '2024-01-15'),
(2, 'Weather Sensor', 'Times Square', '2024-01-20'),
(3, 'Air Quality Sensor', 'Brooklyn', '2024-02-05');

INSERT INTO AirQuality (ReadingID, SensorID, PM25, PM10, ReadingDateTime)
VALUES 
(1, 1, 35.5, 45.2, '2024-08-01 09:00:00'),
(2, 1, 42.1, 50.4, '2024-08-01 12:00:00'),
(3, 3, 30.8, 40.3, '2024-08-01 09:00:00');

INSERT INTO WeatherConditions (WeatherID, SensorID, Temperature, Humidity, WindSpeed, WeatherDateTime)
VALUES 
(1, 2, 22.5, 65.2, 15.3, '2024-08-01 09:00:00'),
(2, 2, 24.1, 60.4, 12.5, '2024-08-01 12:00:00'),
(3, 3, 25.0, 58.3, 10.1, '2024-08-01 09:00:00');
