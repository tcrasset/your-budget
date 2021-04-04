// Flutter imports:
import 'package:flutter/material.dart';

Future<void> showOverlayNotification(BuildContext context, String text) async {
  final OverlayState overlayState = Overlay.of(context);
  final OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
          left: 150,
          top: 500,
          child: Container(
            width: 150.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey[700].withOpacity(0.5),
            ),
            child: Center(
                child: Text(text,
                    style:
                        const TextStyle(fontSize: 12.0, color: Colors.white))),
          )));

  overlayState.insert(overlayEntry);

  await Future.delayed(const Duration(seconds: 2));

  overlayEntry.remove();
}
