import 'package:counterapptdd/counter_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import './mocks.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(overrides: []);
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() => registerFallbackValue(const AsyncLoading<int>()));

  group('CounterController group', () {
    test(
      'when value is default then state should 0',
      () {
        final container = makeProviderContainer();
        final listener = Listener<int>();
        container.listen(
          counterControllerProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(() => listener(null, 0));
        verifyNoMoreInteractions(listener);
      },
    );

    test(
      'when value is incremented then state should be 1',
      () {
        final container = makeProviderContainer();
        final listener = Listener<int>();
        container.listen(
          counterControllerProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(() => listener(null, 0));
        final controller = container.read(counterControllerProvider.notifier);
        controller.increment();
        verify(() => listener(0, 1));
        verifyNoMoreInteractions(listener);
      },
    );

    test(
      'when value is decremented then state should be -1',
      () {
        final container = makeProviderContainer();
        final listener = Listener<int>();
        container.listen(
          counterControllerProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(() => listener(null, 0));
        final controller = container.read(counterControllerProvider.notifier);
        controller.decrement();
        verify(() => listener(0, -1));
        verifyNoMoreInteractions(listener);
      },
    );

    test(
      'when value is incremented twice then state should be 2',
      () {
        final container = makeProviderContainer();
        final listener = Listener<int>();
        container.listen(
          counterControllerProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(() => listener(null, 0));
        final controller = container.read(counterControllerProvider.notifier);
        controller.increment();
        controller.increment();
        verifyInOrder([
          () => listener(0, 1),
          () => listener(1, 2),
        ]);
        verifyNoMoreInteractions(listener);
      },
    );

    test(
      'when value is decremented twice then state should be -2',
      () {
        final container = makeProviderContainer();
        final listener = Listener<int>();
        container.listen(
          counterControllerProvider,
          listener.call,
          fireImmediately: true,
        );
        verify(() => listener(null, 0));
        final controller = container.read(counterControllerProvider.notifier);
        controller.decrement();
        controller.decrement();
        verifyInOrder([
          () => listener(0, -1),
          () => listener(-1, -2),
        ]);
        verifyNoMoreInteractions(listener);
      },
    );
  });

  test(
    'when value is incremented twice and decremented then state should be 1',
    () {
      final container = makeProviderContainer();
      final listener = Listener<int>();
      container.listen(
        counterControllerProvider,
        listener.call,
        fireImmediately: true,
      );
      verify(() => listener(null, 0));
      final controller = container.read(counterControllerProvider.notifier);
      controller.increment();
      controller.increment();
      controller.decrement();
      verifyInOrder([
        () => listener(0, 1),
        () => listener(1, 2),
        () => listener(2, 1),
      ]);
      verifyNoMoreInteractions(listener);
    },
  );
}
