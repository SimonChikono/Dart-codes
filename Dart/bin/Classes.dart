abstract class Vehicle {
  String make;
  String model;
  int year;
  double price;

  Vehicle(this.make, this.model, this.year, this.price);

  @override
  String toString() {
    return '$year $make $model (\$$price)';
  }

  double totalCostOfOwnership();
}

class Car extends Vehicle {
  int mileage;

  Car(String make, String model, int year, double price, this.mileage)
      : super(make, model, year, price);

  @override
  String toString() {
    return '$year $make $model - $mileage miles (\$$price)';
  }

  @override
  double totalCostOfOwnership() {
    return price + (mileage * 0.10);
  }
}

class Motorcycle extends Vehicle {
  bool hasSidecar;

  Motorcycle(String make, String model, int year, double price, this.hasSidecar)
      : super(make, model, year, price);

  @override
  String toString() {
    String sidecarString = hasSidecar ? 'with sidecar' : 'without sidecar';
    return '$year $make $model - $sidecarString (\$$price)';
  }

  @override
  double totalCostOfOwnership() {
    return price;
  }
}

void main() {
  Vehicle vehicle1 = Car('Toyota', 'Corolla', 2018, 12000.0, 50000);
  Vehicle vehicle2 = Motorcycle('Harley-Davidson', 'Sportster', 2020, 15000.0, true);

  print(vehicle1.toString());
  print('Total cost of ownership: \$${vehicle1.totalCostOfOwnership()}');
  print(vehicle2.toString());
  print('Total cost of ownership: \$${vehicle2.totalCostOfOwnership()}');
}
