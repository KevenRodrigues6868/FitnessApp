import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(title: 'Calculadora de IMC', theme: ThemeData(), home: createHome()));
}

Widget createHome(){
  return Scaffold(
    appBar: AppBar(title: const Text('calc.fields.valor'), backgroundColor: Colors.blue),
    body: Padding(padding: const EdgeInsets.all(16.0),
      child: createBody(),
    ),
  );
}

Widget createBody(){
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "";

  return StatefulBuilder(
    builder: (context, setState){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Calculadora de IMC', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),


          createInputField(pesoController, 'Peso (kg)', TextInputType.number),
          SizedBox(height: 40),
          createInputField(alturaController, 'Altura (m)', TextInputType.number),
          SizedBox(height: 40),


          ElevatedButton(
            onPressed: () {
              double peso = double.tryParse(pesoController.text) ?? 0;
              double altura = double.tryParse(alturaController.text) ?? 0;
              altura = altura / 100;

              if (peso > 0 && altura > 0) {
                double imc = peso / (altura * altura);
                resultado = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
                print("IMC calculado: $resultado");
              } else {
                resultado = 'Por favor, insira valores válidos!';
              }
              setState((){});
            },
            child: Text('Calcular IMC'),
          ),
          SizedBox(height: 20),


          Text(
            resultado,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      );
    },
  );
}

Widget createInputField(TextEditingController controller, String labelText, TextInputType keyboardType){
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    ),
  );
}