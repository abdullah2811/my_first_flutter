import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/constants.dart';
import 'package:my_first_flutter/views/widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/bgdark.jpg',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.8),
                  child: Text('Welcome to the', style: MyTextStyles.subheading),
                ),
                Align(
                  alignment: Alignment(0, -0.7),
                  child: Text(
                    'My First Flutter App',
                    style: MyTextStyles.headline,
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.5),
                  child: SizedBox(
                    width: width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: 'Enter your username',
                        labelText: 'Username',
                      ),
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.3),
                  child: SizedBox(
                    width: width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.5,
                  top: height * 0.8,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WidgetTree();
                          },
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 25,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Log In'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
