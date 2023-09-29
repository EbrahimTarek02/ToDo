import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  final String label;

  MyTextFormField({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: label,
        hintStyle: Theme.of(context).textTheme.labelMedium
      ),
    );
  }
}
