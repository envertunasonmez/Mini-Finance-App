import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_finance_app/data/local/transaction_db.dart';
import '../../data/models/transaction.dart';

class TransactionCubit extends Cubit<List<TransactionModel>> {
  TransactionCubit() : super([]) {
    loadTransactions();
  }

  void loadTransactions() async {
    final txs = await TransactionDB.getAllTransactions();
    emit(txs);
  }

  void addTransaction(TransactionModel transaction) async {
    await TransactionDB.addTransaction(transaction);
    loadTransactions();
  }

  void deleteTransaction(String id) async {
    await TransactionDB.deleteTransaction(id);
    loadTransactions();
  }

  double getTotalIncome() {
    return state.where((t) => t.isIncome).fold(0.0, (sum, t) => sum + t.amount);
  }

  double getTotalExpense() {
    return state.where((t) => !t.isIncome).fold(0.0, (sum, t) => sum + t.amount);
  }
}
