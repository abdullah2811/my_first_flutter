import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 8, 234, 42),
          brightness: Brightness.dark,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My First Flutter App'),
            centerTitle: true,
            elevation: 70,
            //leading: Icon(Icons.construction),
            actions: [Icon(Icons.exit_to_app), Text('Exit  ')],
            backgroundColor: Colors.teal,
            foregroundColor: Colors.black,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(child: Text('Flutter App Drawer')),
                ListTile(title: Text('Home')),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Action when button is pressed
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 10), // Space between buttons
              FloatingActionButton(
                onPressed: () {
                  // Action when button is pressed
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (int index) {
              // Handle navigation logic here
              // print('Selected index: $index');
            },
          ),
        ),
      ),
    );
  }
}
