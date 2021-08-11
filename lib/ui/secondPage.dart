import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled18/ui/profile.dart';
import 'package:untitled18/ui/thirdPage.dart';

class SecondPage extends StatefulWidget {
  String? username;
  SecondPage({this.username});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  String dropdownValue = '🚲    20 Menit dari lokasimu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 35.0),
        width: 200.0,
        height: 70.0,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdPage()));
            },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              child: Text("Rute jalan"),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/oa.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                          },
                          child: Icon(CupertinoIcons.person,color: Colors.black,),),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, right: 35.0, top: 20.0, bottom: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.bars,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "       Mau kemana?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 15.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.black,
                        ),
                        iconSize: 20,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          '🚲    20 Menit dari lokasimu',
                          '🚖    10 Menit dari lokasimu',
                          '🚍    40 Menit dari lokasimu',
                          '🚶    60 Menit dari lokasimu'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 230.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2)),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20.0),
                width: 50,
                height: 7,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Hero(
                      tag: "https://thumbs.dreamstime.com/b/%D0%B2%D0%B7%D0%B3%D0%BB%D1%8F%D0%B4-%D0%B4%D0%BE%D1%80%D0%BE%D0%B3%D0%B8-%D0%B2-%D0%BA%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D0%BE%D0%BC-%D0%BF%D0%B0%D1%80%D0%BA%D0%B5-%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%B0-133336082.jpg",
                      child: Container(
                        margin: EdgeInsets.only(left: 25.0, right: 20.0),
                        width: 90.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("https://thumbs.dreamstime.com/b/%D0%B2%D0%B7%D0%B3%D0%BB%D1%8F%D0%B4-%D0%B4%D0%BE%D1%80%D0%BE%D0%B3%D0%B8-%D0%B2-%D0%BA%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D0%BE%D0%BC-%D0%BF%D0%B0%D1%80%D0%BA%D0%B5-%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%B0-133336082.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Taman kata\t ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Text("Buka",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Taman jomblo",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              color: Colors.yellow[800],
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text("24 Jam"),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}

/*SnappingSheet(
        child: uiBody(context),
        grabbingHeight: 260,
        grabbing: myGrabbingWidget(),
        sheetBelow: SnappingSheetContent(
          draggable: true,
          sizeBehavior: SheetSizeFill(),
          child: thirdlar(),
        ),
      ),*/


