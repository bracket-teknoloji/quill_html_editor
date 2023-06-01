import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/helpers/helper.dart';

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
  final int? maxLength;
  final String? controllerText;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  const CustomTextField(
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
      this.controllerText,
      this.maxLength,
      this.onSubmitted,
      this.validator});

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
      maxLength: widget.maxLength,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTapOutside: (value) {
        widget.onChanged;
      },
      controller: widget.controller ?? TextEditingController(text: widget.controllerText ?? ""),
      readOnly: widget.readOnly ?? false,
      decoration: InputDecoration(
          enabled: widget.enabled ?? true,
          errorStyle: TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: UIHelper.primaryColor.withOpacity(0.7), width: 2), borderRadius: BorderRadius.circular(10), gapPadding: 0),
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
