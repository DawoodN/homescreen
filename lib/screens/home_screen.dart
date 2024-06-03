import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'friend_list_screen.dart';
import '../utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 75, 179, 137),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 56),
            Text(
              'UniMeet',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.85,
                child: Container(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Image(
                      image: AssetImage('assets/no_pic.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '    Username, 20',
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 179, 137),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Row(
                children: [
                  SizedBox(width: 31),
                  Expanded(child: Text("aaa", style: TextStyle(fontSize: 18))),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromARGB(255, 75, 179, 137),
                        size: 80,
                      ),
                      onPressed: () {},
                    ),
                    const VerticalDivider(
                      thickness: 3,
                      width: 80,
                      color: Color.fromARGB(255, 75, 179, 137),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_rounded,
                        color: Color.fromARGB(255, 75, 179, 137),
                        size: 80,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: const Color.fromARGB(255, 75, 179, 137),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.group, color: Colors.white, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FriendListScreen()),
                );
              },
            ),
            const VerticalDivider(
              width: 65,
              color: Color.fromARGB(255, 75, 179, 137),
            ),
            Container(
              width: 60,
              color: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 75, 179, 137),
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'UniMeet')),
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
              icon: const Icon(Icons.person, color: Colors.white, size: 40),
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
