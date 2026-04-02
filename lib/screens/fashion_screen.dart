import 'package:flutter/material.dart';

import '../widgets/custom_item_card.dart';
import '../widgets/custom_nav_item.dart';

class FashionScreen extends StatefulWidget {
  const FashionScreen({super.key});

  @override
  State<FashionScreen> createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomePage(),
          _buildCartPage(),
          _buildBagPage(),
          _buildFavoritePage(),
          _buildProfilePage(),
        ],
      ),
      // 🔻 BOTTOM NAV BAR
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavItem(
              icon: Icons.home,
              active: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            CustomNavItem(
              icon: Icons.shopping_cart_outlined,
              active: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            CustomNavItem(
              icon: Icons.shopping_bag_outlined,
              active: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            CustomNavItem(
              icon: Icons.favorite_border,
              active: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
            CustomNavItem(
              icon: Icons.person_outline,
              active: _selectedIndex == 4,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return Column(
      children: [
        // 🔥 TOP IMAGE SECTION
        Stack(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade200, Colors.blue.shade400],
                ),
              ),
            ),
            // DARK OVERLAY
            Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            // TEXT + BUTTON
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fashion\nsale",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "Check",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // 🔽 BOTTOM SECTION
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "New",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "You've never seen it before!",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 15),
                // HORIZONTAL LIST
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomItemCard(image: "assets/girl.jpg"),
                      CustomItemCard(image: "assets/boy.jpg"),
                      CustomItemCard(image: "assets/girl2.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartPage() {
    return const Center(
      child: Text(
        "Cart Page",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBagPage() {
    return const Center(
      child: Text(
        "Bag Page",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFavoritePage() {
    return const Center(
      child: Text(
        "Favorite Page",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfilePage() {
    return const Center(
      child: Text(
        "Profile Page",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
