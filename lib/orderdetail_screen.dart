import 'package:flutter/material.dart';
import 'package:foodcourier/location_screen.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Pizza Spicy",
      "restaurant": "Burger Factory LTD",
      "price": 20,
      "image": "assets/images/pizza.jpg",
      "quantity": 1,
    },
    {
      "name": "Pizza Spicy",
      "restaurant": "Burger Factory LTD",
      "price": 20,
      "image": "assets/images/pizza.jpg",
      "quantity": 1,
    },
    {
      "name": "Pizza Spicy",
      "restaurant": "Burger Factory LTD",
      "price": 20,
      "image": "assets/images/pizza.jpg",
      "quantity": 1,
    },
  ];

  int getTotal() {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item["price"] * item["quantity"] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Order details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        item["image"],
                        width: 50,
                        height: 50,
                      ),
                      title: Text(item["name"]),
                      subtitle: Text(item["restaurant"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (item["quantity"] > 1) {
                                  item["quantity"]--;
                                }
                              });
                            },
                          ),
                          Text("${item["quantity"]}"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                item["quantity"]++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Card(
              color: Colors.red[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub-Total"),
                        Text("${getTotal() + 10 - 10} \$"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery Charge"), Text("10 \$")],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${getTotal() + 10} \$",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Place My Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
