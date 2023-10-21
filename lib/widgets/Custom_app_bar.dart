import 'package:flutter/material.dart';

import 'Custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed,});

  final String title;
  final IconData icon;
  final Function()? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(144);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
           CustomIcon(
           onPressed: onPressed,
             icon: icon,
           ),
        ],
      ),
    );
  }
}
