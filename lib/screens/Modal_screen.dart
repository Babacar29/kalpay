import 'package:flutter/material.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class Modal_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.4,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: VirtualKeyboard(
        // Default height is 300
          height: 350,
          // Default is black
          textColor: Colors.white,
          // Default 14
          fontSize: 20,
          // [A-Z, 0-9]
          type: VirtualKeyboardType.Alphanumeric,
          // Callback for key press event
          onKeyPress: null
      ),

    );
  }
}
