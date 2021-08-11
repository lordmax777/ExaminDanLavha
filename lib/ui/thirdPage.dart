import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
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
          onPressed: (){},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Text("Rute jalan"),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            )),
            child: ListView(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                Column(
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
                              height: 100.0,
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
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Deskripsi taman",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 5.0, bottom: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Taman yang cocok untuk kamu bersantai \n karena tempatnya yang indah, taman yang \n asri, dan banyak juga spot yg keren!",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0, top: 25.0),
                  child: Container(
                    height: 165.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 0.0,
                          spreadRadius: -0.0,
                          color: Colors.black54,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: Colors.yellow[700],
                                    ),
                                    SizedBox(width:12.0,),
                                    Column(
                                      children: [
                                        Text(
                                          "4,3",
                                          style: TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          "(20,987)",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100.0,
                                width: 3.0,
                                color: Colors.grey[200],

                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Air mancur",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Checkbox(
                                            splashRadius: 5.0,
                                            activeColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            checkColor: Colors.white,
                                            value: isChecked1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Area Joging",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Checkbox(
                                            splashRadius: 5.0,
                                            activeColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            checkColor: Colors.white,
                                            value: isChecked2,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked2 = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Area Mushala",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Checkbox(
                                            splashRadius: 5.0,
                                            activeColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            checkColor: Colors.white,
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 13.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Spot populer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                    height: 130.0,
                    child: ListView(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0, bottom: 8.0),
                          child: Container(
                            height: 90.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: NetworkImage("https://fsa.zobj.net/crop.php?r=PWa_-BF4bg-4iVpP2duhrVI7xvYER6f14My3ciRyFePM6x_Mw7LhzUOGEV8UQ5y5YBUJcw9BhwBlUw98ik5uLlOXy7GSzYIhQBhPzxFde1MiS0cT0KeFJmFeIK2mjfgNkew51gn8VYrlWrXP"),fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
                          child: Container(
                            height: 90.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: NetworkImage("https://thumbs.dreamstime.com/b/%D0%BA%D1%80%D0%B0%D1%81%D0%B8%D0%B2%D0%B0%D1%8F-%D0%BF%D1%80%D0%B5%D0%B4%D0%BF%D0%BE%D1%81%D1%8B%D0%BB%D0%BA%D0%B0-%D0%BB%D0%B0%D0%BD%D0%B4%D1%88%D0%B0%D1%84%D1%82%D0%B0-%D0%BF%D0%B0%D1%80%D0%BA%D0%B0-%D1%81-%D1%80%D0%B5%D0%BA%D0%BE%D0%B9-138697520.jpg"),fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 8.0, bottom: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 90.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[300],
                            ),
                            child: Text("20+", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.grey.shade700),),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
