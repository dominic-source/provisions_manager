import 'package:flutter/material.dart';
import 'package:provisions_manager/my_widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Welcome to Provisions Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB clicked');
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainCard(),
            ],
          ),
        ),
      ),
    );
  }
}
