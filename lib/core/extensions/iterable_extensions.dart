extension IterableExtensions<T> on Iterable<T> {
  T get mostRepeatedValue {
    Map<T, int> groupedElements = {};

    for (var i = 0; i < length; i++) {
      final element = elementAt(i);

      groupedElements.update(
        element,
        (value) => value + 1,
        ifAbsent: () => 0,
      );
    }

    final result = groupedElements.entries
        .toList()
        .reduce(
          (elementA, elementB) =>
              elementA.value > elementB.value ? elementA : elementB,
        )
        .key;

    return result;
  }
}
