import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrackingScreen(),
    );
  }
}

class TrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // This is a placeholder for the map
                // Replace this with your map widget, for example, GoogleMap
                Container(
                  color: Colors.grey[300],
                  child: Center(child: Text('Map goes here')),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      // Handle my location action
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center( // Centering the text widget
                  child: Text(
                    '10 minutes left',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8.0),
                Center( // Centering the text widget
                  child: Text('Delivery to Jl. Kpg Sutoyo'),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centering the row children
                  children: [
                    Icon(Icons.delivery_dining, color: Colors.orange),
                    SizedBox(width: 8.0),
                    Text(
                      'Delivered your order',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Center( // Centering the text widget
                  child: Text('We will deliver your goods to you in the shortest possible time.'),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/orang2.png'), // Replace with your asset
                      radius: 24.0,
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Brooklyn Simmons', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Personal Courier'),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        // Handle phone call action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
