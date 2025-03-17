// ignore_for_file: unused_field, unused_element

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodcourier/chat_screen.dart';
import 'package:foodcourier/detailmenu_screen.dart';
import 'package:foodcourier/orderdetail_screen.dart';
import 'package:foodcourier/profile_screen.dart';

import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List categories = [
    {'name': 'Burger', 'image': 'assets/images/burger.jpg'},
  ];

  final List foodItems = [
    {
      'name': 'Chicken Burger',
      'price': '\$2.00',
      'rating': 3.8,
      'image': 'assets/images/burger1.jpg',
    },
    {
      'name': 'Cheese Burger',
      'price': '\$1.50',
      'rating': 4.5,
      'image': 'assets/images/burger1.jpg',
    },
  ];

  final List<String> imgList = ["assets/images/burger.jpg"];

  final List<Map<String, dynamic>> mealMenu = [
    {
      'name': 'Papparoni Pizza',
      'price': '\$15',
      'description': '5kg box of Pizza',
      'image': 'assets/images/pizza.jpg',
    },
    {
      'name': 'Papparoni Pizza',
      'price': '\$15',
      'description': '5kg box of Pizza',
      'image': 'assets/images/pizza.jpg',
    },
  ];

  int _currentIndex = 0; // Track selected tab index

  final List<Widget> _screens = [
    HomeView(), // Home screen
    ProfileScreen(), // Profile screen
    OrderDetailsScreen(), // Cart screen
    ChatScreen(), // Messages screen
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Freedom way, Lekki phase',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ), // Adds margin
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none, // Removes default border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  CarouselSlider(
                    options: CarouselOptions(height: 150, autoPlay: true),
                    items:
                        imgList
                            .map(
                              (item) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                child: Center(
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 448,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 220,
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 30,
                                ),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 100,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              child: Image.asset(
                                                categories[index]['image'],
                                              ),
                                            ),
                                            Text(
                                              "${categories[index]['name']}",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: foodItems.length,
                    itemBuilder: (context, index) {
                      final item = foodItems[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            FoodDetailView(name: '', price: '', imagePath: ''),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(foodItems[index]["image"]),
                              SizedBox(height: 10),
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item['price'],
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text(item['rating'].toString()),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => FoodDetailView(
                                                name: '',
                                                price: '',
                                                imagePath: '',
                                              ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Popular Meal Menu",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 220.0),
                          child: Text(
                            "See all",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mealMenu.length,
                    itemBuilder: (context, index) {
                      final meal = mealMenu[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            FoodDetailView(name: '', price: '', imagePath: ''),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              meal['image'],
                              width: 50,
                              height: 50,
                            ),
                            title: Text(
                              meal['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              meal['description'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            trailing: Text(
                              meal['price'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          ProfileScreen(),
          OrderDetailsScreen(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
        ],
      ),
    );
  }
}
