import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;

  String text="";

  final _textController = TextEditingController();

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter text'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Text'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              child: _imageFile == null
                  ? Text('No image selected.')
                  : Image.file(_imageFile!,fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            Text(_textController.text),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FloatingActionButton.extended(
              onPressed: () {
                print("Image button pressed 43");
                _pickImage(ImageSource.gallery);
              },
              tooltip: 'Pick Image from gallery',
              icon: Icon(Icons.photo_library),
              label: Text("Change image"),
            ),
          ),

          FloatingActionButton.extended(
            onPressed: () async {
              await _showDialog();
              setState(() {
              });
            },
            tooltip: 'Pick Image from gallery',
            icon: Icon(Icons.edit),
            label: Text("Change Text"),
          ),
        ],
      ),
    );
  }

}
