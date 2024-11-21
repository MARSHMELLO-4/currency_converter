import 'package:currency_converter/currency_convertor_material.dart';
import 'package:flutter/material.dart'; //importing som files and some other folders

//material.dart file gives many like string and everthing other
void main() {
  runApp(const MyApp()); //widget are the bilding block of the ui and it describes everything user should see
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConvertorMaterialPage()
    );
  }
}
//const refers that the class doesnt need to be re created twice hence this reduces the erros 