import 'package:geolocator/geolocator.dart';
import 'package:learning_flutter/app/locator.dart';
Future<Placemark> getCurrentLocation(Placemark defaultPlacemark) async {
  final geolocator = locator<Geolocator>();
  if (await geolocator.isLocationServiceEnabled()) {
    final position = await geolocator.getCurrentPosition();
    return (await geolocator.placemarkFromPosition(position))[0];
  }
  return defaultPlacemark;
}
