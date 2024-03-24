import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './counter_controller.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Current emitted value:'),
              const SizedBox(
                width: 20.0,
              ),
              Text('$state'),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () =>
                    ref.read(counterControllerProvider.notifier).increment(),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 20.0),
              IconButton(
                onPressed: () =>
                    ref.read(counterControllerProvider.notifier).decrement(),
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
