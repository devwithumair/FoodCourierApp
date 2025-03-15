import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),
    );
  }
}
