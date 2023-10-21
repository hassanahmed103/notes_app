import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/models/note_model.dart';
import 'Item_color.dart';

class ItemColorUpdate extends StatefulWidget {
  const ItemColorUpdate({super.key, required this.note, required this.onSelect});

  final NoteModel note;
  final Function(int value) onSelect;

  @override
  State<ItemColorUpdate> createState() => _ItemColorUpdateState();
}

class _ItemColorUpdateState extends State<ItemColorUpdate> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                // widget.note.color = kColors[index].value;
                setState(() {});
                widget.onSelect(kColors[index].value);
              },
              child: ItemColor(
                isActive: kColors[index].value == widget.note.color,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
