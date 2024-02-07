import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/images/Logo.png',
            scale: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Currency Converter',
          ),
        ],
      ),
    );
  }
}
