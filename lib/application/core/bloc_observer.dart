// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:bloc/bloc.dart';

// ignore_for_file: avoid_print

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('EVENT: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase base, Change change) {
    log(
      'CHANGE: ${base.runtimeType} ${change.currentState.runtimeType} --> ${change.nextState.runtimeType} ${change.nextState}',
    );
    super.onChange(base, change);
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   log(
  //     'TRANSITION: ${bloc.runtimeType} ${transition.currentState.runtimeType}  -->  ${transition.nextState.runtimeType}',
  //   );
  //   super.onTransition(bloc, transition);
  // }

  @override
  void onError(BlocBase base, Object error, StackTrace stackTrace) {
    log('${base.runtimeType} $error $stackTrace');
    super.onError(base, error, stackTrace);
  }
}

String getOnlyDifferences(Cubit cubit, Change change) {
  final String n = change.nextState.toString().replaceAll(RegExp(','), "\n");
  final String c = change.currentState.toString().replaceAll(RegExp(","), "\n");

  print("""

+++++++++++++++++++++++++++++++++
+    ${cubit.runtimeType}       +
+++++++++++++++++++++++++++++++++

#################################
#                               #
# ***********CURRENT*********** #
#                               #
#################################

$c

#################################
#                               #
# ***********NEXT*********** #
#                               #
#################################

$n

""");

  return "";
}
