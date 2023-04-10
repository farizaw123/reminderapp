import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {

  final keys;

  const DetailScreen({Key? key, required this.keys}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreen(keys);
}

class _DetailScreen extends State<DetailScreen>{

  _DetailScreen(this.keys);
  final keys;


  var judulController = TextEditingController();
  var isiController = TextEditingController();

  final fDatabaseNotes = FirebaseDatabase.instance.ref().child("notes");

  Future<void> onSave() async{
    await fDatabaseNotes.child(keys).set({
      'judul' : judulController.text,
      'isi' : isiController.text,
      'date_post' : DateFormat.yMMMd().format(DateTime.now())
    });
  }

  bool loading = false;

  Future<void> getNotes() async{

    setState(() {
      loading = true;
    });
    var judul = await fDatabaseNotes.child(keys).child('judul').get();
    var isi = await fDatabaseNotes.child(keys).child('isi').get();
    print(judul);
    print(isi);

    setState(() {
      judulController.text = judul.value.toString();
      if(isi.value.toString()!='null'){
        isiController.text = isi.value.toString();
      }
    });

    setState(() {
      loading = false;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(""),
        actions: [
          SizedBox(
            child: (IconButton(
                onPressed: () {}, icon: Icon(Icons.undo, color: Colors.black))),
          ),
          SizedBox(
            child: (IconButton(
                onPressed: () {}, icon: Icon(Icons.redo, color: Colors.black))),
          ),
          
          SizedBox( width: 50,),

          SizedBox(
            child: (IconButton(
                onPressed: () {
                  onSave();
                },
                icon: Icon(Icons.check, color: Colors.black))),
          ),
          SizedBox(
            child: (IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.black)),
          ),
        ],
      ),

      body: loading == true
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: Text(DateFormat.yMMMd().format(DateTime.now()))),
                  SizedBox(width: 10,),
                  Flexible(child: Icon(Icons.edit, size: 15,)),

                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 40,
            width: 50,
            color: Colors.transparent,
            // color: Color.fromARGB(255, 245, 245, 245),
            child: (
                TextFormField(
                  controller: judulController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Judul",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )),
          ),
          Container(
            // margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 200,
            width: 50,
            color: Colors.transparent,
            // color: Color.fromARGB(255, 255, 255, 255),
            child: (
                TextFormField(
                  controller: isiController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tuliskan Apa saja",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )),
          ),


        ],
      ),
      bottomSheet: Container(
        height: 40,
        // color: Colors.red,
        child: 
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(
                    Icons.font_download,
                    // color: Colors.pink,
                    size: 25.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Icon(
                    Icons.check_box,
                    // color: Colors.pink,
                    size: 25.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Icon(
                    Icons.format_list_bulleted_sharp,
                    // color: Colors.pink,
                    size: 25.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Icon(
                    Icons.format_list_numbered_outlined,
                    // color: Colors.green,
                    size: 25.0,
                  ),
                  Icon(
                    Icons.photo,
                    // color: Colors.blue,
                    size: 25.0,
                  ),
      ],
    ),
      ),
    );
  }

}
