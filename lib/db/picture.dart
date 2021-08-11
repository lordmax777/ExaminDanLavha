import 'dart:typed_data';

class Picture {
  Uint8List? picture;

  Picture({this.picture});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "picture": picture,
    };

    return map;
  }
}