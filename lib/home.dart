import 'package:flutter/material.dart';
import 'package:tela_login_rec/formulario.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tamDispositivo = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(250, 187, 80, 0.9),
                  Color.fromRGBO(250, 83, 140, 0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/imgSFundo.png'),
                     const SizedBox(height: 30),
                     const Formulario(),
                      const SizedBox(height: 60),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10))),
                        child:const Text(
                          'Crie uma conta clicando aqui',
                          style: TextStyle(color: Colors.white,
                          fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
