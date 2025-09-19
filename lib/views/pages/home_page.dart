import 'package:flutter/material.dart';

int hit = 0;
String? action = 'Slapped';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Home Page',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text('Select an Action:'),
          DropdownButton(
            value: action,
            items: [
              DropdownMenuItem(value: 'Slapped', child: Text('Slap')),
              DropdownMenuItem(value: 'Kicked', child: Text('Kick')),
              DropdownMenuItem(value: 'Punched', child: Text('Punch')),
            ],
            onChanged: (value) {
              setState(() {
                hit = 0;
                action = value;
              });
            },
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          InkWell(
            splashColor: Colors.red,
            onTap: () {
              setState(() {
                hit++;
              });
            },
            child: Image.asset('assets/images/abdullah.jpg', height: 300),
          ),
          SizedBox(height: 20),
          Text(
            'You have $action Abdullah $hit times!',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                hit = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('Reset $action Count'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Home Page! This is where you can find the latest updates and features of our app. Explore and enjoy your stay!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
