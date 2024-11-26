import 'package:tracker/features/transaction/data/models/transaction_model.dart';

/// [LocalDatasource] is an abstract class.
/// It is used to define the methods that a local datasource should implement.
abstract interface class LocalDatasource {
  /// method [getTransactions] gets a list of transactions.
  Future<List<TransactionModel>> getTransactions();

  /// method [writeTransaction] writes a transaction.
  Future<void> writeTransaction(TransactionModel transaction);

  /// method [updateTransaction] updates a transaction.
  Future<void> updateTransaction(TransactionModel transaction);

  /// method [deleteTransaction] deletes a transaction.
  Future<void> deleteTransaction(int id);
}