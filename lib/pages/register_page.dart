import 'package:chat/widgets/boton_azul.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/custom_input.dart';



class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F3),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Logo(titulo: 'Registro',),

                _Form(),

                Labels(
                  ruta: 'login',
                  titulo: 'Ya tienes una cuenta?',
                  subtitulo: 'Ingresa ahora!',
                ),

                Text('Término y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
       child: Column(
         children: [
           
           CustomInput(
             icon: Icons.perm_identity,
             placeHolder: 'Nombre',
             keyboardType: TextInputType.text,
             textController: nameCtrl,
           ),

           CustomInput(
             icon: Icons.mail_outline,
             placeHolder: 'Email',
             keyboardType: TextInputType.emailAddress,
             textController: emailCtrl,
           ),

           CustomInput(
             icon: Icons.lock_outline,
             placeHolder: 'Password',
             textController: passCtrl,
             isPassword: true,
           ),
           
           BotonAzul(
             text: 'Ingrese',
             onPressed: () {
               print(emailCtrl.text);
               print(passCtrl.text);
             },
          )
         ],
       ),
    );
  }
}
