import 'package:flutter/material.dart';
import'screens/login.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const LoginScreen()),
                    );
              //Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
