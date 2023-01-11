import 'package:flutter/material.dart';
import 'package:reminderappv2/detail_screen.dart';
import 'NavBar.dart';
import 'package:flutter/cupertino.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<Mainscreen> {

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  bool button1 = false;
  bool button2 = false;

  final List<Color> warna = <Color>[
    Color(0xffFFB8B8),
    Color(0xffDBB8FF33),
    Color(0xffB8FFFF33),
    Color(0xffC2FFB833),
    Color(0xffFFB8B8),
    Color(0xffDBB8FF33),
    Color(0xffB8FFFF33),
    Color(0xffC2FFB833),
  ];


  var key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: NavBar(),
      backgroundColor: Color(0xFAFAF9F7),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 10),
          child: IconButton(onPressed: () {
            key.currentState?.openDrawer();
          },
            icon: Icon(Icons.menu_rounded, color: Colors.black, size: 33,),
          ),
        ),


        actions: [
          Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    size: 33,)
                ),

                SizedBox(
                  width: 5,
                ),

                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    size: 33,)
                ),
              ],
            ),
          ),
        ),
          ]
        
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(CupertinoIcons.calendar, color: Colors.red, size: 33,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 270,
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if (button1 == false){
                                button1 = true;
                              }else{
                                button1 = false;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: button1 == false
                                ? Colors.white
                                :  Colors.red,
                            minimumSize: Size(130, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          child: Text("Semua", style: TextStyle(
                            color: button1 == false
                              ? Colors.black
                              :  Colors.white,
                          ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: button2 == true ? Colors.red  :  Colors.white,
                            minimumSize: Size(130, 10),
                             shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          child: Text("Produktif", style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(key: UniqueKey(),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DetailScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: warna[index],
                              minimumSize: Size(MediaQuery.of(context).size.width, 140),
                              elevation: 0,
                            ),
                            child: Container(),
                          ),
                          SizedBox(height: 15,)
                        ],
                      )
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFfFF735C),
        onPressed: () {
        },

        child: Icon(Icons.add,),

      ),
    );
  }
}
