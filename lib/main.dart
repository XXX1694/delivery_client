import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_client/core/router/app_router.dart';
import 'package:delivery_client/core/services/api_service.dart';
import 'package:delivery_client/core/services/storage_service.dart';
import 'package:delivery_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:delivery_client/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:delivery_client/features/auth/domain/repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;
  await StorageService().init();
  ApiService().init(
    baseUrl: 'http://localhost:8000/api', // Замените на ваш реальный URL
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRemoteDataSource>(
          create: (context) => AuthRemoteDataSourceImpl(ApiService().dio),
        ),
        RepositoryProvider<AuthRepository>(
          create:
              (context) =>
                  AuthRepositoryImpl(context.read<AuthRemoteDataSource>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
