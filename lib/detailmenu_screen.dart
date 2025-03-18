import 'package:flutter/material.dart';
import 'package:foodcourier/homeview.dart';
import 'package:foodcourier/orderdetail_screen.dart';

class FoodDetailView extends StatelessWidget {
  const FoodDetailView({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });
  final String name;
  final String price;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/menu1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Chicken Burger Promo Pack',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 5),
                      Text('4.8 Rating', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_bag, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('7000+ Order', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt, and pepper. Use your hands to combine all the ingredients together until blended, but don’t over mix.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailsScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
