import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
 const  ItemColor({super.key, required this.isActive,required this.color});

  final bool isActive;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            radius: 38,
            backgroundColor: Colors.amber,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        :  CircleAvatar(
            radius: 38 ,
            backgroundColor: color,
          );
  }
}
