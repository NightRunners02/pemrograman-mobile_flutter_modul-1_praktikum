import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoffeeShopScreen(),
    );
  }
}

class CoffeeShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0, // Hides the app bar, you can adjust as needed
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Text(
                              'Bilzen, Tanjungbalai',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.notifications_none, color: Colors.white),
                  ],
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search coffee',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/buy1get1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(text: 'All Coffee', isSelected: true),
                FilterButton(text: 'Machiato'),
                FilterButton(text: 'Latte'),
                FilterButton(text: 'Americano'),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.75,
              children: [
                CoffeeCard(name: 'Caffe Mocha', price: 4.53, rating: 4.8, image: 'assets/mocha_coffee.png'),
                CoffeeCard(name: 'Flat White', price: 3.53, rating: 4.8, image: 'assets/flat_white.png'),
                // Add more CoffeeCard widgets here as needed
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  FilterButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String name;
  final double price;
  final double rating;
  final String image;

  CoffeeCard({required this.name, required this.price, required this.rating, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Deep Foam', style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price'),
                    Icon(Icons.star, color: Colors.orange),
                    Text('$rating'),
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
