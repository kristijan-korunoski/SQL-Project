CREATE VIEW CustomerSummary AS
    SELECT rental.customerID,
           rental.date_out,
           rental.date_back,
           ( (Car.kmCost * (rental.odo_back - rental.odo_out) ) + (Car.dailyCost * (julianday(rental.date_back) - julianday(rental.date_out) ) ) ) AS rental_cost
      FROM rental,
           Car,
           Vehicle
     WHERE rental.VIN = Vehicle.VIN AND 
           Vehicle.carMake = Car.carMake AND 
           Vehicle.carModel = Car.carModel AND 
           Vehicle.carYear = Car.carYear AND 
           rental.date_back IS NOT NULL;
