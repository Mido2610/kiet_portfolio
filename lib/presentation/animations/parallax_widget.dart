import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ParallaxWidget extends HookWidget {
  final Widget child;
  final double speed;
  final ScrollController? scrollController;
  final Axis direction;

  const ParallaxWidget({
    super.key,
    required this.child,
    this.scrollController,
    this.speed = 0.5,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final offset = useState(0.0);
    final controller = scrollController ?? useScrollController();

    useEffect(() {
      void updateOffset() {
        if (controller.hasClients) {
          offset.value = controller.offset * speed;
        }
      }

      controller.addListener(updateOffset);
      return () => controller.removeListener(updateOffset);
    }, [controller]);

    return Transform.translate(
      offset:
          direction == Axis.vertical
              ? Offset(0, -offset.value)
              : Offset(-offset.value, 0),
      child: child,
    );
  }
}