// 


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  /// Variables
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Image Picker"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Container(
                    height: 40.0,
                  ),
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent
                    ),
                    
                    // color: Colors.greenAccent,
                    onPressed: () {
                      _getFromCamera();
                 
                    },
                    child: Text('Pick From Camera'),
                 ),
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            )));
  }



  /// Get from Camera
  Future _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera, maxHeight: 1800,maxWidth: 1800);
   
   
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}