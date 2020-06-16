// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WeatherData extends DataClass implements Insertable<WeatherData> {
  final int id;
  final DateTime date;
  final int temp;
  final String condition;
  WeatherData(
      {@required this.id,
      @required this.date,
      @required this.temp,
      @required this.condition});
  factory WeatherData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return WeatherData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      temp: intType.mapFromDatabaseResponse(data['${effectivePrefix}temp']),
      condition: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}condition']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || temp != null) {
      map['temp'] = Variable<int>(temp);
    }
    if (!nullToAbsent || condition != null) {
      map['condition'] = Variable<String>(condition);
    }
    return map;
  }

  WeatherCompanion toCompanion(bool nullToAbsent) {
    return WeatherCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      temp: temp == null && nullToAbsent ? const Value.absent() : Value(temp),
      condition: condition == null && nullToAbsent
          ? const Value.absent()
          : Value(condition),
    );
  }

  factory WeatherData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WeatherData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      temp: serializer.fromJson<int>(json['temp']),
      condition: serializer.fromJson<String>(json['condition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'temp': serializer.toJson<int>(temp),
      'condition': serializer.toJson<String>(condition),
    };
  }

  WeatherData copyWith({int id, DateTime date, int temp, String condition}) =>
      WeatherData(
        id: id ?? this.id,
        date: date ?? this.date,
        temp: temp ?? this.temp,
        condition: condition ?? this.condition,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('temp: $temp, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(date.hashCode, $mrjc(temp.hashCode, condition.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WeatherData &&
          other.id == this.id &&
          other.date == this.date &&
          other.temp == this.temp &&
          other.condition == this.condition);
}

class WeatherCompanion extends UpdateCompanion<WeatherData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> temp;
  final Value<String> condition;
  const WeatherCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.temp = const Value.absent(),
    this.condition = const Value.absent(),
  });
  WeatherCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required int temp,
    @required String condition,
  })  : date = Value(date),
        temp = Value(temp),
        condition = Value(condition);
  static Insertable<WeatherData> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> temp,
    Expression<String> condition,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (temp != null) 'temp': temp,
      if (condition != null) 'condition': condition,
    });
  }

  WeatherCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<int> temp,
      Value<String> condition}) {
    return WeatherCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      temp: temp ?? this.temp,
      condition: condition ?? this.condition,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (temp.present) {
      map['temp'] = Variable<int>(temp.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    return map;
  }
}

class $WeatherTable extends Weather with TableInfo<$WeatherTable, WeatherData> {
  final GeneratedDatabase _db;
  final String _alias;
  $WeatherTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  GeneratedIntColumn _temp;
  @override
  GeneratedIntColumn get temp => _temp ??= _constructTemp();
  GeneratedIntColumn _constructTemp() {
    return GeneratedIntColumn(
      'temp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _conditionMeta = const VerificationMeta('condition');
  GeneratedTextColumn _condition;
  @override
  GeneratedTextColumn get condition => _condition ??= _constructCondition();
  GeneratedTextColumn _constructCondition() {
    return GeneratedTextColumn(
      'condition',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, temp, condition];
  @override
  $WeatherTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'weather';
  @override
  final String actualTableName = 'weather';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp'], _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition'], _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WeatherData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WeatherTable createAlias(String alias) {
    return $WeatherTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WeatherTable _weather;
  $WeatherTable get weather => _weather ??= $WeatherTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [weather];
}
