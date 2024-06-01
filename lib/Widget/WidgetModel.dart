import 'package:api_and_login/res/Color.dart';
import 'package:api_and_login/config/get_it_config.dart';
import 'package:api_and_login/git_%20data_api_url/data_api.dart';
import 'package:api_and_login/main.dart';
import 'package:api_and_login/res/String.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IconLogIn extends StatelessWidget {
  const IconLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/a.png',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                alignment: Alignment.center,
                width: 258,
                height: 258,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                child:  Text(
                  LOGIN,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: LogInColorOfString,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 132,
              left: 10,
              child: Image.asset('assets/s1.png'),
            ),
            Positioned(top: -7, left: -15, child: Image.asset('assets/s.png')),
            Positioned(top: 31, left: 210, child: Image.asset('assets/s3.png'))
          ],
        ),
      ],
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: 287,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          controller: name,
          decoration:  InputDecoration(
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.email),
            hintText:   ahmadgmail,
          ),
        ),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 287,
        child: TextField(
          controller: password,
          obscureText: false,
          decoration: InputDecoration(
            hintText: pas,
            suffixIcon: const Icon(Icons.visibility),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldAnswer extends StatelessWidget {
  TextFieldAnswer({super.key, Answer});
  final TextEditingController Answer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 287,
        child: TextField(
          controller: Answer,
          decoration: InputDecoration(
            hintText: 'answer',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldindexOfCorrect extends StatelessWidget {
  TextFieldindexOfCorrect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 287,
        child: TextField(
          controller: indexOfCorrect,
          decoration: InputDecoration(
            hintText: 'indexOfCorrect',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldQuestion extends StatelessWidget {
  const TextFieldQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: 287,
        child: TextField(
          controller: Question,
          decoration: InputDecoration(
            hintText: 'Question',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ButooneLogin extends StatelessWidget {
  const ButooneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: 287,
          height: 59,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/1.png'))),
          child: const Center(child: Text('LongIn')),
        ),
        onTap: () {
          core.get<SharedPreferences>().setString('name', name.text);

          core.get<SharedPreferences>().setString('pass', password.text);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizApp(),
              ));
        },
      ),
    );
  }
}

class ButooneSendData extends StatelessWidget {
  const ButooneSendData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          width: 287,
          height: 59,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/1.png'))),
          child: const Center(child: Text('send Data')),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizApp(),
              ));
        },
      ),
    );
  }
}
