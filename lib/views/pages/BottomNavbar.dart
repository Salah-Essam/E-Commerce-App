import 'package:e_commerce/views/pages/BagPage.dart';
import 'package:e_commerce/views/pages/FavoritesPage.dart';
import 'package:e_commerce/views/pages/HomePage.dart';
import 'package:e_commerce/views/pages/ProfilePage.dart';
import 'package:e_commerce/views/pages/ShopPage.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<PersistentTabConfig> _tabs(double padding) => [
    PersistentTabConfig(
      screen: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: const HomePage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.home),
        title: "Home",
        activeForegroundColor: const Color(0xFFDB3022),
      ),
    ),
    PersistentTabConfig(
      screen: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: const ShopPage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_cart),
        title: "Shop",
        activeForegroundColor: const Color(0xFFDB3022),
      ),
    ),
    PersistentTabConfig(
      screen: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: const BagPage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_bag),
        title: "Bag",
        activeForegroundColor: const Color(0xFFDB3022),
      ),
    ),
    PersistentTabConfig(
      screen: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: const FavoritesPage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.favorite),
        title: "Favorites",
        activeForegroundColor: const Color(0xFFDB3022),
      ),
    ),
    PersistentTabConfig(
      screen: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: const ProfilePage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeForegroundColor: const Color(0xFFDB3022),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final padding =
        MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight;
    return Scaffold(
      body: PersistentTabView(
        backgroundColor: Theme.of(context).colorScheme.surface,
        tabs: _tabs(padding),
        navBarBuilder:
            (navBarConfig) => Style2BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
