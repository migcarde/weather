import 'package:hive/hive.dart';

extension HiveExtensions on HiveInterface {
  Future<Box<E>> getBox<E>(String box) async =>
      isBoxOpen(box) ? this.box<E>(box) : await openBox<E>(box);
}
