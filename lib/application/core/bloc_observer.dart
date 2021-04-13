// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:bloc/bloc.dart';

// ignore_for_file: avoid_print

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    log('EVENT: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    log(
      'CHANGE: ${cubit.runtimeType} ${change.currentState.runtimeType} --> ${change.nextState.runtimeType} ${change.nextState}',
    );
    super.onChange(cubit, change);
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   log(
  //     'TRANSITION: ${bloc.runtimeType} ${transition.currentState.runtimeType}  -->  ${transition.nextState.runtimeType}',
  //   );
  //   super.onTransition(bloc, transition);
  // }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    log('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
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
