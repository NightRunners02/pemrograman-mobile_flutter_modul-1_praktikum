import 'package:flutter/material.dart';

void main() {
  runApp(SettingApp());
}

class SettingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 255, 145, 0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back action
          },
        ),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Profile Image
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/orang1.jpeg'), // Profile picture asset
          ),
          SizedBox(height: 10),
          // Username
          Text(
            "Andi",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 40),
          // ListTile for "Atur Nama"
          ListTile(
            title: Text(
              "Atur Nama",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to "Atur Nama" screen
            },
          ),
          Divider(),
          // ListTile for "Ubah Password"
          ListTile(
            title: Text(
              "Ubah Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to "Ubah Password" screen
            },
          ),
          Spacer(),
          // Bottom Navigation Bar
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 3, // Make profile tab active
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            onTap: (index) {
              // Handle navigation to other screens
            },
          ),
        ],
      ),
    );
  }
}
