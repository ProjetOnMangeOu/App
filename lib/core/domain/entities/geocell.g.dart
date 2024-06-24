// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocell.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGeoCellCollection on Isar {
  IsarCollection<GeoCell> get geoCells => this.collection();
}

const GeoCellSchema = CollectionSchema(
  name: r'GeoCell',
  id: -8797212499892718396,
  properties: {
    r'maxCoordinates': PropertySchema(
      id: 0,
      name: r'maxCoordinates',
      type: IsarType.string,
    ),
    r'maxLatitude': PropertySchema(
      id: 1,
      name: r'maxLatitude',
      type: IsarType.string,
    ),
    r'maxLongitude': PropertySchema(
      id: 2,
      name: r'maxLongitude',
      type: IsarType.string,
    ),
    r'minCoordinates': PropertySchema(
      id: 3,
      name: r'minCoordinates',
      type: IsarType.string,
    ),
    r'minLatitude': PropertySchema(
      id: 4,
      name: r'minLatitude',
      type: IsarType.string,
    ),
    r'minLongitude': PropertySchema(
      id: 5,
      name: r'minLongitude',
      type: IsarType.string,
    )
  },
  estimateSize: _geoCellEstimateSize,
  serialize: _geoCellSerialize,
  deserialize: _geoCellDeserialize,
  deserializeProp: _geoCellDeserializeProp,
  idName: r'id',
  indexes: {
    r'minCoordinates_maxLatitude_maxLongitude': IndexSchema(
      id: -4227446243467228891,
      name: r'minCoordinates_maxLatitude_maxLongitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'minCoordinates',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'maxLatitude',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'maxLongitude',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'maxCoordinates_minLatitude_minLongitude': IndexSchema(
      id: -5989768724076754747,
      name: r'maxCoordinates_minLatitude_minLongitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'maxCoordinates',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'minLatitude',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'minLongitude',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'restaurants': LinkSchema(
      id: 6137684656905503472,
      name: r'restaurants',
      target: r'Restaurant',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _geoCellGetId,
  getLinks: _geoCellGetLinks,
  attach: _geoCellAttach,
  version: '3.1.0+1',
);

int _geoCellEstimateSize(
  GeoCell object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.maxCoordinates.length * 3;
  bytesCount += 3 + object.maxLatitude.length * 3;
  bytesCount += 3 + object.maxLongitude.length * 3;
  bytesCount += 3 + object.minCoordinates.length * 3;
  bytesCount += 3 + object.minLatitude.length * 3;
  bytesCount += 3 + object.minLongitude.length * 3;
  return bytesCount;
}

void _geoCellSerialize(
  GeoCell object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.maxCoordinates);
  writer.writeString(offsets[1], object.maxLatitude);
  writer.writeString(offsets[2], object.maxLongitude);
  writer.writeString(offsets[3], object.minCoordinates);
  writer.writeString(offsets[4], object.minLatitude);
  writer.writeString(offsets[5], object.minLongitude);
}

GeoCell _geoCellDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeoCell(
    maxLatitude: reader.readString(offsets[1]),
    maxLongitude: reader.readString(offsets[2]),
    minLatitude: reader.readString(offsets[4]),
    minLongitude: reader.readString(offsets[5]),
  );
  object.id = id;
  object.maxCoordinates = reader.readString(offsets[0]);
  object.minCoordinates = reader.readString(offsets[3]);
  return object;
}

