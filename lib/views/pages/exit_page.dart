import 'package:flutter/material.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({super.key, required username});

  @override
  State<ExitPage> createState() => _ExitPageState();
}

final String username = 'User';

class _ExitPageState extends State<ExitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
        title: Text('Exit Page'),
        //automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 70,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to exit, $username?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shadowColor: WidgetStateProperty.all(Colors.purple),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Laut ke Aana...hai Yeh hi Tumko!'),
                        //behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 4),
                      ),
                    );
                    // Exit the app
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Exit'),
                ),
                SizedBox(width: 100),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shadowColor: WidgetStateProperty.all(Colors.purple),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ke Dil Abhi Bharaa Nahi!'),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 4),
                      ),
                    );
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
