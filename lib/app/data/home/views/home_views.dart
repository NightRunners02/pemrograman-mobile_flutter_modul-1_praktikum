import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeApp(),
    );
  }
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.orange, size: 16),
                Text(
                  'Indonesia, Malang',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promo Banner
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/buy1get1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Buy one get one FREE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Coffee Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CoffeeCategoryChip(label: 'All Coffee'),
                  CoffeeCategoryChip(label: 'Macchiato'),
                  CoffeeCategoryChip(label: 'Latte'),
                  CoffeeCategoryChip(label: 'Americano'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Coffee Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  return CoffeeCard(coffee: coffeeList[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CoffeeCategoryChip extends StatelessWidget {
  final String label;

  const CoffeeCategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        backgroundColor: Colors.brown[300],
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;

  const CoffeeCard({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(coffee.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(coffee.description, style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${coffee.price}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.star, color: Colors.orange, size: 16),
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

class Coffee {
  final String name;
  final String description;
  final String imagePath;
  final double price;

  Coffee(this.name, this.description, this.imagePath, this.price);
}

List<Coffee> coffeeList = [
  Coffee("Caffe Mocha", "Deep Foam", 'assets/mocha_coffee.png', 4.53),
  Coffee("Flat White", "Espresso", 'assets/flat_white.png', 3.53),
  // Add more coffee options here
];
