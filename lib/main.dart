import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMAGE PICKER"),
        ),
        body: Column(
          children: <Widget>[
    MaterialButton(onPressed: _openDilog,child: Text('click'),),
           Center(
             child : Padding(padding: EdgeInsets.all(50.0),
             child:  image == null
                 ? Text('No images')
                   :Image.file(image),)

           )
    ],
    ));
  }

  Future<void> _openDilog() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Select from Gallery'),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = picture ;
    });
  }

  Future openGallery() async
  {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image = gallery;
    });
  }
}


