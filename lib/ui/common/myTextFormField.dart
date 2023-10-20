import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  final String label;
  final TextEditingController controller;

  MyTextFormField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: Theme.of(context).textTheme.labelMedium
      ),
    );
  }
}
