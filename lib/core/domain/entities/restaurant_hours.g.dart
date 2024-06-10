// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_hours.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantHoursCollection on Isar {
  IsarCollection<RestaurantHours> get restaurantHours => this.collection();
}

const RestaurantHoursSchema = CollectionSchema(
  name: r'RestaurantHours',
  id: 2520368888732773867,
  properties: {
    r'closingTime': PropertySchema(
      id: 0,
      name: r'closingTime',
      type: IsarType.string,
    ),
    r'dayOfWeek': PropertySchema(
      id: 1,
      name: r'dayOfWeek',
      type: IsarType.string,
    ),
    r'documentId': PropertySchema(
      id: 2,
      name: r'documentId',
      type: IsarType.string,
    ),
    r'openingTime': PropertySchema(
      id: 3,
      name: r'openingTime',
      type: IsarType.string,
    ),
    r'restaurantId': PropertySchema(
      id: 4,
      name: r'restaurantId',
      type: IsarType.string,
    )
  },
  estimateSize: _restaurantHoursEstimateSize,
  serialize: _restaurantHoursSerialize,
  deserialize: _restaurantHoursDeserialize,
  deserializeProp: _restaurantHoursDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _restaurantHoursGetId,
  getLinks: _restaurantHoursGetLinks,
  attach: _restaurantHoursAttach,
  version: '3.1.0+1',
);

int _restaurantHoursEstimateSize(
  RestaurantHours object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.closingTime.length * 3;
  bytesCount += 3 + object.dayOfWeek.length * 3;
  bytesCount += 3 + object.documentId.length * 3;
  bytesCount += 3 + object.openingTime.length * 3;
  bytesCount += 3 + object.restaurantId.length * 3;
  return bytesCount;
}

void _restaurantHoursSerialize(
  RestaurantHours object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.closingTime);
  writer.writeString(offsets[1], object.dayOfWeek);
  writer.writeString(offsets[2], object.documentId);
  writer.writeString(offsets[3], object.openingTime);
  writer.writeString(offsets[4], object.restaurantId);
}

RestaurantHours _restaurantHoursDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantHours(
    closingTime: reader.readString(offsets[0]),
    dayOfWeek: reader.readString(offsets[1]),
    documentId: reader.readString(offsets[2]),
    openingTime: reader.readString(offsets[3]),
    restaurantId: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _restaurantHoursDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _restaurantHoursGetId(RestaurantHours object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantHoursGetLinks(RestaurantHours object) {
  return [];
}

void _restaurantHoursAttach(
    IsarCollection<dynamic> col, Id id, RestaurantHours object) {
  object.id = id;
}

extension RestaurantHoursQueryWhereSort
    on QueryBuilder<RestaurantHours, RestaurantHours, QWhere> {
  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantHoursQueryWhere
    on QueryBuilder<RestaurantHours, RestaurantHours, QWhereClause> {
  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RestaurantHoursQueryFilter
    on QueryBuilder<RestaurantHours, RestaurantHours, QFilterCondition> {
  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closingTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      closingTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dayOfWeek',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      dayOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dayOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      documentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openingTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      openingTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restaurantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restaurantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterFilterCondition>
      restaurantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restaurantId',
        value: '',
      ));
    });
  }
}

extension RestaurantHoursQueryObject
    on QueryBuilder<RestaurantHours, RestaurantHours, QFilterCondition> {}

extension RestaurantHoursQueryLinks
    on QueryBuilder<RestaurantHours, RestaurantHours, QFilterCondition> {}

extension RestaurantHoursQuerySortBy
    on QueryBuilder<RestaurantHours, RestaurantHours, QSortBy> {
  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByClosingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByClosingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByOpeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByOpeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByRestaurantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      sortByRestaurantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.desc);
    });
  }
}

extension RestaurantHoursQuerySortThenBy
    on QueryBuilder<RestaurantHours, RestaurantHours, QSortThenBy> {
  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByClosingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByClosingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByOpeningTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByOpeningTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingTime', Sort.desc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByRestaurantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QAfterSortBy>
      thenByRestaurantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.desc);
    });
  }
}

extension RestaurantHoursQueryWhereDistinct
    on QueryBuilder<RestaurantHours, RestaurantHours, QDistinct> {
  QueryBuilder<RestaurantHours, RestaurantHours, QDistinct>
      distinctByClosingTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closingTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QDistinct> distinctByDayOfWeek(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QDistinct>
      distinctByDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QDistinct>
      distinctByOpeningTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openingTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantHours, RestaurantHours, QDistinct>
      distinctByRestaurantId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restaurantId', caseSensitive: caseSensitive);
    });
  }
}

extension RestaurantHoursQueryProperty
    on QueryBuilder<RestaurantHours, RestaurantHours, QQueryProperty> {
  QueryBuilder<RestaurantHours, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantHours, String, QQueryOperations>
      closingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closingTime');
    });
  }

  QueryBuilder<RestaurantHours, String, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<RestaurantHours, String, QQueryOperations> documentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentId');
    });
  }

  QueryBuilder<RestaurantHours, String, QQueryOperations>
      openingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openingTime');
    });
  }

  QueryBuilder<RestaurantHours, String, QQueryOperations>
      restaurantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restaurantId');
    });
  }
}
