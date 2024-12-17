import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../base/state/base_state.dart";
import "../../constants/color_palette.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/text_span_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ui_helper/text_field_formatter_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "custom_text_field_view_model.dart";

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? valueText;
  final TextSpan? descriptionWidget;
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
  final void Function()? onTap;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function(DateTime? value)? onDateChange;
  final void Function()? onClear;
  final bool? suffixMore;
  final bool? isFormattedString;
  final bool? isDateTime;
  final bool? isTime;
  final bool obscureText;
  const CustomTextField({
    super.key,
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
    this.suffixMore,
    this.inputFormatter,
    this.isFormattedString,
    this.onClear,
    this.isDateTime,
    this.isTime,
    this.descriptionWidget,
    this.obscureText = false,
  }) : onDateChange = null;

  const CustomTextField.dateTime({
    super.key,
    required this.controller,
    this.labelText,
    this.valueText,
    this.descriptionWidget,
    this.valueWidget,
    this.isMust,
    this.readOnly,
    this.enabled,
    this.suffix,
    this.focusNode,
    this.controllerText,
    this.inputFormatter,
    this.onTap,
    this.validator,
    this.onChanged,
    this.onClear,
    required this.onDateChange,
    this.obscureText = false,
  })  : isDateTime = true,
        isFormattedString = false,
        keyboardType = null,
        maxLength = null,
        suffixMore = false,
        onSubmitted = null,
        isTime = false;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends BaseState<CustomTextField> {
  CustomTextFieldViewModel viewModel = CustomTextFieldViewModel();
  TextEditingController get controller => widget.controller ?? TextEditingController(text: widget.controllerText);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.setShowClearButton(controller.text != "");
      controller.addListener(() => viewModel.setShowClearButton(controller.text != ""));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => textFormField;

  Widget get textFormField => TextFieldTapRegion(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onTapInside: (event) {
          //select all
        },
        child: MouseRegion(
          // onExit: (PointerExitEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
          child: TextFormField(
            autofillHints: widget.keyboardType == TextInputType.emailAddress ? <String>[AutofillHints.email] : null,
            textInputAction: TextInputAction.next,
            autocorrect: true,
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            onTap: () async {
              if (widget.onDateChange != null) {
                widget.onDateChange!.call(await dialogManager.showDateTimePicker(initialDate: widget.controller?.text.toDateTimeDDMMYYYY()));
              }
              if (widget.onTap != null) {
                widget.onTap!();
              } else {
                //TODO Selection düzelt
                if (widget.readOnly != true) {
                  // if (controller.selection.affinity == TextAffinity.upstream) {
                  //   controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length, affinity: TextAffinity.downstream);
                  // } else {
                  //   controller.selection = TextSelection.collapsed(
                  //     offset: controller.text.length,
                  //   );
                  //   // controller.selection = controller.selection.copyWith(baseOffset: 0, extentOffset: controller.text.length);
                  // }
                }
              }
              // FocusScope.of(context).requestFocus(widget.focusNode);
            },
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            inputFormatters: widget.isFormattedString == true ? <TextInputFormatter>[TextFieldFormatterHelper.turkishFormatter] : widget.inputFormatter,
            // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            maxLength: widget.maxLength,
            validator: widget.validator ?? ((widget.enabled != false ? (widget.isMust ?? false) : false) ? validator : null),
            controller: controller,
            obscureText: widget.keyboardType == TextInputType.visiblePassword,
            readOnly: widget.readOnly ?? false,
            enableSuggestions: true,
            decoration: InputDecoration(
              enabled: widget.enabled ?? true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorStyle: const TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: UIHelper.primaryColor.withOpacity(0.7),
                  width: 2,
                ),
                borderRadius: UIHelper.midBorderRadius,
                gapPadding: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: UIHelper.highBorderRadius,
              ),
              // border: ,
              suffixIcon: widget.suffix != null || widget.isDateTime == true || widget.isTime == true || widget.suffixMore == true
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        if (widget.suffix != null) widget.suffix!,
                        Observer(
                          builder: (_) => Visibility(
                            visible: (viewModel.showClearButton) && (widget.isMust != true),
                            child: IconButton(
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                splashFactory: NoSplash.splashFactory,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                controller.clear();
                                widget.onClear!();
                                // viewModel.setShowClearButton(false);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ).yetkiVarMi(widget.onClear != null),
                        if (widget.isDateTime == true)
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: widget.onTap,
                            icon: const Icon(Icons.date_range_outlined),
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              splashFactory: NoSplash.splashFactory,
                            ),
                          ),
                        if (widget.isTime == true)
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: widget.onTap,
                            icon: const Icon(Icons.access_time_outlined),
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              splashFactory: NoSplash.splashFactory,
                            ),
                          ),
                        Observer(
                          builder: (_) => Visibility(
                            visible: ((!viewModel.showClearButton && widget.onClear != null) || widget.onClear == null) && widget.suffixMore == true,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: widget.onTap,
                              icon: const Icon(Icons.more_horiz_outlined),
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                splashFactory: NoSplash.splashFactory,
                              ),
                            ),
                          ),
                        ),
                      ].where((element) => element is! SizedBox).toList().nullCheckWithGeneric,
                    )
                  : null,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: (widget.labelText ?? "") + ((widget.valueWidget != null) ? " " : ""),
                          style: (widget.enabled != false ? (widget.isMust ?? false) : false)
                              ? const TextStyle(color: UIHelper.primaryColor)
                              : ((widget.controller?.text == "") ? TextStyle(color: ColorPalette.slateGray.withOpacity(0.6)) : TextStyle(color: ColorPalette.slateGray.withOpacity(0.8))),
                        ),
                        TextSpan(text: " ${widget.valueText ?? ""}", style: TextStyle(color: ColorPalette.slateGray.withOpacity(0.3), fontSize: 12)).yetkiVarMi(widget.valueText != null),
                        widget.descriptionWidget,
                      ].nullCheckWithGeneric,
                    ),
                    // style: const TextStyle(fontSize: 15),
                  ),
                  // if (widget.valueWidget != null) SizedBox(width: UIHelper.lowSize),
                  if (widget.valueWidget != null) Flexible(child: widget.valueWidget!),
                ],
              ).yetkiVarMi(widget.labelText != null),
            ),
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  String? validator(String? p0) {
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
