import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_test/ui/third_screen.dart';
import 'package:suitmedia_mobiledev_test/widgets/my_button.dart';


class SecondScreen extends StatefulWidget {
  static const routeName = '/second_screen';
  final String name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = 'Selected User Name';

  void _awaitSelectedUserName(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      ThirdScreen.routeName
    );

    setState(() {
      selectedUserName = result.toString();
    });
  }

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
            Text(
              widget.name == '' ? 'User' : widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  selectedUserName == 'null' ? 'Selected User Name' : selectedUserName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            MyButton(
              label: 'Choose a User',
              onPressed: () {
                _awaitSelectedUserName(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
