import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
             keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              controller: controller,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12
              ),
          ),
        )
        : TextField(
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            controller: controller,
            decoration: InputDecoration(
              labelText: label
              ),
          );
  }
}
