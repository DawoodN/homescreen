import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart'; 
import 'friend_list_screen.dart';
import '../utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = 'Username';
  String _name = 'Name';
  String _phoneNumber = '012345678910';
  String _dob = '1-1-2024';
  String _program = 'BSCS';
  String _about = 'a bb ccc dddd ';
  bool _isChangesMade = false;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = _username;
    _phoneNumberController.text = _phoneNumber;
    _aboutController.text = _about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 75, 179, 137),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your logout logic here
              showLogoutDialog(context);
            },
            icon: const Icon(Icons.power_settings_new, color: Colors.white, size: 35),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Circular profile picture widget
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.5, color: Colors.grey),
                  image: const DecorationImage(
                    image: AssetImage('assets/no_pic.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Editable fields
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                    _isChangesMade = true;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text('Name: $_name'),
              const SizedBox(height: 10),
              TextField(
                 inputFormatters: [LengthLimitingTextInputFormatter(200)],
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                    _isChangesMade = true;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text('Date of Birth: $_dob'),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _program,
                onChanged: (String? newValue) {
                  setState(() {
                    _program = newValue!;
                    _isChangesMade = true;
                  });
                },
                items: <String>['BSCS', 'BBA', 'ACF']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(200)],
                controller: _aboutController,
                decoration: InputDecoration(
                  labelText: 'About',
                ),
                onChanged: (value) {
                  setState(() {
                    _about = value;
                    _isChangesMade = true;
                  });
                },
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isChangesMade ? _saveChanges : null,
                child: const Text('Save Changes'),
              ),
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
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FriendListScreen()),
                );},
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
            Container(
              width: 60,
              color: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 75, 179, 137),
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    print('Changes saved:');
    print('Username: $_username');
    print('Phone Number: $_phoneNumber');
    print('Program: $_program');
    print('About: $_about');
    setState(() {
      _isChangesMade = false;
    });
  }
}
