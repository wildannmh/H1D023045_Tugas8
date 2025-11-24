import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String description;

  const WarningDialog({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Peringatan"),
      content: Text(description),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
