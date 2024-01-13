import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getDataOrderBy(),
                  builder: (s, snap) {
                    var data = snap.data ?? List<TeachersModel>.empty();
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (c, i) {
                          return Text(data[i].name ?? "no data");
                        });
                  })),
          Expanded(
              child: FutureBuilder(
                  future: getData(),
                  builder: (s, snap) {
                    var data = snap.data ?? List<TeachersModel>.empty();
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (c, i) {
                          return Text(data[i].name ?? "no data");
                        });
                  }))
        ],
      ),
    );
  }

  Future<List<TeachersModel>> getDataOrderBy() async {
    var ref = FirebaseFirestore.instance.collection('teachers');
    var doc = await ref.orderBy("age", descending: false).get();
    return doc.docs.map((e) => TeachersModel.fromJson(e.data())).toList();
  }

  Future<List<TeachersModel>> getData() async {
    var ref = FirebaseFirestore.instance.collection('teachers');
    var doc = await ref.get();
    return doc.docs.map((e) => TeachersModel.fromJson(e.data())).toList();
  }
}

TeachersModel teachersModelFromJson(String str) =>
    TeachersModel.fromJson(json.decode(str));

String teachersModelToJson(TeachersModel data) => json.encode(data.toJson());

class TeachersModel {
  String? name;
  Timestamp? date;

  TeachersModel({
    required this.name,
    required this.date,
  });

  factory TeachersModel.fromJson(Map<String, dynamic> json) => TeachersModel(
    name: json["name"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
  };
}