import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarTextField extends StatefulWidget {
  final void Function(String)? onFieldSubmitted;
  const CustomAppBarTextField({super.key, this.onFieldSubmitted});

  @override
  State<CustomAppBarTextField> createState() => _CustomAppBarTextFieldState();
}

class _CustomAppBarTextFieldState extends State<CustomAppBarTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: kToolbarHeight * 0.9,
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Ara",
                    ),
                    onFieldSubmitted: widget.onFieldSubmitted,
                  ).marginAll(5),
                );
  }
}