import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/notifiers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showRow = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            onEditingComplete: () {
              setState(() {
                showRow = true;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(height: 50),
          if (showRow)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${name.text}!', style: TextStyle(fontSize: 25)),
                SizedBox(width: 10),
                ValueListenableBuilder(
                  valueListenable: userVerifiedNotifier,
                  builder: (context, value, child) {
                    if (value == true) {
                      return Icon(Icons.verified, color: Colors.blue, size: 20);
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
