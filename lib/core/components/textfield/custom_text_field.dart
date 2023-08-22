import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

import "../../constants/ui_helper/ui_helper.dart";

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? valueText;
  final Widget? valueWidget;
  final bool? isMust;
  final bool? readOnly;
  final bool? enabled;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLength;
  final String? controllerText;
  final List<TextInputFormatter>? inputFormatter;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final bool? fitContent;
  final bool? suffixMore;
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
      this.validator,
      this.valueWidget,
      this.fitContent,
      this.suffixMore, this.inputFormatter});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController get controller => widget.controller ?? TextEditingController(text: widget.controllerText);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (widget.focusNode != null) widget.focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fitContent ?? false) {
      return SizedBox(
        width: Get.width / 2.1,
        child: textFormField,
      );
    } else {
      return textFormField;
    }
  }

  Widget get textFormField {
    return TextFieldTapRegion(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onTapInside: (event) => SelectableText.rich(TextSpan(children: [TextSpan(text: controller.text)])),
      child: MouseRegion(
        onExit: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardType,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: widget.inputFormatter,
          // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          maxLength: widget.maxLength,
          validator: widget.validator ?? ((widget.isMust ?? false) ? validator : null),
          controller: controller,
          obscureText: widget.keyboardType == TextInputType.visiblePassword,
          readOnly: widget.readOnly ?? false,
          decoration: InputDecoration(
              enabled: widget.enabled ?? true,
              errorStyle: TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: UIHelper.primaryColor.withOpacity(0.7), width: 2), borderRadius: BorderRadius.circular(10), gapPadding: 0),
              suffixIcon: (widget.enabled ?? true ? (widget.suffixMore ?? false ? const Icon(Icons.more_horiz_outlined) : widget.suffix) : null),
              label: widget.labelText == null
                  ? null
                  : Wrap(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: widget.labelText ?? "",
                              style: (widget.isMust ?? false)
                                  ? TextStyle(color: UIHelper.primaryColor)
                                  : ((widget.controller?.text == "") ? TextStyle(color: Colors.grey.withOpacity(0.6)) : TextStyle(color: Colors.grey.withOpacity(0.8)))),
                          TextSpan(text: " ${widget.valueText ?? ""}", style: TextStyle(color: Colors.grey.withOpacity(0.3), fontSize: 12))
                        ])),
                        if (widget.valueWidget != null) SizedBox(width: UIHelper.lowSize),
                        if (widget.valueWidget != null) widget.valueWidget!,
                      ],
                    )),
        ).paddingAll(UIHelper.lowSize),
      ),
    );
  }

  String? validator(p0) {
    if (p0 == null || p0.isEmpty) {
      return "${widget.labelText ?? ""} boş bırakılamaz";
    } else if (widget.maxLength != null && p0.length > widget.maxLength!) {
      return "${widget.labelText ?? ""} en fazla ${widget.maxLength ?? ""} karakter olabilir";
    } else if (widget.keyboardType == TextInputType.emailAddress && !GetUtils.isEmail(p0)) {
      return "Geçerli bir e-posta adresi giriniz";
    } else if (widget.keyboardType == TextInputType.number && !GetUtils.isNumericOnly(p0)) {
      return "Sadece rakam giriniz";
    } else if (widget.keyboardType == TextInputType.phone && !GetUtils.isPhoneNumber(p0)) {
      return "Geçerli bir telefon numarası giriniz";
    } else if (widget.keyboardType == TextInputType.url && !GetUtils.isURL(p0)) {
      return "Geçerli bir url giriniz";
      // } else if (widget.keyboardType == TextInputType.visiblePassword && !GetUtils.isLengthGreaterOrEqual(p0, 6)) {
      //   return "Şifre en az 6 karakter olmalıdır";
    }
    return null;
  }
}
