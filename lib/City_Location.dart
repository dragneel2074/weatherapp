
import 'package:flutter/material.dart';
import 'MyHomePage.dart';



class GetCityLocationData{

String cityName;
Home ho = Home();

getCityData(context){
showModalBottomSheet(context: context, builder: (BuildContext bc){
return Container(
  
  height: MediaQuery.of(context).size.height * 0.68,
  child: Padding(
  
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(      
          child: Column(
        children: [
          Row(children: [
            Text('Edit City Location', 
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.cancel, color: Colors.deepOrange,),
              onPressed: (){
                  Navigator.of(context).pop();
              })
          ],),
          Center(
            child: Column(children: [
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,    
                ),
              onChanged: (value) {
                cityName = value;
              },
              autocorrect: true,        
	textAlign: TextAlign.center,
	decoration: InputDecoration(
          hintText: 'Enter City Name',
          icon: Icon(Icons.location_city, color: Colors.lightBlueAccent,),
	)
              ),
              SizedBox(
                height: 10, 
              ),
              TextButton(
                child: Text('Get City Weather',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 15 ,
              fontWeight: FontWeight.bold, backgroundColor: Colors.blueGrey),),
              onPressed: () {
                Navigator.pop(context, cityName);
                if(cityName != null){
                  ;
                                   }
                                 },
                                 ),
                               ],),
                             )],
                         ),
                       ),
                     ),);
                   });
                   }
                    }
                   