P _geoCellDeserializeProp<P>(
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
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _geoCellGetId(GeoCell object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _geoCellGetLinks(GeoCell object) {
  return [object.restaurants];
}

void _geoCellAttach(IsarCollection<dynamic> col, Id id, GeoCell object) {
  object.id = id;
  object.restaurants
      .attach(col, col.isar.collection<Restaurant>(), r'restaurants', id);
}

extension GeoCellQueryWhereSort on QueryBuilder<GeoCell, GeoCell, QWhere> {
  QueryBuilder<GeoCell, GeoCell, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GeoCellQueryWhere on QueryBuilder<GeoCell, GeoCell, QWhereClause> {
  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> idBetween(
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

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesEqualToAnyMaxLatitudeMaxLongitude(String minCoordinates) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'minCoordinates_maxLatitude_maxLongitude',
        value: [minCoordinates],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesNotEqualToAnyMaxLatitudeMaxLongitude(
          String minCoordinates) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [],
              upper: [minCoordinates],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [],
              upper: [minCoordinates],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesMaxLatitudeEqualToAnyMaxLongitude(
          String minCoordinates, String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'minCoordinates_maxLatitude_maxLongitude',
        value: [minCoordinates, maxLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesEqualToMaxLatitudeNotEqualToAnyMaxLongitude(
          String minCoordinates, String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates],
              upper: [minCoordinates, maxLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude],
              includeLower: false,
              upper: [minCoordinates],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude],
              includeLower: false,
              upper: [minCoordinates],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates],
              upper: [minCoordinates, maxLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
          String minCoordinates, String maxLatitude, String maxLongitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'minCoordinates_maxLatitude_maxLongitude',
        value: [minCoordinates, maxLatitude, maxLongitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      minCoordinatesMaxLatitudeEqualToMaxLongitudeNotEqualTo(
          String minCoordinates, String maxLatitude, String maxLongitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude],
              upper: [minCoordinates, maxLatitude, maxLongitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude, maxLongitude],
              includeLower: false,
              upper: [minCoordinates, maxLatitude],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude, maxLongitude],
              includeLower: false,
              upper: [minCoordinates, maxLatitude],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minCoordinates_maxLatitude_maxLongitude',
              lower: [minCoordinates, maxLatitude],
              upper: [minCoordinates, maxLatitude, maxLongitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesEqualToAnyMinLatitudeMinLongitude(String maxCoordinates) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'maxCoordinates_minLatitude_minLongitude',
        value: [maxCoordinates],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesNotEqualToAnyMinLatitudeMinLongitude(
          String maxCoordinates) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [],
              upper: [maxCoordinates],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [],
              upper: [maxCoordinates],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesMinLatitudeEqualToAnyMinLongitude(
          String maxCoordinates, String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'maxCoordinates_minLatitude_minLongitude',
        value: [maxCoordinates, minLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesEqualToMinLatitudeNotEqualToAnyMinLongitude(
          String maxCoordinates, String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates],
              upper: [maxCoordinates, minLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude],
              includeLower: false,
              upper: [maxCoordinates],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude],
              includeLower: false,
              upper: [maxCoordinates],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates],
              upper: [maxCoordinates, minLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesMinLatitudeMinLongitudeEqualTo(
          String maxCoordinates, String minLatitude, String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'maxCoordinates_minLatitude_minLongitude',
        value: [maxCoordinates, minLatitude, minLongitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxCoordinatesMinLatitudeEqualToMinLongitudeNotEqualTo(
          String maxCoordinates, String minLatitude, String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude],
              upper: [maxCoordinates, minLatitude, minLongitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude, minLongitude],
              includeLower: false,
              upper: [maxCoordinates, minLatitude],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude, minLongitude],
              includeLower: false,
              upper: [maxCoordinates, minLatitude],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxCoordinates_minLatitude_minLongitude',
              lower: [maxCoordinates, minLatitude],
              upper: [maxCoordinates, minLatitude, minLongitude],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GeoCellQueryFilter
    on QueryBuilder<GeoCell, GeoCell, QFilterCondition> {
  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxCoordinatesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxCoordinates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxCoordinatesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxCoordinatesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxCoordinates',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxCoordinatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCoordinates',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxCoordinatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxCoordinates',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxLatitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLatitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLatitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLatitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxLatitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxLongitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> maxLongitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLongitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxLongitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minCoordinatesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minCoordinates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minCoordinatesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'minCoordinates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minCoordinatesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'minCoordinates',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minCoordinatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minCoordinates',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minCoordinatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'minCoordinates',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'minLatitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'minLatitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLatitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLatitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minLatitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'minLatitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'minLongitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'minLongitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> minLongitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLongitude',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      minLongitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'minLongitude',
        value: '',
      ));
    });
  }
}

extension GeoCellQueryObject
    on QueryBuilder<GeoCell, GeoCell, QFilterCondition> {}

extension GeoCellQueryLinks
    on QueryBuilder<GeoCell, GeoCell, QFilterCondition> {
  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> restaurants(
      FilterQuery<Restaurant> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'restaurants');
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      restaurantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'restaurants', length, true, length, true);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition> restaurantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'restaurants', 0, true, 0, true);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      restaurantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'restaurants', 0, false, 999999, true);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      restaurantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'restaurants', 0, true, length, include);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      restaurantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'restaurants', length, include, 999999, true);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      restaurantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'restaurants', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GeoCellQuerySortBy on QueryBuilder<GeoCell, GeoCell, QSortBy> {
  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxCoordinates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCoordinates', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxCoordinatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCoordinates', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinCoordinates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCoordinates', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinCoordinatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCoordinates', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMinLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLongitude', Sort.desc);
    });
  }
}

extension GeoCellQuerySortThenBy
    on QueryBuilder<GeoCell, GeoCell, QSortThenBy> {
  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxCoordinates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCoordinates', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxCoordinatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCoordinates', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinCoordinates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCoordinates', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinCoordinatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minCoordinates', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLatitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLatitude', Sort.desc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLongitude', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMinLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minLongitude', Sort.desc);
    });
  }
}

extension GeoCellQueryWhereDistinct
    on QueryBuilder<GeoCell, GeoCell, QDistinct> {
  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMaxCoordinates(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxCoordinates',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMaxLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLatitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMaxLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLongitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMinCoordinates(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minCoordinates',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMinLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLatitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMinLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minLongitude', caseSensitive: caseSensitive);
    });
  }
}

extension GeoCellQueryProperty
    on QueryBuilder<GeoCell, GeoCell, QQueryProperty> {
  QueryBuilder<GeoCell, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> maxCoordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxCoordinates');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> maxLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLatitude');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> maxLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLongitude');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> minCoordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minCoordinates');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> minLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLatitude');
    });
  }

  QueryBuilder<GeoCell, String, QQueryOperations> minLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minLongitude');
    });
  }
}
