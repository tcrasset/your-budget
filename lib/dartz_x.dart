import 'package:dartz/dartz.dart';

extension FutureEither<L, R> on Future<Either<L, R>> {
  Future<Either<L, R2>> flatMap<R2>(Function1<R, Future<Either<L, R2>>> f) {
    return then(
      (either1) => either1.fold(
        (l) => Future.value(left<L, R2>(l)),
        f,
      ),
    );
  }

  Future<Either<L, R2>> andThen<R2>(Future<Either<L, R2>> next) {
    return then(
      (either1) => either1.fold(
        (l) => Future.value(left<L, R2>(l)),
        (_) => next,
      ),
    );
  }

  Future<Either<L, R2>> map<R2>(Function1<R, Either<L, R2>> f) {
    return then(
      (either1) => either1.fold(
        (l) => Future.value(left<L, R2>(l)),
        (r) => Future.value(f(r)),
      ),
    );
  }

  Future<Either<L2, R>> leftMap<L2>(Function1<L, L2> f) {
    return then(
      (either1) => either1.fold(
        (l) => Future.value(left(f(l))),
        (r) => Future.value(right<L2, R>(r)),
      ),
    );
  }
}
