import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? valueText;
  final bool? isMust;
  final bool? readOnly;
  final bool? enabled;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
   String? controllerText;
  final Function()? onTap;
  final Function(String)? onChanged;
   CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.valueText,
      this.isMust,
      this.readOnly,
      this.suffix,
      this.enabled,
      this.focusNode,
      this.onTap,
      this.keyboardType,
      this.onChanged,
      this.controllerText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onTapOutside: (value) {
        widget.onChanged;
      },
      controller: widget.controller ?? TextEditingController(text: widget.controllerText ?? ""),
      readOnly: widget.readOnly ?? false,
      decoration: InputDecoration(
          enabled: widget.enabled ?? true,
          suffixIcon: widget.enabled ?? true ? widget.suffix : null,
          label: Text.rich(TextSpan(children: [
            TextSpan(
                text: widget.labelText ?? "",
                style: (widget.isMust ?? false)
                    ? TextStyle(color: UIHelper.primaryColor)
                    : ((widget.controller?.text == "") ? TextStyle(color: Colors.grey.withOpacity(0.6)) : TextStyle(color: Colors.grey.withOpacity(0.8)))),
            TextSpan(text: " ${widget.valueText ?? ""}", style: TextStyle(color: Colors.grey.withOpacity(0.3), fontSize: 12))
          ]))),
    ).paddingAll(UIHelper.lowSize);
  }
}
