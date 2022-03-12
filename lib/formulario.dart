import 'dart:ui';

import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamDispositivo = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding:const EdgeInsets.all(16),
          width: tamDispositivo.width * 0.80,
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Email',
                    suffixIcon:const Icon(Icons.email)),
               keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    //labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Senha',
                    suffixIcon:const Icon(Icons.remove_red_eye)),
                keyboardType: TextInputType.none,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(250, 187, 80, 0.9),
                        Color.fromRGBO(250, 83, 140, 0.9),
                      ],
                    )),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    child: Text('Entrar',
                    style: TextStyle(color: Colors.white,
                    fontSize: 18),),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Colors.brown,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          )),
        ));
  }
}
