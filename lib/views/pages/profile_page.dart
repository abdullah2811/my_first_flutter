import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Here is the Profile Page!',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
