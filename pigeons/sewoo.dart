import "package:pigeon/pigeon.dart";

@ConfigurePigeon(
  PigeonOptions(
    kotlinOptions: KotlinOptions(package: "com.bracket25.sewoo"),
    swiftOptions: SwiftOptions(fileSpecificClassNameComponent: "Sewoo"),
    dartOptions: DartOptions(),
    dartOut: "lib/src/sewoo.dart",
    swiftOut: "ios/Runner/Sewoo.generated.swift",
    kotlinOut: "android/app/src/main/kotlin/com/bracket23/picker/Sewoo.kt",
  ),
)
/// Sewoo is a Bluetooth printer
@HostApi()
abstract class Sewoo {
  @async
  bool printText(String text);

  @async
  bool printImage(List<int> image);

}
