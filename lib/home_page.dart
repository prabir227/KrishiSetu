import 'package:krishi_setu/explore_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:krishi_setu/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ExplorePage(),
    const ExplorePage(),
    const ExplorePage(),
    ProfilePage() // No `const` here
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              pinned: true, // Keeps the app bar at the top
              floating: false, // Avoids the app bar floating up while scrolling
              expandedHeight: 150.0, // Expands the app bar height
              backgroundColor: Colors.transparent, // Set app bar transparent
              elevation: 0, // Remove shadow
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "", // Remove or customize the title if needed
                ),
                background: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: currentPageIndex != 4 // Check if it's not the ProfilePage
                        ? Text(
                      "Welcome back, Rajesh",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                        letterSpacing: 1.2,
                      ),
                    )
                        : Container(), // Show nothing on ProfilePage
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton.filledTonal(
                    onPressed: () {},
                    icon: badges.Badge(
                      badgeContent: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      position: badges.BadgePosition.topEnd(top: -15, end: -12),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Color.fromARGB(255, 46, 190, 51),
                      ),
                      child: const Icon(IconlyBroken.notification),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
        body: pages[currentPageIndex], // Render the current page based on index
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color(0xffAEDC81), // Light green background
        selectedItemColor: const Color(0xff266116), // Green color for selected icon
        unselectedItemColor: Colors.black, // Black for unselected icons
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: "Market",
            activeIcon: Icon(IconlyBold.call),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Community",
            activeIcon: Icon(IconlyBold.buy),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: "Mandi",
            activeIcon: Icon(Icons.shopping_basket_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(IconlyBold.profile),
          ),
        ],
      ),
    );
  }
}
