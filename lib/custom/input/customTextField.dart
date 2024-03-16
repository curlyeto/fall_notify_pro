import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool? showIcon;
  final Icon? icon;
  const CustomTextField({Key? key,this.hintText, required this.controller,  this.showIcon,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }
}
