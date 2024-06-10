import 'package:isar/isar.dart';

part 'metadata.g.dart';

@collection
class Metadata {
  Id id = Isar.autoIncrement;
  DateTime? lastUpdated;
}