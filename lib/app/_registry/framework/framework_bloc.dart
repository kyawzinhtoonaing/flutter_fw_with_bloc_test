import 'package:rxdart/rxdart.dart';

abstract class AbstractBloc {
  // Method to release resources.
  void dispose();
}

abstract class AbstractBlocStore {
  // Method to release resources.
  void dispose();
}

//abstract class AbstractEvent {}

class BlocState<T> {
  late final BehaviorSubject<T> _stateSink;

  // Getter of _stateSink's value stream
  ValueStream<T> get stream => _stateSink.stream;

  // Getter of _state
  T get state => stream.value;

  // Setter to update the state in _stateSink.
  void update(T newState) {
    _stateSink.add(newState);
  }

  BlocState(T initSeed) {
    _stateSink = BehaviorSubject<T>.seeded(initSeed);
  }

  void dispose() {
    _stateSink.close();
  }
}