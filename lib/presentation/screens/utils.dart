import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (Stream<E> events, Stream<E> Function(E) mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}
