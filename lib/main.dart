import 'package:api_and_login/config/get_it_config.dart';
import 'package:api_and_login/git_%20data_api_url/data_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widget/WidgetModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:
     
        (core.get<SharedPreferences>().getString('name') == null)
            ? const logIn()
            : const QuizApp()
        );
  }
}

final TextEditingController name = TextEditingController();
final TextEditingController password = TextEditingController();

// ignore: camel_case_types
class logIn extends StatelessWidget {
  const logIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 3, child: IconLogIn()),
          const Expanded(flex: 1, child: TextFieldEmail()),
          const Expanded(flex: 1, child: TextFieldPassword()),
          const Expanded(flex: 1, child: ButooneLogin()),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Image.asset('assets/IconEndLogin.png')],
            ),
          )
        ],
      ),
    );
  }
}

