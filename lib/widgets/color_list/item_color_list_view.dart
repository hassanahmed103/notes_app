import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';
import 'Item_color.dart';

class ItemColorListView extends StatefulWidget {
  const ItemColorListView({super.key, required this.onSelect});
  final Function(int value) onSelect;

  @override
  State<ItemColorListView> createState() => _ItemColorListViewState();
}

class _ItemColorListViewState extends State<ItemColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount:kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
                widget.onSelect(kColors[index].value);
              },
              child: ItemColor(
                isActive: currentIndex == index,
                color :kColors[index] ,
              ),
            ),
          );
        },
      ),
    );
  }
}
