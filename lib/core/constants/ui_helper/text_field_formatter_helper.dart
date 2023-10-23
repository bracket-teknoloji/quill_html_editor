import "package:number_text_input_formatter/number_text_input_formatter.dart";

class TextFieldFormatterHelper {
  static NumberTextInputFormatter turkishFormatter = NumberTextInputFormatter(
    decimalSeparator: ",",
    groupSeparator: ".",
    groupDigits: 3,
    allowNegative: true,
    overrideDecimalPoint: true,
  );
}
