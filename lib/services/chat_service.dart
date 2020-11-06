import 'package:chat/models/mensaje_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';

import 'package:chat/global/environment.dart';

class ChatService with ChangeNotifier {

  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {

    final resp = await http.get('${ Environment.apiUrl }/mensajes/$usuarioID',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    final mensajeResp = mensajeResponseFromJson(resp.body);

    return mensajeResp.mensaje;

  }
  

}