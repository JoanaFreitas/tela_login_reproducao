import 'dart:async';

import 'package:flutter/material.dart';

enum ModoAutenticar { Registrar, Entrar }

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _senhaController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool _isLoading= false;

  ModoAutenticar _modoAutenticar = ModoAutenticar.Entrar;

  Map<String, String> _dadoAutenticar = {
    'email': '',
    'senha': '',
  };

  bool _isLogin() => _modoAutenticar == ModoAutenticar.Entrar;
  bool _isSingup() => _modoAutenticar == ModoAutenticar.Registrar;

  _alternarAutenticacao() {
    setState(() {
      if (_isLogin()) {
        _modoAutenticar = ModoAutenticar.Registrar;
      } else {
        _modoAutenticar = ModoAutenticar.Entrar;
      }
    });
  }
void _submit(){
  final isValid = _formKey.currentState?.validate()??false;
  if(!isValid){
    return;
  }
  setState(()=>_isLoading=true);
  _formKey.currentState?.save();//qndo for salvar 
  
  if(_isLogin()){
    //entrar
  }else{
    //registar
  }
  setState(()=>_isLoading=true);
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Email',
                        suffixIcon: const Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) => _dadoAutenticar['email'] = email ?? '',
                    validator: (_email) {
                      final email = _email ?? '';
                      if (email.trim().isEmpty || !email.contains('@')) {
                        return 'Informe um email válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Senha',
                        suffixIcon: const Icon(Icons.remove_red_eye)),
                    keyboardType: TextInputType.multiline,
                    obscureText: true,
                    controller: _senhaController,
                    onSaved: (senha) => _dadoAutenticar['senha'] = senha ?? '',
                    validator: (_senha) {
                      final senha = _senha ?? '';
                      if (senha.isEmpty || senha.length < 5) {
                        return 'Informe uma senha válida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  if (_isSingup())
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                            //labelText: 'Senha',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Confirmar senha',
                            suffixIcon: const Icon(Icons.remove_red_eye)),
                        keyboardType: TextInputType.multiline,
                        obscureText: true,
                        validator: _isLogin()
                        ?null
                        :(_senhaConf) {
                          final senhaConf = _senhaConf ?? '';
                          if (senhaConf != _senhaController.text) {
                            return 'Senhas não conferem';
                          }
                          return null;
                        },
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
                    child:_isLoading
                    ?Container(
                      width: 50,
                      height: 50,
                      child: Center(child: CircularProgressIndicator()))
                    : ElevatedButton(
                      onPressed: _submit,
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
