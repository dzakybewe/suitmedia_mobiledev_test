import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_test/ui/second_screen.dart';
import 'package:suitmedia_mobiledev_test/widgets/my_dialog.dart';
import 'package:suitmedia_mobiledev_test/widgets/my_textfield.dart';

import '../widgets/my_button.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/first_screen';
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/fotobewe.jpg'),
                  radius: 70,
                ),
                const SizedBox(height: 16.0),
                MyTextField(hint: 'Name', controller: _nameController),
                const SizedBox(height: 16.0),
                MyTextField(hint: 'Palindrome', controller: _palindromeController),
                const SizedBox(height: 48.0),
                MyButton(
                  label: 'CHECK',
                  onPressed: () => _isPalindrome(_palindromeController.text),
                ),
                const SizedBox(height: 10.0),
                MyButton(
                  label: 'NEXT',
                  onPressed: () {
                    if (_nameController.text.isEmpty || _nameController.text == '') {
                      showDialog(context: context, builder: (context){
                        return const MyDialog(text: 'Please fill the Name field',);
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            SecondScreen(name: _nameController.text)),
                      );
                    }
                  }
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void _isPalindrome(String text){
    String processedText = text.replaceAll(' ', '');
    String reverse = '';
    int length = processedText.length;
    for (int i = (length - 1); i >= 0; i--) {
      reverse = reverse + processedText[i];
    }

    if (processedText.isEmpty){
      showDialog(context: context, builder: (context){
        return const MyDialog(text: 'fill the text to check Palindrome');
      });
    } else if (processedText.toLowerCase() == reverse.toLowerCase()) {
      showDialog(context: context, builder: (context){
        return const MyDialog(text: 'isPalindrome');
      });
    } else {
      showDialog(context: context, builder: (context){
        return const MyDialog(text: 'not palindrome');
      });
    }
  }
}






