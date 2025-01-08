import "package:flutter/material.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../../base/state/base_state.dart";

final class LoginWaveWidget extends StatefulWidget {
  const LoginWaveWidget({super.key, this.foreoregroundColor});
  final Color? foreoregroundColor;

  @override
  State<LoginWaveWidget> createState() => _LoginWaveWidgetState();
}

final class _LoginWaveWidgetState extends BaseState<LoginWaveWidget> {
  @override
  Widget build(BuildContext context) => WaveWidget(
        config: CustomConfig(
          durations: [8000, 10000],
          heightPercentages: [0.78, 0.8],
          colors: [theme.colorScheme.surfaceContainerHighest, widget.foreoregroundColor ?? theme.colorScheme.surfaceContainer],
        ),
        size: Size.infinite,
        waveAmplitude: 2,
        wavePhase: 0,
        duration: 200,
        backgroundColor: theme.scaffoldBackgroundColor,
      );
}
