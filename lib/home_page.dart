import 'package:flutter/material.dart';
import 'package:latihan_kuis/vehicle-data.dart';

class HomePage extends StatelessWidget {
  final String username; 
  
  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Kendaraan"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), 
          itemCount: vehicleList.length,
          itemBuilder: (context,index){
            final Vehicle vehicle = vehicleList[index];
            return Card(
              child: Column(
                children: [
                  Image.network(vehicle.imageUrls[0]),
                  Text(vehicle.name),
                  Text(vehicle.type)
                ],
              ),
            );
          }
          ),
          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.logout),
    )
    );
}
}