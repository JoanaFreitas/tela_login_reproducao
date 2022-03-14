import 'package:flutter/material.dart';

enum ModoAutenticar { Registrar, Entrar }

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
   ModoAutenticar _modoAutenticar = ModoAutenticar.Entrar;

  bool _isLogin()=>_modoAutenticar==ModoAutenticar.Entrar;
  bool _isSingup()=>_modoAutenticar==ModoAutenticar.Registrar;

    _alternarAutenticacao(){
      setState(() {
        if(_isLogin()){
          _modoAutenticar= ModoAutenticar.Registrar;
        }else{
_modoAutenticar=ModoAutenticar.Entrar;
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    final tamDispositivo = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: tamDispositivo.width * 0.90,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Email',
                          suffixIcon: const Icon(Icons.email)),
                      keyboardType: TextInputType.none //emailAddress,
                      ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Senha',
                        suffixIcon: const Icon(Icons.remove_red_eye)),
                    keyboardType: TextInputType.none,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  if (_modoAutenticar == ModoAutenticar.Registrar)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                            //labelText: 'Senha',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Confirmar senha',
                            suffixIcon: const Icon(Icons.remove_red_eye)),
                        keyboardType: TextInputType.none,
                        obscureText: true,
                      ),
                    ),
                  //const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(250, 187, 80, 0.9),
                            Color.fromRGBO(250, 83, 140, 0.9),
                          ],
                        )),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        child: Text(
                          _modoAutenticar == ModoAutenticar.Entrar
                              ? 'Entrar'
                              : 'Registrar',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
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
              ),
            ),
          ),
        ),
        SizedBox(height: 70),
        TextButton(
          onPressed: _alternarAutenticacao,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Crie uma conta clicando aqui',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
