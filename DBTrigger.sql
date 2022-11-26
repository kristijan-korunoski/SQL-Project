CREATE TRIGGER newRental
         AFTER INSERT
            ON rental
BEGIN
    UPDATE rental
       SET odo_out = (	SELECT odometer
                 	FROM Vehicle
                	WHERE new.VIN = Vehicle.VIN)
     WHERE odo_out IS NULL AND 
           odo_back IS NULL AND 
           date_back IS NULL;
END;




CREATE TRIGGER updateRental
         AFTER UPDATE
            ON rental
BEGIN
    UPDATE Vehicle
       SET odometer = (	SELECT odo_back
                 	FROM rental
                	WHERE new.VIN = rental.VIN)
     WHERE (	SELECT odo_back
		FROM rental)
           	IS NOT NULL AND 
           (	SELECT date_back
		FROM rental)
           	IS NOT NULL;
END;
