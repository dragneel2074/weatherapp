import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var city = "Kathmandu";
  var api = '8dc72e210cbc35c4a6c468c60e0acc95#';

Future getWeather()async{
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&units=imperial&appid=$api');
      http.Response response = await http.get(url);
    var results = jsonDecode(response.body);

    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed =  results['wind']['speed'];
    });
}
void getLocation() async{
Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
print(position);
}

@override
void initState(){
  super.initState();
 this.getWeather();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Currently in $city',
              style: TextStyle(color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600),
            )
            ),
             Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              temp !=null ? temp.toString() + "\u00B0" : "Loading",
              style: TextStyle(color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800),
            )
            ),
             Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              currently != null ? currently : 'Loading',
              style: TextStyle(color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600),
            )
            )
          ],)
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text("Temperature"),
                  trailing: Text( temp != null ? temp.toString() +'\u00B0' : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text("Weather"),
                  trailing: Text(description != null ? description.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text("Humidity"),
                  trailing: Text(humidity != null ? humidity.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text("Wind Speed"),
                  trailing: Text(windSpeed != null ? windSpeed.toString() : 'Loading'),
                ),
              ],            
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: TextButton(
                                      child: Text('Set Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                    onPressed: (){},
                  ),
                ),
                Container(
                  height: 50,
                  child: TextButton(
                                      child: Text('Get My Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  onPressed: (){},
                  ),
                ),
              ],
              
            ),
          ),
        )
        
      ],)
    );
  }
}