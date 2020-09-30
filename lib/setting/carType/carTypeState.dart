
import 'package:dolphins/entity/entity.dart';
import 'package:flutter/widgets.dart';

@immutable
class CarTypeState {
  final bool isCarTypeError;
  final Future<List<CarType>> carType;
  final bool isCarTypeLoading;
  CarTypeState({
    this.isCarTypeError,
    this.carType,
    this.isCarTypeLoading
  });

  factory CarTypeState.initial() => CarTypeState(
        isCarTypeLoading: false,
        isCarTypeError: false,
        carType: null,
      );

  CarTypeState copyWith({
    @required bool isRegisterLoading,
    @required bool isRegisterError,
    @required Future<List<CarType>> carType,
  }) {
    return CarTypeState(
      isCarTypeLoading: isRegisterLoading ?? this.isCarTypeLoading,
      isCarTypeError: isRegisterError ?? this.isCarTypeError,
      carType: carType ?? this.carType,
    );
  }
}
