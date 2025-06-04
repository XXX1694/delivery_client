import 'package:delivery_client/features/chat/presentations/pages/chat_page.dart';
import 'package:delivery_client/features/create_order/presentaion/pages/create_order_page.dart';
import 'package:delivery_client/features/linking_card/presentations/pages/linking_card_page.dart';
import 'package:delivery_client/features/order_details/presentations/pages/order_detalis_page.dart';
import 'package:delivery_client/features/orders_history/presentations/pages/orders_history_page.dart';
import 'package:delivery_client/features/payment/presentations/pages/payment_page.dart';
import 'package:delivery_client/features/profile/presentations/pages/profile_page.dart';
import 'package:delivery_client/features/settings/presentations/pages/settings_page.dart';
// import 'package:delivery_client/features/profile/presentations/pages/order_detalis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:delivery_client/features/auth/presentation/cubit/otp_verification_cubit.dart';
import 'package:delivery_client/features/auth/presentation/pages/phone_auth_page.dart';
import 'package:delivery_client/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:delivery_client/features/auth/presentation/pages/create_account_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/create-order',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/auth', name: 'auth', builder: (context, state) => const PhoneAuthPage()),
    GoRoute(
      path: '/otp',
      name: 'otp',
      builder: (context, state) {
        final phoneNumber = state.extra as String;
        return BlocProvider(create: (context) => OtpVerificationCubit(authRepository: context.read<AuthRepository>(), phoneNumber: phoneNumber), child: OtpVerificationPage(phoneNumber: phoneNumber));
      },
    ),
    GoRoute(path: '/create-account', name: 'create-account', builder: (context, state) => const CreateAccountPage()),
    GoRoute(path: '/create-order', name: 'create-order', builder: (context, state) => const CreateOrderPage()),
    GoRoute(path: '/order-details', name: 'order-details', builder: (context, state) => const OrderDetailsPage()),
    GoRoute(path: '/payment-details', name: 'payment-details', builder: (context, state) => const PaymentDetailsPage()),
    GoRoute(path: '/linking_card', name: 'linking_card', builder: (context, state) => const LinkingCardPage()),
    GoRoute(path: '/order-history', name: 'order-history', builder: (context, state) => const OrdersHistoryPage()),
    GoRoute(path: '/profile', name: 'profile', builder: (context, state) => const ProfilePage()),
    GoRoute(path: '/settings', name: 'settings', builder: (context, state) => const SettingsPage()),
    GoRoute(path: '/chat', name: 'chat', builder: (context, state) => const ChatPage()),
    // Add more routes here as needed
  ],
  errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Error: ${state.error}'))),
);
