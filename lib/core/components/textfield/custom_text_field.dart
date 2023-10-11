import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../constants/extensions/list_extensions.dart";
import "../../constants/ui_helper/text_field_formatter_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "custom_text_field_view_model.dart";

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
  final Function()? onClear;
  final bool? fitContent;
  final bool? suffixMore;
  final bool? isFormattedString;
  final bool? isDateTime;
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
      this.suffixMore,
      this.inputFormatter,
      this.isFormattedString,
      this.onClear,
      this.isDateTime});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  CustomTextFieldViewModel viewModel = CustomTextFieldViewModel();
  TextEditingController get controller => widget.controller ?? TextEditingController(text: widget.controllerText);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (controller.)
      controller.addListener(() => viewModel.setShowClearButton(controller.text != ""));
    });
    super.initState();
  }

  @override
  void dispose() {
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
          autofillHints: widget.keyboardType == TextInputType.emailAddress ? [AutofillHints.email] : null,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardType,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: widget.isFormattedString == true ? [TextFieldFormatterHelper.turkishFormatter] : widget.inputFormatter,
          // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          maxLength: widget.maxLength,
          validator: widget.validator ?? ((widget.enabled != false ? (widget.isMust ?? false) : false) ? validator : null),
          controller: controller,
          obscureText: widget.keyboardType == TextInputType.visiblePassword,
          readOnly: widget.readOnly ?? false,
          enableSuggestions: true,
          decoration: InputDecoration(
              enabled: widget.enabled ?? true,
              errorStyle: TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: UIHelper.primaryColor.withOpacity(0.7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 0),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.onClear != null)
                    Observer(builder: (_) {
                      return Visibility(
                        visible: (viewModel.showClearButton == true) && (widget.isMust != true),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.clear();
                            widget.onClear!();
                            // viewModel.setShowClearButton(false);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      );
                    }),
                  if (widget.suffix != null) widget.suffix!,
                  if (widget.isDateTime == true)
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: widget.onTap,
                        icon: const Icon(Icons.date_range_outlined),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                          splashFactory: NoSplash.splashFactory,
                        )),
                  if (widget.suffixMore == true)
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: widget.onTap,
                        icon: const Icon(Icons.more_horiz_outlined),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                          splashFactory: NoSplash.splashFactory,
                        )),
                ].nullCheckWithGeneric,
              ),
              label: widget.labelText == null
                  ? null
                  : Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: widget.labelText ?? "",
                              style: (widget.enabled != false ? (widget.isMust ?? false) : false)
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
