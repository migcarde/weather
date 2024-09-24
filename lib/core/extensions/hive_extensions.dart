import 'package:hive/hive.dart';

extension HiveExtensions on HiveInterface {
  Future<Box<E>> getBox<E>(String box) async =>
      isBoxOpen(box) ? Hive.box<E>(box) : await Hive.openBox<E>(box);
}
