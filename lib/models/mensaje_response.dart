// To parse this JSON data, do
//
//     final mensajeResponse = mensajeResponseFromJson(jsonString);

import 'dart:convert';

MensajeResponse mensajeResponseFromJson(String str) => MensajeResponse.fromJson(json.decode(str));

String mensajeResponseToJson(MensajeResponse data) => json.encode(data.toJson());

class MensajeResponse {
    MensajeResponse({
        this.ok,
        this.mensaje,
    });

    bool ok;
    List<Mensaje> mensaje;

    factory MensajeResponse.fromJson(Map<String, dynamic> json) => MensajeResponse(
        ok: json["ok"],
        mensaje: List<Mensaje>.from(json["mensaje"].map((x) => Mensaje.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "mensaje": List<dynamic>.from(mensaje.map((x) => x.toJson())),
    };
}

class Mensaje {
    Mensaje({
        this.de,
        this.para,
        this.mensaje,
        this.createdAt,
        this.updatedAt,
    });

    String de;
    String para;
    String mensaje;
    DateTime createdAt;
    DateTime updatedAt;

    factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        de: json["de"],
        para: json["para"],
        mensaje: json["mensaje"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "de": de,
        "para": para,
        "mensaje": mensaje,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
