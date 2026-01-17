import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.red,
          ),
          onPressed: () {},
          child: Text("Add To Cart"),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  "https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",

                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("Product Name", style: TextStyle(fontSize: 20)),

                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      Text("1"),
                      IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                      Spacer(),
                      Text("Product Price", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Text("Product Description ", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
