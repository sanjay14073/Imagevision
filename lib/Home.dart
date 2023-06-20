import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
//import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePickerPlatform imagePickerImplementation =
      ImagePickerPlatform.instance;
  bool textScanning = false;
  int selectedIndex=0;
  String str="The converted text will appear here";
  InputImage? f;
  late Future<FileImage>image;
  late ImagePicker i;
  XFile?f1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    i=ImagePicker();

  }
  Future<void>gallery()async{
    // PickedFile? p=(await i.pickImage(source: ImageSource.gallery)) as PickedFile?;
    // f=p as InputImage;
    try {
      //final picked = await i.pickImage(source: ImageSource.gallery);
      final ImagePicker picker = ImagePicker();
// Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if(f1!=null){
        textScanning=true;
        f1=image;
        setState(() {

        });
        perform(image!);

      }
      else{
        print("null image");
        str="null image";
        setState(() {

        });
      }
    }
    catch(e){
      textScanning = false;
      f1 = null;
      str = "Error occured while scanning";
      setState(() {});

    }
  }
  Future<void>camera()async{
    // PickedFile?p=(await i.pickImage(source: ImageSource.camera)) as PickedFile?;
    // f=p as InputImage;
    //f1=await i.pickImage(source: ImageSource.camera);
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.camera);
      if(f1!=null){
        textScanning=true;
        f1=picked;
        setState(() {

        });
        perform(picked!);
      }
      else{
        print("null image");
        str="null image";
        setState(() {});
      }
    }
    catch(e){
    textScanning = false;
    f1 = null;
    str = "Error occured while scanning";
    setState(() {});
    }

  }

  Future<void>perform(XFile images)async{
   // final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
   //  final FirebaseVisionImage vision=FirebaseVisionImage.fromFile(f);
   //  final TextRecognizer recognizer=FirebaseVision.instance.textRecognizer();
   //  VisionText v=await recognizer.processImage(vision);
   //  setState(() {
   //    for(TextBlock block in v.blocks){
   //      final String txt=block.text;
   //      for(TextLine line in block.lines){
   //        for(TextElement element in line.elements){
   //          str+=(element.text);
   //        }
   //        str+=' ';
   //      }
   //    }
   //  });
    print(str);
    print("entered perform function");
    final File imagefile = File(f1!.path);
    final image=InputImage.fromFilePath(images.path);
    //final textDetector = GoogleMlKit.vision.textDetector();

    //final textDetector = GoogleMlKit.vision.textDetector();
//    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);


    final recognizedText = await TextRecognizer().processImage(image);

  //  RecognisedText recognisedText = await textDetector.processImage(inputImage);
   // await textDetector.close();
    print(recognizedText);

    String text = recognizedText.text;
    print(text);

    // for (TextBlock block in recognizedText.blocks) {
    //   //final Rect rect = block.boundingBox;
    //   //  final List<Point<int>> cornerPoints = block.cornerPoints;
    //   final String text = block.text;
    //   final List<String> languages = block.recognizedLanguages;
    //   print(text);
    //   for (TextLine line in block.lines) {
    //     // Same getters as TextBlock
    //     //print("entered vlock");
    //     for (TextElement element in line.elements) {
    //       // Same getters as TextBlock
    //       print(element.text);
    //       str+=element.text;
    //     }
    //     str+='';
    //   }
    // }
    // for (TextBlock block in recognizedText.blocks) {
    //   for (TextLine line in block.lines) {
    //     str = "$str${line.text}\n";
    //   }
    // }
    // setState((){
    //
    // });
    // await textRecognizer.toString();

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          setState(() {
            str = '$str  ${element.text}';
            debugPrint(str);
          });
        }
        str = '$str\n';
      }
    }
  }
  void onItemTapped(int index) async{

    setState(() {
      selectedIndex = index;
      print(index);

    });
    if(index==0){
      await camera();
      setState((){
       // perform();
      });
    }
    else{
      await gallery();
      setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu,color: Colors.white,),
          backgroundColor:Colors.blue,
          centerTitle: true,
          title: Text("Image to text converter",style: TextStyle(color:Colors.white),),
        ),

        body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            height: double.maxFinite,
            //color: Colors.blueAccent[100],
            child: SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                    child: Text(str,style: TextStyle(wordSpacing: 1.0,fontWeight:FontWeight.bold,fontSize:25),),
                    ),
                  ),
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //       MaterialButton(onPressed: (){},child: Text("Upload from Gallery",style: TextStyle(color: Colors.white),),color: Colors.indigoAccent,),
                  //       SizedBox(width: 50,),
                  //       MaterialButton(onPressed: (){},child:Text("Upload using Camera",style: TextStyle(color: Colors.white),),color: Colors.indigoAccent,),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),

          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
              backgroundColor: Colors.indigoAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.browse_gallery_outlined,),
              label: 'Select From Gallery',
              backgroundColor: Colors.indigoAccent,
            ),

          ],

          //selectedItemColor: Colors.amber[800],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
