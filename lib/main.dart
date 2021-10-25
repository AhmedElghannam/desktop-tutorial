import 'package:flutter/material.dart';
import 'package:amit_project/provider/AppProvider.dart';
import 'package:amit_project/provider/plus_Minus_Provider.dart';
import 'package:amit_project/screens/All_Products.dart';
import 'package:amit_project/screens/Item_screen.dart';
import 'package:amit_project/screens/Admin_addCategory.dart';
import 'package:amit_project/screens/login_screen.dart';
import 'package:amit_project/screens/registration_screen.dart';
import 'package:amit_project/screens/User.Cart.dart';
import 'package:amit_project/screens/user.HomeScreen.dart';
import 'package:amit_project/screens/user_categories.dart';
import 'package:amit_project/Screens/user_product.dart';
import 'package:amit_project/bloc/bloc_Items.dart';
import 'package:amit_project/bloc/bloc_control.dart';
import 'package:amit_project/consonants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/adminPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isLoggedin;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return MaterialApp(
            home: Center(child: CircularProgressIndicator()),
          );
        }else if(snapshot.hasError){
          print(snapshot.error.toString());
          return MaterialApp(
            home: Center(child: CircularProgressIndicator(),),
          );
        }else{
          isLoggedin=snapshot.data.getBool(KeepMeLoggedIn)??false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AppProvider>(
                  create: (context) => AppProvider()),
              ChangeNotifierProvider<AmountProvider>(
                  create: (context) => AmountProvider()),
              BlocProvider<BlocControl>(
                create: (context) => BlocControl(0),
              ),

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: isLoggedin?HomeScreenUser.id:LoginScreen.id,
              routes: {
                LoginScreen.id :(context)=>LoginScreen(),
                RegisterScreen.id:(context)=>RegisterScreen(),
                AddCategory.id:(context)=>AddCategory(),
                AdminHomePage.id:(context)=>AdminHomePage(),
                UserCategories.id:(context)=>UserCategories(),
                UserProducts.id:(context)=>UserProducts(),
                AllProducts.id:(context)=>AllProducts(),
                HomeScreenUser.id:(context)=>HomeScreenUser(),
                ItemScreen.id:(context)=>ItemScreen(),
                UserCart.id:(context)=>UserCart()

              },

            ),
          );
        }
      },
    );
  }
}
/*
MultiProvider(
      providers: [
    ChangeNotifierProvider<AppProvider>(
    create: (context) => AppProvider()),
    ChangeNotifierProvider<AmountProvider>(
    create: (context) => AmountProvider()),
        BlocProvider<BlocControl>(
            create: (context) => BlocControl(0),
        ),

      ],
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id :(context)=>LoginScreen(),
          RegisterScreen.id:(context)=>RegisterScreen(),
          AddCategory.id:(context)=>AddCategory(),
          AdminHomePage.id:(context)=>AdminHomePage(),
          UserCategories.id:(context)=>UserCategories(),
          UserProducts.id:(context)=>UserProducts(),
          AllProducts.id:(context)=>AllProducts(),
          HomeScreenUser.id:(context)=>HomeScreenUser(),
          ItemScreen.id:(context)=>ItemScreen(),
          UserCart.id:(context)=>UserCart()

        },

      ),
    );
 */