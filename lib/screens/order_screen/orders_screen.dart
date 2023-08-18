import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffF4F6F8),
          toolbarHeight: 50,
          elevation: 0,
          leading: const BackButton(
            color: Color(0xff222222),
          ),
          title: const Center(
              child: Text(
            'My Oder',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xff222222),
                ))
          ]),
      
    );
  }
}
