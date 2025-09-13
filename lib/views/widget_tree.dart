import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/notifiers.dart';
import 'package:my_first_flutter/views/pages/home_page.dart';
import 'package:my_first_flutter/views/pages/profile_page.dart';
import 'package:my_first_flutter/views/pages/settings_page.dart';
import 'package:my_first_flutter/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage(), SettingsPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          backgroundColor: Colors.teal[400],
          shadowColor: Colors.purple,
          child: Column(
            children: [
              DrawerHeader(child: Text('Flutter App Drawer')),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                textColor: Colors.black,
                onTap: () {
                  selectedPageNotifier.value = 0;
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                textColor: Colors.black,
                onTap: () {
                  selectedPageNotifier.value = 1;
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                textColor: Colors.black,
                onTap: () {
                  selectedPageNotifier.value = 2;
                  Navigator.pop(context); // Close the drawer
                },
              ),
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
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (BuildContext context, dynamic selectedPage, Widget? child) {
            return pages[selectedPage];
          },
        ),
        bottomNavigationBar: NavbarWidget(),
      ),
    );
  }
}
