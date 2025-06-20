import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TypingAnimation extends HookWidget {
  final String text;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration delay;
  final bool showCursor;
  final String cursor;
  final VoidCallback? onComplete;

  const TypingAnimation({
    super.key,
    required this.text,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.delay = Duration.zero,
    this.showCursor = true,
    this.cursor = '|',
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final displayedText = useState('');
    final showCursorState = useState(true);
    final isCompleted = useState(false);

    useEffect(() {
      Timer? typingTimer;
      Timer? cursorTimer;

      void startTyping() {
        int currentIndex = 0;

        typingTimer = Timer.periodic(typingSpeed, (timer) {
          if (currentIndex < text.length) {
            displayedText.value = text.substring(0, currentIndex + 1);
            currentIndex++;
          } else {
            timer.cancel();
            isCompleted.value = true;
            if (onComplete != null) onComplete!();
          }
        });
      }

      void startCursorBlinking() {
        if (showCursor) {
          cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (
            timer,
          ) {
            showCursorState.value = !showCursorState.value;
          });
        }
      }

      if (delay == Duration.zero) {
        startTyping();
        startCursorBlinking();
      } else {
        Future.delayed(delay, () {
          startTyping();
          startCursorBlinking();
        });
      }

      return () {
        typingTimer?.cancel();
        cursorTimer?.cancel();
      };
    }, []);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: displayedText.value,
            style: style ?? Theme.of(context).textTheme.bodyLarge,
          ),
          if (showCursor && (!isCompleted.value || showCursorState.value))
            TextSpan(
              text: cursor,
              style: (style ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
                color:
                    showCursorState.value
                        ? (style?.color ??
                            Theme.of(context).textTheme.bodyLarge?.color)
                        : Colors.transparent,
              ),
            ),
        ],
      ),
    );
  }
}