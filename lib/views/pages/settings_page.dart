import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/notifiers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: userVerifiedNotifier,
          builder: (context, isVerified, child) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Adjust your settings here!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Divider(color: Colors.black, indent: 20, endIndent: 20),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SwitchListTile(
                              title: Text('Dark Mode Enabled'),
                              value: isDarkMode,
                              onChanged: (bool? value) {
                                isDarkModeNotifier.value = value ?? false;
                              },
                            ),
                            //Divider(color: Colors.teal[400], thickness: 3),
                            CheckboxListTile(
                              title: Text('User is Verified'),
                              value: isVerified,
                              onChanged: (bool? value) {
                                userVerifiedNotifier.value = value ?? false;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Divider(color: Colors.teal[400], thickness: 3),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Slider.adaptive(
                          value: sliderValue,
                          onChanged: (double value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                          min: 0,
                          max: 1,
                          divisions: 10,
                          label: 'Rate Our App ${(sliderValue * 10).round()}',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Spacer(), // Push the next cards to the bottom
                    Card(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.teal,
                                ),
                                foregroundColor: WidgetStateProperty.all(
                                  Colors.yellow,
                                ),
                                shadowColor: WidgetStateProperty.all(
                                  Colors.purple,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AboutDialog();
                                  },
                                );
                              },
                              child: Text('About the App'),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.teal,
                                ),
                                foregroundColor: WidgetStateProperty.all(
                                  Colors.yellow,
                                ),
                                shadowColor: WidgetStateProperty.all(
                                  Colors.purple,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Alert Dialog'),
                                      content: Text('This is an alert dialog.'),
                                      actions: [
                                        FilledButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Close'),
                                        ),
                                        FilledButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(Icons.close),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('Alerts'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
