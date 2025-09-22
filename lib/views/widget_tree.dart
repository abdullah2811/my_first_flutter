import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/constants.dart';
import 'package:my_first_flutter/data/notifiers.dart';
import 'package:my_first_flutter/views/pages/exit_page.dart';
import 'package:my_first_flutter/views/pages/home_page.dart';
import 'package:my_first_flutter/views/pages/profile_page.dart';
import 'package:my_first_flutter/views/pages/settings_page.dart';
import 'package:my_first_flutter/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage(), SettingsPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('My First Flutter App'),
              centerTitle: true,
              elevation: 70,
              actions: [
                isDarkModeNotifier.value
                    ? IconButton(
                        onPressed: () {
                          isDarkModeNotifier.value = false;
                        },
                        icon: Icon(Icons.light_mode),
                      )
                    : IconButton(
                        onPressed: () {
                          isDarkModeNotifier.value = true;
                        },
                        icon: Icon(Icons.dark_mode),
                      ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Abhi Na Jaao Chhod Kar...!'),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ExitPage(username: "Abdullah");
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.exit_to_app),
                ),
                SizedBox(width: 10),
              ],
              backgroundColor: Colors.teal,
              foregroundColor: Colors.black,
            ),
            drawer: Drawer(
              backgroundColor: Colors.teal[400],
              shadowColor: Colors.purple,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Text(
                      'Flutter App Drawer',
                      style: MyTextStyles.subheadingBlack,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.black),
                    title: Text('Home'),
                    textColor: Colors.black,
                    onTap: () {
                      selectedPageNotifier.value = 0;
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text('Profile'),
                    textColor: Colors.black,
                    onTap: () {
                      selectedPageNotifier.value = 1;
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.black),
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
            // floatingActionButton: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         // Action when button is pressed
            //       },
            //       child: Icon(Icons.add),
            //     ),
            //     SizedBox(width: 10), // Space between buttons
            //     FloatingActionButton(
            //       onPressed: () {
            //         // Action when button is pressed
            //       },
            //       child: Icon(Icons.remove),
            //     ),
            //   ],
            // ),
            body: ValueListenableBuilder(
              valueListenable: selectedPageNotifier,
              builder:
                  (BuildContext context, dynamic selectedPage, Widget? child) {
                    return pages[selectedPage];
                  },
            ),
            bottomNavigationBar: NavbarWidget(),
          ),
        );
      },
    );
  }
}
