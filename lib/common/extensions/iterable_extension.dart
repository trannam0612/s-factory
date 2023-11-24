extension IterableExtension<E> on Iterable<E> {
  bool get isNullOrEmpty => this == null || isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  E? firstOrDefault([bool Function(E element)? func]) {
    if (func == null) {
      final it = iterator;
      if (!it.moveNext()) {
        return null;
      }
      return it.current;
    }
    for (var element in this) {
      if (func(element)) return element;
    }
    return null;
  }

  E? lastOrDefault([bool Function(E element)? func]) {
    if (func == null) {
      if (isNotNullOrEmpty) return last;
      return null;
    }
    E? result;
    var foundMatching = false;
    for (final element in this) {
      if (func(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }

  dynamic foldLeft(dynamic val, func) {
    forEach((entry) => val = func(val, entry));
    return val;
  }
}

// extension ListExtension<E> on List<E> {
//   bool replace(bool Function(E element) func, E Function(E element) byElement) {
//     final replaceElement = firstWhere(func, orElse: () => null);
//     if (replaceElement != null) {
//       final index = indexOf(replaceElement);
//       replaceRange(index, index + 1, [byElement(replaceElement)]);

//       return true;
//     }

//     return false;
//   }
// }
