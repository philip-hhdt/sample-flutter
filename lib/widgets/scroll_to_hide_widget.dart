import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:sample/constants/sizing.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget(
      {super.key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200)});

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    // print(widget.controller.position.atEdge);

    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }

    if (widget.controller.position.pixels ==
        widget.controller.position.maxScrollExtent) {
      show();
    }

    /* if (widget.controller.position.maxScrollExtent == 0.0) {
      show();
    } else {
      print('called');
      if (direction == ScrollDirection.forward) {
        show();
      } else if (direction == ScrollDirection.reverse) {
        hide();
      }
    } */
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight + 20 : 0,
      child: Visibility(
        visible: isVisible,
        child: Wrap(
          children: [
            widget.child,
          ],
        ),
      ));
}
