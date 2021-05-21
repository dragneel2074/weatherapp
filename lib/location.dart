
import 'package:geolocator/geolocator.dart';


class GetLocationData{
  var lat, lon;

  getLocation() async{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   
   lat = position.latitude;
  lon = position.longitude;
  print(lat);
} 
}


