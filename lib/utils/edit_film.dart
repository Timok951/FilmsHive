import 'package:flutter/material.dart';

class EditFilm extends StatelessWidget {
  final controller;
  final controllerpath;
  final controllerdesc;
  final filmname;
  final img;
  final desc;
  VoidCallback onSave;
  VoidCallback onCancel;

  EditFilm({
    super.key,
    required this.controller,
    required this.controllerpath,
    required this.controllerdesc,
    required this.filmname,
    required this.desc,
    required this.img,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: filmname),
          ),
          TextField(
            controller: controllerpath,
            decoration: InputDecoration(hintText: img),
          ),
          TextField(
            controller: controllerdesc,
            decoration: InputDecoration(hintText: desc),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onSave, child: Text("Save")),
              ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
            ],
          ),
        ],
      ),
    );
  }
}
