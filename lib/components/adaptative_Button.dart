import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: () => onPressed,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
         style: ElevatedButton.styleFrom(
         backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).textTheme.labelLarge?.color
         ) ,
          child: Text(label),
          onPressed: () => onPressed,
        );
  }
}
