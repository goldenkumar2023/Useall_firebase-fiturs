// To parse this JSON data, do
//
//     final userdatamodel = userdatamodelFromJson(jsonString);

import 'dart:convert';

Userdatamodel userdatamodelFromJson(String str) => Userdatamodel.fromJson(json.decode(str));

String userdatamodelToJson(Userdatamodel data) => json.encode(data.toJson());

class Userdatamodel {
  String? name;
  String? email;
  String? phone;
  String? users_id;

  Userdatamodel({
    this.name,
    this.email,
    this.phone,
    this.users_id,
  });

  factory Userdatamodel.fromJson(Map<String, dynamic> json) => Userdatamodel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    users_id: json["users_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "users_id": users_id,
  };
}
