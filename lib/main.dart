import 'package:byte_store/core/constants/colors.dart';
import 'package:byte_store/data/datasources/address_remote_datasource.dart';
import 'package:byte_store/data/datasources/auth_remote_datasource.dart';
import 'package:byte_store/data/datasources/category_remote_datasource.dart';
import 'package:byte_store/data/datasources/firebase_messanging_remote_datasource.dart';
import 'package:byte_store/data/datasources/order_remote_datasource.dart';
import 'package:byte_store/data/datasources/product_remote_datasource.dart';
import 'package:byte_store/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:byte_store/data/models/responses/subdistrict_response_model.dart';
import 'package:byte_store/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:byte_store/presentation/address/bloc/address/address_bloc.dart';
import 'package:byte_store/presentation/address/bloc/city/city_bloc.dart';
import 'package:byte_store/presentation/address/bloc/province/province_bloc.dart';
import 'package:byte_store/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:byte_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:byte_store/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:byte_store/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:byte_store/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:byte_store/presentation/home/bloc/category/category_bloc.dart';
import 'package:byte_store/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:byte_store/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
import 'package:byte_store/presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:byte_store/presentation/orders/bloc/history_order/history_order_bloc.dart';
import 'package:byte_store/presentation/orders/bloc/order/order_bloc.dart';
import 'package:byte_store/presentation/orders/bloc/status_order/status_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/app_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingRemoteDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => BestSellerProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              SpecialOfferProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(create: (context) => CheckoutBloc()),
        BlocProvider(create: (context) => LoginBloc(AuthRemoteDatasource())),
        BlocProvider(create: (context) => LogoutBloc(AuthRemoteDatasource())),
        BlocProvider(
            create: (context) => AddressBloc(AddressRemoteDataSource())),
        BlocProvider(
            create: (context) => AddAddressBloc(AddressRemoteDataSource())),
        BlocProvider(
            create: (context) => ProvinceBloc(RajaongkirRemoteDatasource())),
        BlocProvider(
            create: (context) => CityBloc(RajaongkirRemoteDatasource())),
        BlocProvider(
            create: (context) => SubdistrictBloc(RajaongkirRemoteDatasource())),
        BlocProvider(
            create: (context) => CostBloc(RajaongkirRemoteDatasource())),
        // BlocProvider(
        //   create: (context) => TrackingBloc(RajaongkirRemoteDatasource()),
        // ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => StatusOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => HistoryOrderBloc(OrderRemoteDatasource()),
        ),
        // BlocProvider(
        //   create: (context) => OrderDetailBloc(OrderRemoteDatasource()),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
