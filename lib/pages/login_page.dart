import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';

import 'package:chat/helpers/mostrar_alerta.dart';

import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/custom_input.dart';




class LoginPage extends StatelessWidget {

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

                Logo(titulo: 'Messenger',),

                _Form(),

                Labels(
                  ruta: 'register',
                  titulo: 'No tienes cuenta?',
                  subtitulo: 'Crea una ahora!',
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

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // listen = false, por que por defecto provider va ha intentar re-dibujar
    // el widget y  no lo queremos re-dibujar
    // Provider.of<AuthService>(context, listen = false);
    final authService = Provider.of<AuthService>(context);

    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
       child: Column(
         children: [
           
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
             onPressed: authService.autenticando ? null : () async {
               // quitar el teclado
               // quita el foco de donde sea que este
               FocusScope.of(context).unfocus();

               final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

               if (loginOk) {
                 socketService.connect();
                 Navigator.pushReplacementNamed(context, 'usuarios');

               } else {
                 //Mostrar alerta
                  mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamente');
               }
             },
          )
         ],
       ),
    );
  }
}
