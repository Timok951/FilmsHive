import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/film.dart';

class Addfilm extends StatelessWidget {
  final controller;
  final controllerpath;
  final controllerdesc;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  Addfilm({
    super.key,
    required this.controller,
    required this.controllerpath,
    required this.controllerdesc,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Film name"
            ),
          ),
          TextField(
            controller: controllerpath,
            decoration: InputDecoration(
              hintText: "Filmpath"
            ),
          ),
          TextField(
            controller: controllerdesc,
            decoration: InputDecoration(
              hintText: "Description"
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: onSave, 
              child: Text("Save")
              ),
              ElevatedButton(
                onPressed: onCancel, 
                child: Text("Cancel"))

            ],
            
          )
        ],
      ),

    );
  }
}