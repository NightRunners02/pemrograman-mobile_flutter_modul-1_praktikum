import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeDetailScreen(),
    );
  }
}

class CoffeeDetailScreen extends StatefulWidget {
  @override
  _CoffeeDetailScreenState createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back action
          },
        ),
        title: Text("Detail", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffee Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/mocha_coffee.png', // Image path
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 20),

            // Coffee Name and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Caffe Mocha",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Ice/Hot", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 5),
                    Text(
                      "4.8",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" (230)", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.directions_bike, color: Colors.orange),
                Icon(Icons.local_cafe, color: Colors.orange),
                Icon(Icons.local_drink, color: Colors.orange),
              ],
            ),
            SizedBox(height: 20),

            // Description
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "A cappuccino is approximately 150 ml (5 oz) beverage, "
              "with 25 ml of espresso coffee and 85 ml of fresh milk. "
              "It's a perfect blend of strong coffee with soft and creamy milk. "
              "Read more",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Size Selector
            Text(
              "Size",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CoffeeSizeButton(label: "S"),
                CoffeeSizeButton(label: "M", isSelected: true),
                CoffeeSizeButton(label: "L"),
              ],
            ),
            SizedBox(height: 20),

            // Price and Buy Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$4.53",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: _pickImage, // Gantikan tombol dengan fungsi pick image
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Pick Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeSizeButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CoffeeSizeButton({
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
