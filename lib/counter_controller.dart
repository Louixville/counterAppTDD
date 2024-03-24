import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_controller.g.dart';

@Riverpod(keepAlive: true)
class CounterController extends _$CounterController {
  @override
  int build() => 0;

  void increment() => state++;

  void decrement() => state--;
}
