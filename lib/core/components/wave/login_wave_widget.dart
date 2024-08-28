import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

class LoginWaveWidget extends StatefulWidget {
  final Color? foreoregroundColor;
  const LoginWaveWidget({super.key, this.foreoregroundColor});

  @override
  State<LoginWaveWidget> createState() => _LoginWaveWidgetState();
}

class _LoginWaveWidgetState extends BaseState<LoginWaveWidget> {
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
