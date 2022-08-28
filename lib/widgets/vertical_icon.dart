import 'package:flutter/material.dart';

class VerticalIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const VerticalIcon(
      {required this.icon, required this.text, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
