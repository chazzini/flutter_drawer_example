import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  String name = '';
  String urlImage = '';
  UserPage({required name, required urlImage});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(name),
        centerTitle: true,
      ),
      body: Image(
        image: NetworkImage(urlImage),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
