import 'package:moor_flutter/moor_flutter.dart';

class Weather extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get temp => integer()();
  TextColumn get condition => text()();
}