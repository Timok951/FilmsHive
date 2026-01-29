import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FilmTile extends StatelessWidget {
  String filmName;
  String filmImage;
  String filmdescription;
  dynamic deleteFunction;
  dynamic updateFunction;

   FilmTile({
    super.key,
    required this.filmName,
    required this.filmImage,
    required this.filmdescription,
    required this.deleteFunction,
    required this.updateFunction
    });

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(5),
              ),
          ]),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Text(
                filmName,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(filmImage),
              ),
              Text(filmdescription),
              ElevatedButton(
                onPressed: updateFunction, 
                child: 
                Text("Editfilm")
                ),

              
            ],
          )
          ),
      ),
    );
  }
}