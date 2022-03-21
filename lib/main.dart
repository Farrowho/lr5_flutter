import 'package:flutter/material.dart';

class FindArea extends StatefulWidget {
  const FindArea({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FindAreaState();
}

class FindAreaState extends State<FindArea> {
  final _formKey = GlobalKey<FormState>();
  double _width = 1;
  double _height = 1;
  double _area = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Ширина (мм):')),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(validator: (value) {
                      if (value!.isEmpty) return 'Задайте ширину';
                      _width = double.parse(value);
                    }))),
          ]),
          const SizedBox(height: 10.0),
          Row(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Высота (мм):')),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(validator: (value) {
                      if (value!.isEmpty) return 'Задайте высоту';
                      _height = double.parse(value);
                    }))),
          ]),
          const SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  if (_width >= 1 && _height >= 1) {
                    _area = _width * _height;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Измерения должны быть больше нуля'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    _area = 0;
                  }
                });
              }
            },
            child: const Text('Вычислить'),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          const SizedBox(height: 50.0),
          Text(
            'S = $_width * $_height = $_area (мм2)',
            style: const TextStyle(fontSize: 30.0),
          )
        ]));
  }
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(title: const Text('Калькулятор площади')),
        body: const FindArea())));
