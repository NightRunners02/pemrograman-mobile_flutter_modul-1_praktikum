import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleButton(text: 'Deliver', isSelected: true),
                ToggleButton(text: 'Pick Up'),
              ],
            ),
            SizedBox(height: 16.0),
            AddressSection(),
            SizedBox(height: 16.0),
            OrderItem(),
            SizedBox(height: 16.0),
            DiscountSection(),
            SizedBox(height: 16.0),
            PaymentSummary(),
            SizedBox(height: 16.0),
            PaymentMethod(),
            Spacer(),
            OrderButton(),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  ToggleButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text('Jl. Kpg Sutoyo'),
          Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai'),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(Icons.edit, color: Colors.orange),
                label: Text('Edit Address', style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  // Handle edit address
                },
              ),
              TextButton.icon(
                icon: Icon(Icons.note_add, color: Colors.orange),
                label: Text('Add Note', style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  // Handle add note
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/mocha_coffee.png', height: 50, width: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Caffe Mocha', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Deep Foam', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  // Handle decrease quantity
                },
              ),
              Text('1'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Handle increase quantity
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiscountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.local_offer, color: Colors.orange),
              SizedBox(width: 8.0),
              Text('1 Discount is Applies', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 16.0),
        ],
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text('\$4.53'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee'),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '\$2.0',
                      style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                    ),
                    TextSpan(
                      text: '  \$1.0',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.account_balance_wallet, color: Colors.orange),
              SizedBox(width: 8.0),
              Text('Cash/Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text('\$5.53', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          primary: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Handle order action
        },
        child: Text('Order', style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
