import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_test/ui/third_screen.dart';
import 'package:suitmedia_mobiledev_test/widgets/my_button.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/second_screen';
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
        title: const Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),
            ),
            const Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Selected User Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            MyButton(
              label: 'Choose a User',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen())),
            )
          ],
        ),
      ),
    );
  }
}
