import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razer_admin/application/Validator/validator_bloc.dart';
import 'package:razer_admin/application/add_product/add_product_bloc.dart';
import 'package:razer_admin/application/edit_product/edit_product_bloc.dart';

import 'package:razer_admin/presentation/home/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final Future<FirebaseApp> _razerAdmin = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AddProductBloc()),
        BlocProvider(create: (ctx) => ValidatorBloc()),
        BlocProvider(create: (ctx) => EditProductBloc()),
      ],
      child: (MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Razer admin',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          backgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: const MainScreen(),
        // FutureBuilder(
        //     future: _razerAdmin,
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         print('Error ${snapshot.error.toString()}');
        //         return const Text('somthing went wrong');
        //       } else if (snapshot.hasData) {
        //         return const MainScreen();
        //       } else {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     }),
        //
      )),
    );
  }
}
