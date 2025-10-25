import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';

class TransactionDB {
  static const String boxName = "transactions";

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TransactionModelAdapter());
    await Hive.openBox<TransactionModel>(boxName);
  }

  static Future<List<TransactionModel>> getAllTransactions() async {
    final box = Hive.box<TransactionModel>(boxName);
    return box.values.toList();
  }

  static Future<void> addTransaction(TransactionModel tx) async {
    final box = Hive.box<TransactionModel>(boxName);
    await box.put(tx.id, tx);
  }

  static Future<void> deleteTransaction(String id) async {
    final box = Hive.box<TransactionModel>(boxName);
    await box.delete(id);
  }
}
