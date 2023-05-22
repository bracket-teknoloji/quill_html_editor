      
// an extension on Widgets to wrap with Mobx observer
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

extension MobxWidgetExtension on Widget {
  Widget observe(BuildContext context) {
    return Observer(builder: (context) => this);
  }
  // Widget get reaction {
  //   return reaction((_) => this, (_) => this);
  // }
  Widget get reactionBuilder{
    return ReactionBuilder(
      builder: (context) => reaction((_) => this, (_) => this),
      child: this,
    );
  }
}
