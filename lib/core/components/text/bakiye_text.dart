import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class BakiyeText extends StatelessWidget {
  final double? value;
  const BakiyeText({super.key, this.value});

  @override
  Widget build(BuildContext context) => Text(
        "Bakiye: ${value?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} (${(value ?? 0) < 0 ? "Ödenecek" : "Tahsil Edilecek"})",
        style: TextStyle(
          color: UIHelper.getColorWithValue(value ?? 0),
        ),
      ).paddingAll(UIHelper.lowSize);
}
