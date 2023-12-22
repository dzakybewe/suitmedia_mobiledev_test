import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobiledev_test/ui/second_screen.dart';

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
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 24,),
              const SizedBox(height: 48.0),
              _textField('Name', _nameController),
              const SizedBox(height: 16.0),
              _textField('Palindrome', _palindromeController),
              const SizedBox(height: 48.0),
              MyButton(
                label: 'CHECK',
                onPressed: (){
                  const snackBar = SnackBar(content: Text('Pressed on check'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              const SizedBox(height: 10.0),
              MyButton(
                label: 'NEXT',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
                }
              ),
            ],
          ),
        )
      ),
    );
  }

  TextField _textField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          overflow: TextOverflow.ellipsis,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}


