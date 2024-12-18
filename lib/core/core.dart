library core;

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:tracker/core/data/datasources/local/local_datasource.dart';
import 'package:tracker/core/data/datasources/local/local_datasource_impl.dart';
import 'package:tracker/core/database/app_database.dart';
import 'package:tracker/core/presentation/router/app_router.dart';
import 'package:tracker/core/presentation/theme/app_colors_light.dart';
import 'package:tracker/core/presentation/theme/app_theme.dart';
import 'package:tracker/features/analysis/data/repositories/analysis_repository_impl.dart';
import 'package:tracker/features/analysis/domain/repositories/analysis_repository.dart';
import 'package:tracker/features/analysis/domain/usecases/get_analysis_by_category.dart';
import 'package:tracker/features/analysis/presentation/bloc/analysis_bloc.dart';
import 'package:tracker/features/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:tracker/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:tracker/features/transaction/domain/usecases/create_transaction.dart';
import 'package:tracker/features/transaction/domain/usecases/delete_transaction.dart';
import 'package:tracker/features/transaction/domain/usecases/get_filtered_transactions.dart';
import 'package:tracker/features/transaction/domain/usecases/get_transactions.dart';
import 'package:tracker/features/transaction/domain/usecases/search_transactions.dart';
import 'package:tracker/features/transaction/domain/usecases/update_transaction.dart';
import 'package:tracker/features/transaction/presentation/bloc/filters_bloc/filters_bloc.dart';
import 'package:tracker/features/transaction/presentation/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:tracker/features/transaction/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:tracker/features/transaction/presentation/cubit/form_cubit.dart';

part './di/injection_container.dart';
