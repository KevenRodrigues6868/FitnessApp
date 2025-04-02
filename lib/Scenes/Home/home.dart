import 'package:flutter/material.dart';
import 'package:fitnessapp/Scenes/Result/result.dart';


class HomeScene extends StatelessWidget{

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  BuildContext? _context;

  @override
  Widget build(BuildContext context){
    this._context = context;
    return _createHome();
  }

  Widget _createHome() {
    return Scaffold(
        appBar: AppBar(title: const Text('Fitness App'), backgroundColor: Colors.blue),
        body: Center(child: Padding(padding: EdgeInsets.symmetric(horizontal: 30),child:_createBody())));
  }

  Widget _createBody() {
    return Column(children:
    [
      SizedBox(height: 70),
      _createInputText("Digite sua altura", _heightController),
      SizedBox(height: 30),
      _createInputText("Digite seu peso", _weightController),
      SizedBox(height: 50),
      _createButton()
    ]);
  }

  Widget _createButton() {
    return ElevatedButton(
      onPressed: () {
        String height = _heightController.text;
        String weight = _weightController.text;

        Navigator.push(
          _context!,
          MaterialPageRoute(
            builder: (context) => Result(height: height, weight: weight),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(400, 50), // Largura e altura iguais → botão quadrado
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sem borda arredondada
        ),
      ),
      child: Text('Calcular'),
    );
  }

  Widget _createInputText(String text, TextEditingController controller) {
    return TextField(controller: controller, decoration: InputDecoration(hintText: text), keyboardType: TextInputType.numberWithOptions(decimal: true),);
  }
}