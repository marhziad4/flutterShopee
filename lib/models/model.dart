import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import '../tools/helper.dart';
import 'view_list.dart';


// STEP 1: define your tables as shown in the example Classes below.

// Define the 'tableCategory' constant as SqfEntityTable for the category table
const tableCategory = SqfEntityTable(
    tableName: 'category',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    modelName:
    null, // SqfEntity will set it to TableName automatically when the modelName (class name) is null
    // declare fields
    fields: [
      SqfEntityField('name', DbType.text, isNotNull: true),
      SqfEntityField('isActive', DbType.bool, defaultValue: true),
    ],
    formListSubTitleField: '');

// Define the 'tableProduct' constant as SqfEntityTable for the product table
const tableProduct = SqfEntityTable(
    tableName: 'product',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField(
        'name',
        DbType.text,
        isNotNull: true,
      ),
      SqfEntityField('description', DbType.text),
      SqfEntityField('price', DbType.real, defaultValue: 0),
      SqfEntityField('isActive', DbType.bool, defaultValue: true),
      //SqfEntityField('isActive2', DbType.bool, defaultValue: true),

      /// Relationship column for CategoryId of Product
      SqfEntityFieldRelationship(
          parentTable: tableCategory,
          deleteRule: DeleteRule.CASCADE,
          defaultValue: 0,
          formDropDownTextField:
          'name' // displayText of dropdownList for category. 'name' => a text field from the category table
      ),
      SqfEntityField('rownum', DbType.integer,
          sequencedBy:
          seqIdentity /*Example of linking a column to a sequence */),
      SqfEntityField('imageUrl', DbType.text),
      SqfEntityField('datetime', DbType.datetime,
          defaultValue: 'DateTime.now()',
          minValue: '2019-01-01',
          maxValue: 'DateTime.now().add(Duration(days: 30))'),
      SqfEntityField('date', DbType.date,
          minValue: '2015-01-01',
          maxValue: 'DateTime.now().add(Duration(days: 365))')
    ]);

// Define the 'Todo' constant as SqfEntityTable.
const tableTodo = SqfEntityTable(
    tableName: 'todos',
    primaryKeyName: 'id',
    useSoftDeleting:
    false, // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    primaryKeyType: PrimaryKeyType.integer_unique,
    defaultJsonUrl:
    'https://jsonplaceholder.typicode.com/todos', // optional: to synchronize your table with json data from webUrl

    // declare fields
    fields: [
      SqfEntityField('userId', DbType.integer),
      SqfEntityField('title', DbType.text),
      SqfEntityField('completed', DbType.bool, defaultValue: false),
    ]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',

);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyDbModel',
    databaseName: 'sampleORM_v1.4.0.db',
    password: null,
    databaseTables: [tableProduct, tableCategory, tableTodo],
    formTables: [tableProduct, tableCategory, tableTodo],
    sequences: [seqIdentity],
    dbVersion: 2,
    bundledDatabasePath: null
);