import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class PostgresHelper {
  var databaseConnection = PostgreSQLConnection(
    '192.168.18.5',
    8000,
    'mebel',
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    username: 'postgres',
    password: '0987',
  );

  Future<List<Map<String, dynamic>>> initDatabaseConnection() async {
    try {
      await databaseConnection.open().then((value) {
        debugPrint("Database Connected!");
      });

      List<Map<String, Map<String, dynamic>>> result =
          await databaseConnection.mappedResultsQuery("SELECT * FROM products");

      List<Map<String, dynamic>> products = [];

      for (var element in result) {
        products = element.values.toList();
      }

      return products;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
