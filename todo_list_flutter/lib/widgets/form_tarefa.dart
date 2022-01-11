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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  titulo,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  autofocus: true,
                  onPressed: () {},
                  child: Text(tituloBotao),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
