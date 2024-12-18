import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/core/constants/app_constants.dart';
import 'package:tracker/core/helpers/date_time_helper.dart';
import 'package:tracker/core/presentation/theme/app_theme.dart';
import 'package:tracker/core/utils/extensions/build_context_ext.dart';
import 'package:tracker/features/analysis/presentation/bloc/analysis_bloc.dart';
import 'package:tracker/features/transaction/domain/entities/transaction.dart';
import 'package:tracker/features/transaction/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:tracker/features/transaction/presentation/utils/core.dart';
import 'package:tracker/features/transaction/presentation/widgets/top_controls.dart';

/// [TransactionsView] is a class.
/// That extends [StatelessWidget] and builds the transactions view.
class TransactionsView extends StatelessWidget {
  /// [TransactionsView] constructor.
  const TransactionsView({
    required this.transactions,
    super.key,
  });

  /// [transactions] is the list of transactions.
  final List<Transaction> transactions;

  void Function() _onDismissed(
    BuildContext context, {
    required Transaction transaction,
  }) =>
      () {
        context.read<TransactionsBloc>().add(
              DeleteTransactionEvent(
                transaction.id!,
              ),
            );
        context.read<AnalysisBloc>().add(const GetAnalysisEvent());
      };

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        const TopControls(
          isSearchEnabled: true,
          isFiltersEnabled: true,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (_, index) {
              final transaction = transactions[index];
              final date = transaction.updatedAt ?? transaction.createdAt;

              final dateFormat = DateTimeHelper.dateFormat;

              return Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                onDismissed: transaction.id != null
                    ? (_) =>
                        _onDismissed(context, transaction: transaction).call()
                    : null,
                background: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.commonSize24,
                  ),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                child: Card(
                  color: transaction.type.getColor(context),
                  child: ListTile(
                    leading: Icon(
                      transaction.category.getIcon(),
                    ),
                    title: Text(
                      transaction.title,
                      style: theme.primaryTextTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.appColors.textColors.mainColor,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${transaction.value} \$'),
                        Text(
                          dateFormat.format(
                            date ?? DateTime.now(),
                          ),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: transaction.id != null
                          ? () {
                              showDialog<TransactionDialog>(
                                context: context,
                                builder: (_) => TransactionDialog(
                                  transaction: transaction,
                                ),
                              );
                            }
                          : null,
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
