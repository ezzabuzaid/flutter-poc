
class CoincapModel {
  double price;
  double volume;
  double timestamp;
  double priceUsd;

  CoincapModel({
    this.price,
    this.volume,
    this.timestamp,
    this.priceUsd,
  });

  CoincapModel.fromJson(Map<String, dynamic> json) {
    price = (json['price'] ?? 1) + .0;
    volume = (json['volume'] ?? 1) + .0;
    timestamp = (json['timestamp'] ?? 1) + .0;
    priceUsd = (json['priceUsd'] ?? 1) + .0;
  }

  Map<String, double> toJson() {
    final data = new Map<String, double>();
    data['price'] = this.price;
    data['volume'] = this.volume;
    data['priceUsd'] = this.priceUsd;
    return data;
  }
}
