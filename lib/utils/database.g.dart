// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PartsListTable extends PartsList
    with TableInfo<$PartsListTable, PartsListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartsListTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partnumberMeta = const VerificationMeta(
    'partnumber',
  );
  @override
  late final GeneratedColumn<String> partnumber = GeneratedColumn<String>(
    'partnumber',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discriptionMeta = const VerificationMeta(
    'discription',
  );
  @override
  late final GeneratedColumn<String> discription = GeneratedColumn<String>(
    'discription',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    partnumber,
    discription,
    number,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parts_list';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartsListData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('partnumber')) {
      context.handle(
        _partnumberMeta,
        partnumber.isAcceptableOrUnknown(data['partnumber']!, _partnumberMeta),
      );
    }
    if (data.containsKey('discription')) {
      context.handle(
        _discriptionMeta,
        discription.isAcceptableOrUnknown(
          data['discription']!,
          _discriptionMeta,
        ),
      );
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PartsListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartsListData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      partnumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}partnumber'],
      ),
      discription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discription'],
      ),
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      ),
    );
  }

  @override
  $PartsListTable createAlias(String alias) {
    return $PartsListTable(attachedDatabase, alias);
  }
}

class PartsListData extends DataClass implements Insertable<PartsListData> {
  final int id;
  final String title;
  final String? partnumber;
  final String? discription;
  final int number;
  final int? price;
  const PartsListData({
    required this.id,
    required this.title,
    this.partnumber,
    this.discription,
    required this.number,
    this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || partnumber != null) {
      map['partnumber'] = Variable<String>(partnumber);
    }
    if (!nullToAbsent || discription != null) {
      map['discription'] = Variable<String>(discription);
    }
    map['number'] = Variable<int>(number);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    return map;
  }

  PartsListCompanion toCompanion(bool nullToAbsent) {
    return PartsListCompanion(
      id: Value(id),
      title: Value(title),
      partnumber: partnumber == null && nullToAbsent
          ? const Value.absent()
          : Value(partnumber),
      discription: discription == null && nullToAbsent
          ? const Value.absent()
          : Value(discription),
      number: Value(number),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
    );
  }

  factory PartsListData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartsListData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      partnumber: serializer.fromJson<String?>(json['partnumber']),
      discription: serializer.fromJson<String?>(json['discription']),
      number: serializer.fromJson<int>(json['number']),
      price: serializer.fromJson<int?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'partnumber': serializer.toJson<String?>(partnumber),
      'discription': serializer.toJson<String?>(discription),
      'number': serializer.toJson<int>(number),
      'price': serializer.toJson<int?>(price),
    };
  }

  PartsListData copyWith({
    int? id,
    String? title,
    Value<String?> partnumber = const Value.absent(),
    Value<String?> discription = const Value.absent(),
    int? number,
    Value<int?> price = const Value.absent(),
  }) => PartsListData(
    id: id ?? this.id,
    title: title ?? this.title,
    partnumber: partnumber.present ? partnumber.value : this.partnumber,
    discription: discription.present ? discription.value : this.discription,
    number: number ?? this.number,
    price: price.present ? price.value : this.price,
  );
  PartsListData copyWithCompanion(PartsListCompanion data) {
    return PartsListData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      partnumber: data.partnumber.present
          ? data.partnumber.value
          : this.partnumber,
      discription: data.discription.present
          ? data.discription.value
          : this.discription,
      number: data.number.present ? data.number.value : this.number,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartsListData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('partnumber: $partnumber, ')
          ..write('discription: $discription, ')
          ..write('number: $number, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, partnumber, discription, number, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartsListData &&
          other.id == this.id &&
          other.title == this.title &&
          other.partnumber == this.partnumber &&
          other.discription == this.discription &&
          other.number == this.number &&
          other.price == this.price);
}

