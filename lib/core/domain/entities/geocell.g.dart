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
    r'maxLatitude': PropertySchema(
      id: 0,
      name: r'maxLatitude',
      type: IsarType.string,
    ),
    r'maxLongitude': PropertySchema(
      id: 1,
      name: r'maxLongitude',
      type: IsarType.string,
    ),
    r'maxLongitudeComposite': PropertySchema(
      id: 2,
      name: r'maxLongitudeComposite',
      type: IsarType.string,
    ),
    r'minLatitude': PropertySchema(
      id: 3,
      name: r'minLatitude',
      type: IsarType.string,
    ),
    r'minLongitude': PropertySchema(
      id: 4,
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
    r'minLatitude': IndexSchema(
      id: -8970309205964384159,
      name: r'minLatitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'minLatitude',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'maxLatitude': IndexSchema(
      id: 412520304776113206,
      name: r'maxLatitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'maxLatitude',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'minLongitude': IndexSchema(
      id: 8435632708552677693,
      name: r'minLongitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'minLongitude',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude': IndexSchema(
      id: 4883547757142263036,
      name: r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'maxLongitudeComposite',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'minLatitude',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'maxLatitude',
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
  bytesCount += 3 + object.maxLatitude.length * 3;
  bytesCount += 3 + object.maxLongitude.length * 3;
  bytesCount += 3 + object.maxLongitudeComposite.length * 3;
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
  writer.writeString(offsets[0], object.maxLatitude);
  writer.writeString(offsets[1], object.maxLongitude);
  writer.writeString(offsets[2], object.maxLongitudeComposite);
  writer.writeString(offsets[3], object.minLatitude);
  writer.writeString(offsets[4], object.minLongitude);
}

GeoCell _geoCellDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeoCell(
    maxLatitude: reader.readString(offsets[0]),
    maxLongitude: reader.readString(offsets[1]),
    minLatitude: reader.readString(offsets[3]),
    minLongitude: reader.readString(offsets[4]),
  );
  object.id = id;
  object.maxLongitudeComposite = reader.readString(offsets[2]);
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

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> minLatitudeEqualTo(
      String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'minLatitude',
        value: [minLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> minLatitudeNotEqualTo(
      String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLatitude',
              lower: [],
              upper: [minLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLatitude',
              lower: [minLatitude],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLatitude',
              lower: [minLatitude],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLatitude',
              lower: [],
              upper: [minLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> maxLatitudeEqualTo(
      String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'maxLatitude',
        value: [maxLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> maxLatitudeNotEqualTo(
      String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxLatitude',
              lower: [],
              upper: [maxLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxLatitude',
              lower: [maxLatitude],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxLatitude',
              lower: [maxLatitude],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'maxLatitude',
              lower: [],
              upper: [maxLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> minLongitudeEqualTo(
      String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'minLongitude',
        value: [minLongitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause> minLongitudeNotEqualTo(
      String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLongitude',
              lower: [],
              upper: [minLongitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLongitude',
              lower: [minLongitude],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLongitude',
              lower: [minLongitude],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'minLongitude',
              lower: [],
              upper: [minLongitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeEqualToAnyMinLatitudeMaxLatitudeMinLongitude(
          String maxLongitudeComposite) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName:
            r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
        value: [maxLongitudeComposite],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeNotEqualToAnyMinLatitudeMaxLatitudeMinLongitude(
          String maxLongitudeComposite) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [],
              upper: [maxLongitudeComposite],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [],
              upper: [maxLongitudeComposite],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeMinLatitudeEqualToAnyMaxLatitudeMinLongitude(
          String maxLongitudeComposite, String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName:
            r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
        value: [maxLongitudeComposite, minLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeEqualToMinLatitudeNotEqualToAnyMaxLatitudeMinLongitude(
          String maxLongitudeComposite, String minLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite],
              upper: [maxLongitudeComposite, minLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude],
              includeLower: false,
              upper: [maxLongitudeComposite],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude],
              includeLower: false,
              upper: [maxLongitudeComposite],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite],
              upper: [maxLongitudeComposite, minLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeMinLatitudeMaxLatitudeEqualToAnyMinLongitude(
          String maxLongitudeComposite,
          String minLatitude,
          String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName:
            r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
        value: [maxLongitudeComposite, minLatitude, maxLatitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeMinLatitudeEqualToMaxLatitudeNotEqualToAnyMinLongitude(
          String maxLongitudeComposite,
          String minLatitude,
          String maxLatitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude],
              upper: [maxLongitudeComposite, minLatitude, maxLatitude],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude, maxLatitude],
              includeLower: false,
              upper: [maxLongitudeComposite, minLatitude],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude, maxLatitude],
              includeLower: false,
              upper: [maxLongitudeComposite, minLatitude],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude],
              upper: [maxLongitudeComposite, minLatitude, maxLatitude],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeMinLatitudeMaxLatitudeMinLongitudeEqualTo(
          String maxLongitudeComposite,
          String minLatitude,
          String maxLatitude,
          String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName:
            r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
        value: [maxLongitudeComposite, minLatitude, maxLatitude, minLongitude],
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterWhereClause>
      maxLongitudeCompositeMinLatitudeMaxLatitudeEqualToMinLongitudeNotEqualTo(
          String maxLongitudeComposite,
          String minLatitude,
          String maxLatitude,
          String minLongitude) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude, maxLatitude],
              upper: [
                maxLongitudeComposite,
                minLatitude,
                maxLatitude,
                minLongitude
              ],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [
                maxLongitudeComposite,
                minLatitude,
                maxLatitude,
                minLongitude
              ],
              includeLower: false,
              upper: [maxLongitudeComposite, minLatitude, maxLatitude],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [
                maxLongitudeComposite,
                minLatitude,
                maxLatitude,
                minLongitude
              ],
              includeLower: false,
              upper: [maxLongitudeComposite, minLatitude, maxLatitude],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName:
                  r'maxLongitudeComposite_minLatitude_maxLatitude_minLongitude',
              lower: [maxLongitudeComposite, minLatitude, maxLatitude],
              upper: [
                maxLongitudeComposite,
                minLatitude,
                maxLatitude,
                minLongitude
              ],
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

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLongitudeComposite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxLongitudeComposite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxLongitudeComposite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLongitudeComposite',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterFilterCondition>
      maxLongitudeCompositeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxLongitudeComposite',
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

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> sortByMaxLongitudeComposite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitudeComposite', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy>
      sortByMaxLongitudeCompositeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitudeComposite', Sort.desc);
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

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy> thenByMaxLongitudeComposite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitudeComposite', Sort.asc);
    });
  }

  QueryBuilder<GeoCell, GeoCell, QAfterSortBy>
      thenByMaxLongitudeCompositeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxLongitudeComposite', Sort.desc);
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

  QueryBuilder<GeoCell, GeoCell, QDistinct> distinctByMaxLongitudeComposite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxLongitudeComposite',
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

  QueryBuilder<GeoCell, String, QQueryOperations>
      maxLongitudeCompositeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxLongitudeComposite');
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
