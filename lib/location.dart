
import 'package:geolocator/geolocator.dart';


class GetLocationData{
  double lat, lon;

  Future<void> getLocation() async{
    try{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   
   lat = position.latitude;
  lon = position.longitude;
 print(lat);
    }
    catch(e){
      print(e);
    }
} 
}


