
import 'package:dolphins/entity/entity.dart';
import 'package:flutter/widgets.dart';

@immutable
class WashTypeState {
  final bool isWashTypeError;
  final Future<List<WashType>> washType;
  final bool isWashTypeLoading;
  WashTypeState({
    this.isWashTypeError,
    this.washType,
    this.isWashTypeLoading
  });

  factory WashTypeState.initial() => WashTypeState(
        isWashTypeError: false,
        isWashTypeLoading: false,
        washType: null,
      );

  WashTypeState copyWith({
    @required bool isWashTypeLoading,
    @required bool isWashTypeError,
    @required Future<List<WashType>> washType,
  }) {
    return WashTypeState(
      isWashTypeLoading: isWashTypeLoading ?? this.isWashTypeLoading,
      isWashTypeError: isWashTypeError ?? this.isWashTypeError,
      washType: washType ?? this.washType,
    );
  }
}
