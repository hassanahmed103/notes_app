import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key, required this.text, this.onTap, this.isLoading = false});

  final String text;
  final void Function()? onTap;
  final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: isLoading
                ?const SizedBox(
              width: 24,height: 24,
                child:  CircularProgressIndicator(color: Colors.amber,))
                : Text(
                    text,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
