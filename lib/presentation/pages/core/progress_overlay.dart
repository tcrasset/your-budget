// Flutter imports:
import 'package:flutter/material.dart';

class InProgressOverlay extends StatelessWidget {
  final bool showOverlay;
  final String textDisplayed;

  const InProgressOverlay({
    Key? key,
    required this.showOverlay,
    required this.textDisplayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !showOverlay,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: showOverlay ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: showOverlay,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                textDisplayed,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
