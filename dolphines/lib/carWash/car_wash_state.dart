import 'package:dolphins/entity/entity.dart';
import 'package:meta/meta.dart';


@immutable
class CarWashState {
  final bool isCarWashError;
  final Future<List<CarWash>> carWash;
  final bool isCarWashLoading;
  CarWashState({
    this.isCarWashError,
    this.carWash,
    this.isCarWashLoading
  });

  factory CarWashState.initial() => CarWashState(
        isCarWashLoading: false,
        isCarWashError: false,
        carWash: null,
      );

  CarWashState copyWith({
    @required bool isCarWashLoading,
    @required bool isCarWashError,
    @required Future<List<CarWash>> carWash,
  }) {
    return CarWashState(
      isCarWashLoading: isCarWashLoading ?? this.isCarWashLoading,
      isCarWashError: isCarWashError ?? this.isCarWashError,
      carWash: carWash ?? this.carWash,
    );
  }
}
