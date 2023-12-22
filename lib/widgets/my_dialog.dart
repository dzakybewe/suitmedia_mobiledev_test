import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final String text;
  const MyDialog({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
      ],
      actionsPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.end,
      contentPadding: const EdgeInsets.all(16.0),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}