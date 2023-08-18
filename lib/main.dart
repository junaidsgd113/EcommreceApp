import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_sceen/home_screen.dart';
import 'screens/order_screen/orders_screen.dart';
import 'screens/account_screen/account_screen.dart';
import 'screens/cart _screen/cart_screen.dart';
import 'screens/wallet _scrren/wallet_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: Ecommerce()),
  );
}

class Ecommerce extends StatefulWidget {
  const Ecommerce({super.key});

  @override
  State<Ecommerce> createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      );
    });
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() {
    return BottomNavigation();
  }
}

class BottomNavigation extends State<Homepage> {
  int selecteditem = 0;
  List itemLabels = [
    const HomeScreen(),
    CartScreen(),
    const OrdersScreen(),
    const WalletScreen(),
    const AccountScreen()
  ];
  void updateItem(int value) {
    setState(() {
      selecteditem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LayoutBuilder(builder: (context, constraints) {
        return BottomNavigationBar(
          backgroundColor: const Color(0xffF4F6F8),
          selectedItemColor: const Color(0xff222222),
          unselectedItemColor: const Color(0xff828282),
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/cart.png',
                scale: 1,
                color: const Color(0xff828282),
              ),
              label: 'Orders',
              activeIcon: Image.asset(
                'assets/images/cart.png',
                scale: 1,
                color: const Color(0xff222222),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/wallet.png',
                scale: 2,
                color: const Color(0xff828282),
              ),
              label: 'Wallet',
              activeIcon: Image.asset(
                'assets/images/wallet.png',
                color: const Color(0xff222222),
                scale: 2,
              ),
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Account'),
          ],
          currentIndex: selecteditem,
          onTap: updateItem,
        );
      }),
      body: Center(
        child: itemLabels[selecteditem],
      ),
    );
  }
}
