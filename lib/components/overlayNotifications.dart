import 'package:flutter/material.dart';

showOverlayNotification(BuildContext context, String text) async {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
          left: 150,
          top: 500,
          child: Container(
            width: 150.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey[700].withOpacity(0.5),
            ),
            child: Center(
                child: Text(text,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))),
          )));

  overlayState.insert(overlayEntry);

  await Future.delayed(Duration(seconds: 2));

  overlayEntry.remove();
}
