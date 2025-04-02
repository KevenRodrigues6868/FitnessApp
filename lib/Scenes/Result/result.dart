import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final String _height;
  final String _weight;

  //construtor para receber os valores de altura e peso
  const Result ({required String height, required String weight, Key? key}) : _weight = weight, _height = height, super (key: key);

  String _calcIMC(String weight, String height) {
    try {

      final double height = double.parse(this._height);
      final double weight = double.parse(this._weight);

      final double imc = weight / (height * height);
      return imc.toStringAsFixed(2);
    } catch (e) {
      return '######';
    }
  }

  @override
  Widget build(BuildContext context){
    var imc = _calcIMC(_weight, _height);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(children: [
            Text("Resutaldo do IMC"),
            Text("Com base na sua altura: $_height e peso: $_weight, seu IMC foi: $imc"),
          ],
          ),
        ),
        );
    }
 }