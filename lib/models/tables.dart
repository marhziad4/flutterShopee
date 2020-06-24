import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
const tableCategory = SqfEntityTable(
    tableName: 'category',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: null,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('isActive', DbType.bool, defaultValue: true),
    ]
);

const tableProduct = SqfEntityTable(
    tableName: 'product',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('description', DbType.text),
      SqfEntityField('price', DbType.real, defaultValue: 0),
      SqfEntityField('isActive', DbType.bool, defaultValue: true),
      SqfEntityFieldRelationship(
          parentTable: tableCategory,
          deleteRule: DeleteRule.CASCADE,
          defaultValue: 0), // Relationship column for CategoryId of Product
      SqfEntityField('rownum', DbType.integer,),
      SqfEntityField('imageUrl', DbType.text)
    ]);