class PartsListCompanion extends UpdateCompanion<PartsListData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> partnumber;
  final Value<String?> discription;
  final Value<int> number;
  final Value<int?> price;
  const PartsListCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.partnumber = const Value.absent(),
    this.discription = const Value.absent(),
    this.number = const Value.absent(),
    this.price = const Value.absent(),
  });
  PartsListCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.partnumber = const Value.absent(),
    this.discription = const Value.absent(),
    this.number = const Value.absent(),
    this.price = const Value.absent(),
  }) : title = Value(title);
  static Insertable<PartsListData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? partnumber,
    Expression<String>? discription,
    Expression<int>? number,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (partnumber != null) 'partnumber': partnumber,
      if (discription != null) 'discription': discription,
      if (number != null) 'number': number,
      if (price != null) 'price': price,
    });
  }

  PartsListCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? partnumber,
    Value<String?>? discription,
    Value<int>? number,
    Value<int?>? price,
  }) {
    return PartsListCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      partnumber: partnumber ?? this.partnumber,
      discription: discription ?? this.discription,
      number: number ?? this.number,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (partnumber.present) {
      map['partnumber'] = Variable<String>(partnumber.value);
    }
    if (discription.present) {
      map['discription'] = Variable<String>(discription.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartsListCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('partnumber: $partnumber, ')
          ..write('discription: $discription, ')
          ..write('number: $number, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $StorageRoomsTable extends StorageRooms
    with TableInfo<$StorageRoomsTable, StorageRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageRoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _partIdMeta = const VerificationMeta('partId');
  @override
  late final GeneratedColumn<int> partId = GeneratedColumn<int>(
    'part_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomNameMeta = const VerificationMeta(
    'roomName',
  );
  @override
  late final GeneratedColumn<String> roomName = GeneratedColumn<String>(
    'room_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, partId, roomName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageRoom> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('part_id')) {
      context.handle(
        _partIdMeta,
        partId.isAcceptableOrUnknown(data['part_id']!, _partIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partIdMeta);
    }
    if (data.containsKey('room_name')) {
      context.handle(
        _roomNameMeta,
        roomName.isAcceptableOrUnknown(data['room_name']!, _roomNameMeta),
      );
    } else if (isInserting) {
      context.missing(_roomNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageRoom(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      partId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}part_id'],
      )!,
      roomName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_name'],
      )!,
    );
  }

  @override
  $StorageRoomsTable createAlias(String alias) {
    return $StorageRoomsTable(attachedDatabase, alias);
  }
}

class StorageRoom extends DataClass implements Insertable<StorageRoom> {
  final int id;
  final int partId;
  final String roomName;
  const StorageRoom({
    required this.id,
    required this.partId,
    required this.roomName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['part_id'] = Variable<int>(partId);
    map['room_name'] = Variable<String>(roomName);
    return map;
  }

  StorageRoomsCompanion toCompanion(bool nullToAbsent) {
    return StorageRoomsCompanion(
      id: Value(id),
      partId: Value(partId),
      roomName: Value(roomName),
    );
  }

  factory StorageRoom.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageRoom(
      id: serializer.fromJson<int>(json['id']),
      partId: serializer.fromJson<int>(json['partId']),
      roomName: serializer.fromJson<String>(json['roomName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'partId': serializer.toJson<int>(partId),
      'roomName': serializer.toJson<String>(roomName),
    };
  }

  StorageRoom copyWith({int? id, int? partId, String? roomName}) => StorageRoom(
    id: id ?? this.id,
    partId: partId ?? this.partId,
    roomName: roomName ?? this.roomName,
  );
  StorageRoom copyWithCompanion(StorageRoomsCompanion data) {
    return StorageRoom(
      id: data.id.present ? data.id.value : this.id,
      partId: data.partId.present ? data.partId.value : this.partId,
      roomName: data.roomName.present ? data.roomName.value : this.roomName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageRoom(')
          ..write('id: $id, ')
          ..write('partId: $partId, ')
          ..write('roomName: $roomName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, partId, roomName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageRoom &&
          other.id == this.id &&
          other.partId == this.partId &&
          other.roomName == this.roomName);
}

class StorageRoomsCompanion extends UpdateCompanion<StorageRoom> {
  final Value<int> id;
  final Value<int> partId;
  final Value<String> roomName;
  const StorageRoomsCompanion({
    this.id = const Value.absent(),
    this.partId = const Value.absent(),
    this.roomName = const Value.absent(),
  });
  StorageRoomsCompanion.insert({
    this.id = const Value.absent(),
    required int partId,
    required String roomName,
  }) : partId = Value(partId),
       roomName = Value(roomName);
  static Insertable<StorageRoom> custom({
    Expression<int>? id,
    Expression<int>? partId,
    Expression<String>? roomName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (partId != null) 'part_id': partId,
      if (roomName != null) 'room_name': roomName,
    });
  }

  StorageRoomsCompanion copyWith({
    Value<int>? id,
    Value<int>? partId,
    Value<String>? roomName,
  }) {
    return StorageRoomsCompanion(
      id: id ?? this.id,
      partId: partId ?? this.partId,
      roomName: roomName ?? this.roomName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (partId.present) {
      map['part_id'] = Variable<int>(partId.value);
    }
    if (roomName.present) {
      map['room_name'] = Variable<String>(roomName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageRoomsCompanion(')
          ..write('id: $id, ')
          ..write('partId: $partId, ')
          ..write('roomName: $roomName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PartsListTable partsList = $PartsListTable(this);
  late final $StorageRoomsTable storageRooms = $StorageRoomsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [partsList, storageRooms];
}

typedef $$PartsListTableCreateCompanionBuilder =
    PartsListCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> partnumber,
      Value<String?> discription,
      Value<int> number,
      Value<int?> price,
    });
typedef $$PartsListTableUpdateCompanionBuilder =
    PartsListCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> partnumber,
      Value<String?> discription,
      Value<int> number,
      Value<int?> price,
    });

class $$PartsListTableFilterComposer
    extends Composer<_$AppDatabase, $PartsListTable> {
  $$PartsListTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partnumber => $composableBuilder(
    column: $table.partnumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get discription => $composableBuilder(
    column: $table.discription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartsListTableOrderingComposer
    extends Composer<_$AppDatabase, $PartsListTable> {
  $$PartsListTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partnumber => $composableBuilder(
    column: $table.partnumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get discription => $composableBuilder(
    column: $table.discription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartsListTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartsListTable> {
  $$PartsListTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get partnumber => $composableBuilder(
    column: $table.partnumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get discription => $composableBuilder(
    column: $table.discription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$PartsListTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartsListTable,
          PartsListData,
          $$PartsListTableFilterComposer,
          $$PartsListTableOrderingComposer,
          $$PartsListTableAnnotationComposer,
          $$PartsListTableCreateCompanionBuilder,
          $$PartsListTableUpdateCompanionBuilder,
          (
            PartsListData,
            BaseReferences<_$AppDatabase, $PartsListTable, PartsListData>,
          ),
          PartsListData,
          PrefetchHooks Function()
        > {
  $$PartsListTableTableManager(_$AppDatabase db, $PartsListTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartsListTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartsListTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartsListTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> partnumber = const Value.absent(),
                Value<String?> discription = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int?> price = const Value.absent(),
              }) => PartsListCompanion(
                id: id,
                title: title,
                partnumber: partnumber,
                discription: discription,
                number: number,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> partnumber = const Value.absent(),
                Value<String?> discription = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int?> price = const Value.absent(),
              }) => PartsListCompanion.insert(
                id: id,
                title: title,
                partnumber: partnumber,
                discription: discription,
                number: number,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PartsListTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartsListTable,
      PartsListData,
      $$PartsListTableFilterComposer,
      $$PartsListTableOrderingComposer,
      $$PartsListTableAnnotationComposer,
      $$PartsListTableCreateCompanionBuilder,
      $$PartsListTableUpdateCompanionBuilder,
      (
        PartsListData,
        BaseReferences<_$AppDatabase, $PartsListTable, PartsListData>,
      ),
      PartsListData,
      PrefetchHooks Function()
    >;
typedef $$StorageRoomsTableCreateCompanionBuilder =
    StorageRoomsCompanion Function({
      Value<int> id,
      required int partId,
      required String roomName,
    });
typedef $$StorageRoomsTableUpdateCompanionBuilder =
    StorageRoomsCompanion Function({
      Value<int> id,
      Value<int> partId,
      Value<String> roomName,
    });

class $$StorageRoomsTableFilterComposer
    extends Composer<_$AppDatabase, $StorageRoomsTable> {
  $$StorageRoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get partId => $composableBuilder(
    column: $table.partId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomName => $composableBuilder(
    column: $table.roomName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StorageRoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageRoomsTable> {
  $$StorageRoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get partId => $composableBuilder(
    column: $table.partId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomName => $composableBuilder(
    column: $table.roomName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StorageRoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageRoomsTable> {
  $$StorageRoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get partId =>
      $composableBuilder(column: $table.partId, builder: (column) => column);

  GeneratedColumn<String> get roomName =>
      $composableBuilder(column: $table.roomName, builder: (column) => column);
}

class $$StorageRoomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StorageRoomsTable,
          StorageRoom,
          $$StorageRoomsTableFilterComposer,
          $$StorageRoomsTableOrderingComposer,
          $$StorageRoomsTableAnnotationComposer,
          $$StorageRoomsTableCreateCompanionBuilder,
          $$StorageRoomsTableUpdateCompanionBuilder,
          (
            StorageRoom,
            BaseReferences<_$AppDatabase, $StorageRoomsTable, StorageRoom>,
          ),
          StorageRoom,
          PrefetchHooks Function()
        > {
  $$StorageRoomsTableTableManager(_$AppDatabase db, $StorageRoomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageRoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageRoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageRoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> partId = const Value.absent(),
                Value<String> roomName = const Value.absent(),
              }) => StorageRoomsCompanion(
                id: id,
                partId: partId,
                roomName: roomName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int partId,
                required String roomName,
              }) => StorageRoomsCompanion.insert(
                id: id,
                partId: partId,
                roomName: roomName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StorageRoomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StorageRoomsTable,
      StorageRoom,
      $$StorageRoomsTableFilterComposer,
      $$StorageRoomsTableOrderingComposer,
      $$StorageRoomsTableAnnotationComposer,
      $$StorageRoomsTableCreateCompanionBuilder,
      $$StorageRoomsTableUpdateCompanionBuilder,
      (
        StorageRoom,
        BaseReferences<_$AppDatabase, $StorageRoomsTable, StorageRoom>,
      ),
      StorageRoom,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PartsListTableTableManager get partsList =>
      $$PartsListTableTableManager(_db, _db.partsList);
  $$StorageRoomsTableTableManager get storageRooms =>
      $$StorageRoomsTableTableManager(_db, _db.storageRooms);
}
