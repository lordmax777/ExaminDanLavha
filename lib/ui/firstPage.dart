import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tcard/tcard.dart';
import 'package:untitled18/db/database_helper.dart';
import 'package:untitled18/db/picture.dart';
import 'package:untitled18/ui/secondPage.dart';
import 'package:http/http.dart' as http;

class IntroductionOnBoardingSkip extends StatefulWidget {
  @override
  _IntroductionOnBoardingSkipState createState() => _IntroductionOnBoardingSkipState();
}

class _IntroductionOnBoardingSkipState
    extends State<IntroductionOnBoardingSkip> {
  final introKey = GlobalKey<IntroductionScreenState>();
  DatabaseHelper db = DatabaseHelper();
  List<String> photo = [
    "https://i.ya-webdesign.com/images/drawing-japanese-scenery-18.png",
    "https://main-cdn.goods.ru/big2/hlr-system/16021911122/100025579244b1.jpg",
    "https://st3.depositphotos.com/7857468/17609/v/950/depositphotos_176094868-stock-illustration-green-city-park-bench-trash.jpg",
    "https://thumbs.dreamstime.com/b/view-road-beautiful-city-park-illustration-133336082.jpg",
    "https://st3.depositphotos.com/1008801/15461/v/950/depositphotos_154614120-stock-illustration-bench-with-tree-and-lantern.jpg",
    "http://maskarad-nn.ru/wp-content/uploads/2020/03/%D0%92%D0%B5%D1%81%D0%BD%D0%B0-%D0%BC%D1%83%D0%BB%D1%8C%D1%82%D1%8F%D1%88%D0%BD%D0%B0%D1%8F-43%D1%8528-%D0%BF%D1%80%D0%B5%D0%B2%D1%8C%D1%8E.jpg",
    "http://maskarad-nn.ru/wp-content/uploads/2020/03/%D0%92%D0%B5%D1%81%D0%BD%D0%B0-%D0%BC%D1%83%D0%BB%D1%8C%D1%82%D1%8F%D1%88%D0%BD%D0%B0%D1%8F-43%D1%8528-%D0%BF%D1%80%D0%B5%D0%B2%D1%8C%D1%8E.jpg",
  ];

  List localPhoto = [];

  List<ImageProvider> nomi = [];

  void _writeDatabase() async {
    for (var item in photo) {
      var image = await http.get(Uri.parse(item));

      Uint8List bytes = image.bodyBytes;
      db.insertPicture(Picture(picture: bytes));
      print("insert");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/logo.png"),
                radius: 25.0,
              ),
              SizedBox(width: 5.0),
              Text("Park",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38.0, color: Colors.black),),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Picture>>(
        future: db.queryPicture(),
        builder: (context,snapshot){
          if(snapshot.hasData){
             if(snapshot.data!.length != 0){
               localPhoto = snapshot.data!;
               return IntroductionScreen(
                   globalBackgroundColor: Colors.white,
                   globalFooter: Align(
                       alignment: Alignment.center,
                       child: Padding(
                         padding: const EdgeInsets.only(bottom: 25.0),
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(40.0),
                             ),
                             fixedSize: Size(150.0, 50.0),
                             primary: Colors.grey[200],
                           ),
                           onPressed: () {
                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SecondPage()));
                           },
                           child: Text("Skip", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                         ),
                       )),
                   key: introKey,
                   pages: [
                     PageViewModel(
                       title: "Temukan taman indah \n  di sekitarmu!",
                       body: "",
                       decoration: PageDecoration(
                           footerPadding: EdgeInsets.only(bottom: 5.0, top: 15.0),
                           imageFlex: 3,
                           bodyFlex: 1,
                           bodyTextStyle:
                           TextStyle(fontSize: 10, color: Colors.grey.shade600),
                           titlePadding: EdgeInsets.all(0),
                           titleTextStyle:
                           TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                       image: TCard(
                         size: Size(350, 430),
                         cards: [
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: MemoryImage(localPhoto[0].picture),
                                   fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(30.0),
                                 bottomRight: Radius.circular(30.0),
                                 topRight: Radius.circular(90.0),
                                 topLeft: Radius.circular(90.0),
                               ),
                               color: Colors.grey,
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: MemoryImage(localPhoto[1].picture),
                                   fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(30.0),
                                 bottomRight: Radius.circular(30.0),
                                 topRight: Radius.circular(90.0),
                                 topLeft: Radius.circular(90.0),
                               ),
                               color: Colors.white.withOpacity(1),
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: MemoryImage(localPhoto[2].picture),
                                   fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(30.0),
                                 bottomRight: Radius.circular(30.0),
                                 topRight: Radius.circular(100.0),
                                 topLeft: Radius.circular(100.0),
                               ),
                               color: Colors.white.withOpacity(0.8),
                             ),
                           )
                         ],
                       ),
                     ),
                     PageViewModel(
                       title: "Temukan taman indah \n  di sekitarmu!",
                       body: "",
                       decoration: PageDecoration(
                           imageFlex: 3,
                           bodyTextStyle:
                           TextStyle(fontSize: 10, color: Colors.grey.shade600),
                           titlePadding: EdgeInsets.all(0),
                           titleTextStyle:
                           TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                       image: TCard(
                         size: Size(350, 430),
                         cards: [
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: MemoryImage(localPhoto[3].picture),
                                   fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(50.0),
                                 bottomRight: Radius.circular(50.0),
                                 topRight: Radius.circular(90.0),
                                 topLeft: Radius.circular(90.0),
                               ),
                               color: Colors.white,
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: MemoryImage(localPhoto[4].picture),
                                   fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(50.0),
                                 bottomRight: Radius.circular(50.0),
                                 topRight: Radius.circular(90.0),
                                 topLeft: Radius.circular(90.0),
                               ),
                               color: Colors.white.withOpacity(1),
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               // image: DecorationImage(
                               //     // image: MemoryImage(localPhoto[5].picture),
                               //     fit: BoxFit.cover),
                               boxShadow: [
                                 BoxShadow(
                                   offset: Offset(0, 1),
                                   blurRadius: 0.0,
                                   spreadRadius: -0.0,
                                   color: Colors.black54,
                                 )
                               ],
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(50.0),
                                 bottomRight: Radius.circular(50.0),
                                 topRight: Radius.circular(90.0),
                                 topLeft: Radius.circular(90.0),
                               ),
                               color: Colors.white.withOpacity(0.8),
                             ),
                           )
                         ],
                       ),
                     ),
                     buildPageViewModel(
                         title: "Loyihamiz sizga maqul keladimi?",
                         body: "Izohlarda o'z fikringizni qoldiring",
                         image: "https://main-cdn.goods.ru/big2/hlr-system/16021911122/100025579244b1.jpg",
                         footer: ButtonsWidget(
                           text: "Bosh Safimaga qaytish",
                           onClicked: () {
                             SystemSound.play(SystemSoundType.click);
                             introKey.currentState?.animateScroll(1);
                           },
                         )),
                   ],
                   showNextButton: false,
                   showDoneButton: false,
                   dotsDecorator: DotsDecorator(
                     size: const Size(15.0, 15),
                     shape:
                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                     activeSize: const Size(55.0, 12.0),
                     activeColor: Colors.green,
                     color: Colors.black26,
                     spacing: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                     activeShape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0)),
                   ));
             }else {
               _writeDatabase();
             }
          }

          return IntroductionScreen(
              globalBackgroundColor: Colors.white,
              globalFooter: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        fixedSize: Size(150.0, 50.0),
                        primary: Colors.grey[200],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SecondPage()));
                      },
                      child: Text("Skip", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey),),
                    ),
                  )),
              key: introKey,
              pages: [
                PageViewModel(
                  title: "Temukan taman indah \n  di sekitarmu!",
                  body: "",
                  decoration: PageDecoration(
                      footerPadding: EdgeInsets.only(bottom: 5.0, top: 15.0),
                      imageFlex: 3,
                      bodyFlex: 1,
                      bodyTextStyle:
                      TextStyle(fontSize: 10, color: Colors.grey.shade600),
                      titlePadding: EdgeInsets.all(0),
                      titleTextStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                  image: TCard(
                    size: Size(350, 430),
                    cards: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[0]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(90.0),
                            topLeft: Radius.circular(90.0),
                          ),
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[1]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(90.0),
                            topLeft: Radius.circular(90.0),
                          ),
                          color: Colors.white.withOpacity(1),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[2]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                          ),
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
                PageViewModel(
                  title: "Temukan taman indah \n  di sekitarmu!",
                  body: "",
                  decoration: PageDecoration(
                      imageFlex: 3,
                      bodyTextStyle:
                      TextStyle(fontSize: 10, color: Colors.grey.shade600),
                      titlePadding: EdgeInsets.all(0),
                      titleTextStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                  image: TCard(
                    size: Size(350, 430),
                    cards: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[3]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            topRight: Radius.circular(90.0),
                            topLeft: Radius.circular(90.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[4]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            topRight: Radius.circular(90.0),
                            topLeft: Radius.circular(90.0),
                          ),
                          color: Colors.white.withOpacity(1),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(photo[5]),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 0.0,
                              spreadRadius: -0.0,
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            topRight: Radius.circular(90.0),
                            topLeft: Radius.circular(90.0),
                          ),
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
                buildPageViewModel(
                    title: "Loyihamiz sizga maqul keladimi?",
                    body: "Izohlarda o'z fikringizni qoldiring",
                    image: photo[6],
                    footer: ButtonsWidget(
                      text: "Bosh Safimaga qaytish",
                      onClicked: () {
                        SystemSound.play(SystemSoundType.click);
                        introKey.currentState?.animateScroll(1);
                      },
                    ),
                ),
              ],
              showNextButton: false,
              showDoneButton: false,
              dotsDecorator: DotsDecorator(
                size: const Size(15.0, 15),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                activeSize: const Size(55.0, 12.0),
                activeColor: Colors.green,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ));

          },
      ),
    );
  }

  buildPageViewModel({title, body, image, titleWidget, bodyWidget, footer}) {
    return PageViewModel(
        title: title,
        body: body,
        image: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            height: 500.0,
            width: 300.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(90.0),
                  topLeft: Radius.circular(90.0),
                ),
              image: DecorationImage(
                image: NetworkImage(image),fit: BoxFit.cover
              )
            ),
          ),
        ),
        titleWidget: titleWidget,
        bodyWidget: bodyWidget,
        footer: footer,
        decoration: PageDecoration());
  }
}

class ButtonsWidget extends StatefulWidget {
  VoidCallback? onClicked;
  String? text;
  Color? color;
  ButtonsWidget({this.text, this.onClicked, this.color});
  @override
  _ButtonsWidgetState createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return buildButton(
        text: widget.text, onClicked: widget.onClicked, color: widget.color);
  }

  Widget buildButton({required text, required onClicked, required color}) {
    return CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: color,
        child: Text(text),
        onPressed: onClicked);
  }
}