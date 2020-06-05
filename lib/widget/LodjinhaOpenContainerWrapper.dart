import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class LodjinhaOpenContainerWrapper extends StatelessWidget {
  const LodjinhaOpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.containerWhrapper,
    this.onClosed,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;
  final Widget containerWhrapper;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return containerWhrapper;
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
