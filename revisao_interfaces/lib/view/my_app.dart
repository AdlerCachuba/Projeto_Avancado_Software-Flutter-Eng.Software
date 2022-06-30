import 'package:flutter/material.dart';
import 'package:revisao_interfaces/view/calcula_idade.dart';
import 'package:revisao_interfaces/view/hello_world.dart';
import 'package:revisao_interfaces/view/menu.dart';

import 'calculadora.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // \/ tira a faixa do de bug na direita em cima
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (context) => Menu(),
        '/contador': (context) => MyHomePage(),
        '/hello': (context) => HelloWorld(),
        '/calculaIdade': (context) => CalculaIdade(),
        '/calculadora': (context) => Calculadora(),
      },
    );
  }
}
