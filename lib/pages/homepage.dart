import 'package:flutter/material.dart';
import 'package:hive_app/models/film.dart';
import 'package:hive_app/theme/theme_provider.dart';
import 'package:hive_app/utils/AddFilm.dart';
import 'package:hive_app/utils/edit_film.dart';
import 'package:hive_app/utils/film_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  Box<Film> _myBox = Hive.box<Film>("Films");
  final _controller = TextEditingController();
  final _controllerdesc = TextEditingController();
  final _controllerimg = TextEditingController();

  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).OnStartup();

    super.initState();
  }

  void saveNewTask() {
    setState(() {
      _myBox = Hive.box<Film>("Films");
      _myBox.add(
        Film(
          name: _controller.text,
          imagePath: _controllerimg.text,
          description: _controllerdesc.text,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Films", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Addfilm(
              controller: _controller,
              controllerdesc: _controllerdesc,
              controllerpath: _controllerimg,
              onCancel: () => Navigator.of(context).pop(),
              onSave: saveNewTask,
            );
          },
        ),
        tooltip: 'Add film',
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Change theme"),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),

          ValueListenableBuilder(
            valueListenable: Hive.box<Film>("Films").listenable(),
            builder: (context, Box box, _) {
              if (box.values.isEmpty) {
                return Center(child: Text("Films list is empty"));
              }
              return Flexible(
                fit: FlexFit.tight,
                child: ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    Film res = box.getAt(index);
                    return FilmTile(
                      filmName: res.name,
                      filmImage: res.imagePath,
                      filmdescription: res.description,
                      deleteFunction: (BuildContext context) {
                        res.delete();
                      },
                      updateFunction: () => showDialog(
                        context: context,
                        builder: (context) {
                          return EditFilm(
                            controller: _controller,
                            controllerdesc: _controllerdesc,
                            controllerpath: _controllerimg,
                            onCancel: () => Navigator.of(context).pop(),
                            filmname: res.name,
                            // // desc: res.description,
                            img: res.imagePath,
                            onSave: () {
                              res.name = _controller.text;
                              res.imagePath = _controllerimg.text;
                              res.description = _controllerimg.text;
                              res.save();
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
