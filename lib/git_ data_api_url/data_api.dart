import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../quizMo/quizModelData.dart';
import '../res/Color.dart';

final TextEditingController Question = TextEditingController();
final TextEditingController Answer1 = TextEditingController();
final TextEditingController Answer2 = TextEditingController();
final TextEditingController Answer3 = TextEditingController();
final TextEditingController Answer4 = TextEditingController();
final TextEditingController indexOfCorrect = TextEditingController();
Future<List<QuizModel>> getQuiz() async {
  Dio req = Dio();

  Response response = await req
      .get("https://6640c6e5a7500fcf1a9eb198.mockapi.io/ahmad/api/v1/quiz");
  print(response);
  List<QuizModel> quiz = List.generate(
    response.data.length,
    (index) => QuizModel.fromMap(response.data[index]),
  );

  return quiz;
}

PageController controller = PageController();

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getQuiz(),
          builder: (context, quiz) {
            if (quiz.hasData) {
              return PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: quiz.data!.length,
                itemBuilder: (context, index) {
                  return Scaffold(
                    body: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(141, 55, 111, 1)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: const Color.fromARGB(96, 250, 5, 5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  quiz.data![index].question,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          // Text(quiz.data![index].answer.toString()),
                          Expanded(
                            child: SizedBox(
                              height: 500,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    Container(),
                                itemCount: quiz.data![index].answer.length,
                                itemBuilder: (context, ind) {
                                  return Dismissible(
                                      key: GlobalKey(),
                                      child: InkWell(
                                        onTap: () {
                                          if (ind ==
                                              quiz.data![index]
                                                  .indexOfCorrect) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar( SnackBar(
                                              showCloseIcon: true,
                                              duration: Duration(seconds: 2),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                "🤩",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              backgroundColor: ScaffoldMessengerColor1,
                                            ));
                                            controller.nextPage(
                                                duration:
                                                    const Duration(seconds: 2),
                                                curve: Curves.bounceOut);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar( SnackBar(
                                              showCloseIcon: true,
                                              // action: SnackBarAction(label: 'Undo', onPressed: () {}),
                                              duration: const Duration(seconds: 2),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: const Text(
                                                  "nooooooooooooooooooooooooo 🥲"),
                                              backgroundColor: ScaffoldMessengerColor2,
                                            ));
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    color: BacColorQeuz),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(quiz.data![index]
                                                      .answer[ind]),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  child: const Icon(
                                    Icons.add_circle,
                                    size: 50,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QuizForm()),
                                    );
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Scaffold(
                backgroundColor: Colors.teal,
              );
            }
          }
          // ?????
          ),
    );
  }
}

class QuizForm extends StatelessWidget {
  const QuizForm({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const TextFieldQuestion(),
  //         TextFieldAnswer(
  //           Answer: Answer1,
  //         ),
  //         TextFieldAnswer(
  //           Answer: Answer2,
  //         ),
  //         TextFieldAnswer(
  //           Answer: Answer3,
  //         ),
  //         TextFieldAnswer(
  //           Answer: Answer4,
  //         ),
  //         TextFieldindexOfCorrect(),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Quiz Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: Question,
                decoration: const InputDecoration(labelText: 'Question'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the question';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: Answer1,
                decoration: const InputDecoration(labelText: 'Answer 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first answer';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: Answer2,
                decoration: const InputDecoration(labelText: 'Answer 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the second answer';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: Answer3,
                decoration: const InputDecoration(labelText: 'Answer 3'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the third answer';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: Answer4,
                decoration: const InputDecoration(labelText: 'Answer 4'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the fourth answer';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: indexOfCorrect,
                decoration: const InputDecoration(
                    labelText: 'Correct Answer Index (0-3)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the correct answer index';
                  }
                  int? index = int.tryParse(value);
                  if (index == null || index < 0 || index > 3) {
                    return 'Please enter a valid index (0-3)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await postData((context));
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<QuizModel>> postData(BuildContext context) async {
  Dio req = Dio();

  Future<void> submitData() async {
    if (Answer1.text.isNotEmpty &&
        Answer2.text.isNotEmpty &&
        Question.text.isNotEmpty) {
      QuizModel quiz = QuizModel(
        question: Question.text,
        answer: [Answer1.text, Answer2.text, Answer3.text, Answer4.text],
        indexOfCorrect: int.tryParse(indexOfCorrect.text) ?? 0,
      );

      try {
        Response response = await req.post(
          "https://6640c6e5a7500fcf1a9eb198.mockapi.io/ahmad/api/v1/quiz",
          data: quiz.toMap(),
        );
        print('Response status: ${response.statusCode}');
        print('Response data: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data submitted successfully!')),
        );
      } on Exception catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit data!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields!')),
      );
    }
  }

  await submitData();

  return [];
}
