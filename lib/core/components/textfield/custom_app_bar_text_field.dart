import "package:flutter/material.dart";
import "package:get/get.dart";

class CustomAppBarTextField extends StatefulWidget {
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomAppBarTextField(
      {super.key, this.onFieldSubmitted, this.controller, this.onChanged});

  @override
  State<CustomAppBarTextField> createState() => _CustomAppBarTextFieldState();
}

class _CustomAppBarTextFieldState extends State<CustomAppBarTextField> {
  @override
  Widget build(BuildContext context) => SizedBox(
      height: kToolbarHeight * 0.9,
      child: TextFieldTapRegion(
        onTapOutside: (x) {
          FocusScope.of(context).unfocus();
        },
        child: TextFormField(
                controller: widget.controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Ara",
                  suffixIcon: widget.controller != null
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            widget.controller?.clear();
                            widget.onChanged?.call("");
                          },
                        )
                      : null,
                ),
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onFieldSubmitted)
            .marginAll(5),
      ),
    );
}
