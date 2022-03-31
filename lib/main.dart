import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Возвращение значения')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var result = await Navigator.pushNamed(context, '/second');
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(result.toString()),
                  backgroundColor: Colors.black,
                ));
              }
            },
            child: const Text('Приступить к выбору...'),
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  final String choice1 = 'Да!';
  final String choice2 = 'Нет.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Выберите любой вариант')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, choice1);
                },
                child: Text(choice1),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, choice2);
                },
                child: Text(choice2),
              ),
            ),
          ],
        ));
  }
}

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),
      '/second': (BuildContext context) => const SecondScreen()
    },
  ));
}
