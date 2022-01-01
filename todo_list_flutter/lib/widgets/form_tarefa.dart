import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTarefa extends StatelessWidget {
  String titulo = "";
  String tituloBotao = "";
  FormTarefa({
    Key? key,
    required this.titulo,
    required this.tituloBotao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(tituloBotao),
            ),
          ),
        ],
      ),
    );
  }
}
