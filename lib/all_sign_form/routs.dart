import 'package:blocktrade/all_sign_form/splash/splash_screen.dart';
import 'package:blocktrade/main.dart';
import 'package:blocktrade/screen/order_page.dart';
import 'package:blocktrade/screen/portfolio_page.dart';
import 'package:flutter/material.dart';

import 'SignInForm/login_success/login_success_screen.dart';
import 'SignInForm/sign_in/sign_in_screen.dart';
import 'SignUpForm/sign_up/complete_profile_screen.dart';
import 'SignUpForm/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomePage.routeName: (context) => HomePage(),
  OrderSuccessScreen.routeName: (context) => OrderSuccessScreen(),
  Tab1.routeName: (context) => Tab1(),
};
