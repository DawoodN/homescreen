import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import '../utils.dart'; 

class FriendListScreen extends StatelessWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 75, 179, 137),
        title: const Text(
          'Friend List',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
             showLogoutDialog(context);
            },
            icon: const Icon(Icons.power_settings_new, color: Colors.white, size: 35),
          ),
        ],
      ),
      body: const Center(
        child: Text('Friend List Screen'),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: const Color.fromARGB(255, 75, 179, 137),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              color: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.group,
                    color: Color.fromARGB(255, 75, 179, 137),
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FriendListScreen()),
                    );
                  },
                ),
              ),
            ),
            const VerticalDivider(
              width: 65,
              color: Color.fromARGB(255, 75, 179, 137),
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'UniMeet')),
                );
              },
            ),
            const VerticalDivider(
              width: 65,
              color: Color.fromARGB(255, 75, 179, 137),
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
