import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S, T> extends Cubit<S> {
  BaseCubit(S initialState, this._data) : super(initialState);

  T _data;

  T get data => _data;

  bool _isBusy = false;

  bool get isBusy => _isBusy;

  Future<void> run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process;
      _isBusy = false;
    }
  }
}
