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
  static const VerificationMeta _storageroomMeta = const VerificationMeta(
    'storageroom',
  );
  @override
  late final GeneratedColumn<String> storageroom = GeneratedColumn<String>(
    'storageroom',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    storageroom,
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
    if (data.containsKey('storageroom')) {
      context.handle(
        _storageroomMeta,
        storageroom.isAcceptableOrUnknown(
          data['storageroom']!,
          _storageroomMeta,
        ),
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
      storageroom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storageroom'],
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
  final String? storageroom;
  const PartsListData({
    required this.id,
    required this.title,
    this.partnumber,
    this.discription,
    required this.number,
    this.price,
    this.storageroom,
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
    if (!nullToAbsent || storageroom != null) {
      map['storageroom'] = Variable<String>(storageroom);
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
      storageroom: storageroom == null && nullToAbsent
          ? const Value.absent()
          : Value(storageroom),
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
      storageroom: serializer.fromJson<String?>(json['storageroom']),
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
      'storageroom': serializer.toJson<String?>(storageroom),
    };
  }

  PartsListData copyWith({
    int? id,
    String? title,
    Value<String?> partnumber = const Value.absent(),
    Value<String?> discription = const Value.absent(),
    int? number,
    Value<int?> price = const Value.absent(),
    Value<String?> storageroom = const Value.absent(),
  }) => PartsListData(
    id: id ?? this.id,
    title: title ?? this.title,
    partnumber: partnumber.present ? partnumber.value : this.partnumber,
    discription: discription.present ? discription.value : this.discription,
    number: number ?? this.number,
    price: price.present ? price.value : this.price,
    storageroom: storageroom.present ? storageroom.value : this.storageroom,
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
      storageroom: data.storageroom.present
          ? data.storageroom.value
          : this.storageroom,
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
          ..write('price: $price, ')
          ..write('storageroom: $storageroom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    partnumber,
    discription,
    number,
    price,
    storageroom,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartsListData &&
          other.id == this.id &&
          other.title == this.title &&
          other.partnumber == this.partnumber &&
          other.discription == this.discription &&
          other.number == this.number &&
          other.price == this.price &&
          other.storageroom == this.storageroom);
}

class PartsListCompanion extends UpdateCompanion<PartsListData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> partnumber;
  final Value<String?> discription;
  final Value<int> number;
  final Value<int?> price;
  final Value<String?> storageroom;
  const PartsListCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.partnumber = const Value.absent(),
    this.discription = const Value.absent(),
    this.number = const Value.absent(),
    this.price = const Value.absent(),
    this.storageroom = const Value.absent(),
  });
  PartsListCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.partnumber = const Value.absent(),
    this.discription = const Value.absent(),
    this.number = const Value.absent(),
    this.price = const Value.absent(),
    this.storageroom = const Value.absent(),
  }) : title = Value(title);
  static Insertable<PartsListData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? partnumber,
    Expression<String>? discription,
    Expression<int>? number,
    Expression<int>? price,
    Expression<String>? storageroom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (partnumber != null) 'partnumber': partnumber,
      if (discription != null) 'discription': discription,
      if (number != null) 'number': number,
      if (price != null) 'price': price,
      if (storageroom != null) 'storageroom': storageroom,
    });
  }

  PartsListCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? partnumber,
    Value<String?>? discription,
    Value<int>? number,
    Value<int?>? price,
    Value<String?>? storageroom,
  }) {
    return PartsListCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      partnumber: partnumber ?? this.partnumber,
      discription: discription ?? this.discription,
      number: number ?? this.number,
      price: price ?? this.price,
      storageroom: storageroom ?? this.storageroom,
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
    if (storageroom.present) {
      map['storageroom'] = Variable<String>(storageroom.value);
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
          ..write('price: $price, ')
          ..write('storageroom: $storageroom')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PartsListTable partsList = $PartsListTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [partsList];
}

typedef $$PartsListTableCreateCompanionBuilder =
    PartsListCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> partnumber,
      Value<String?> discription,
      Value<int> number,
      Value<int?> price,
      Value<String?> storageroom,
    });
typedef $$PartsListTableUpdateCompanionBuilder =
    PartsListCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> partnumber,
      Value<String?> discription,
      Value<int> number,
      Value<int?> price,
      Value<String?> storageroom,
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

  ColumnFilters<String> get storageroom => $composableBuilder(
    column: $table.storageroom,
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

  ColumnOrderings<String> get storageroom => $composableBuilder(
    column: $table.storageroom,
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

  GeneratedColumn<String> get storageroom => $composableBuilder(
    column: $table.storageroom,
    builder: (column) => column,
  );
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
                Value<String?> storageroom = const Value.absent(),
              }) => PartsListCompanion(
                id: id,
                title: title,
                partnumber: partnumber,
                discription: discription,
                number: number,
                price: price,
                storageroom: storageroom,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> partnumber = const Value.absent(),
                Value<String?> discription = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int?> price = const Value.absent(),
                Value<String?> storageroom = const Value.absent(),
              }) => PartsListCompanion.insert(
                id: id,
                title: title,
                partnumber: partnumber,
                discription: discription,
                number: number,
                price: price,
                storageroom: storageroom,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PartsListTableTableManager get partsList =>
      $$PartsListTableTableManager(_db, _db.partsList);
}
