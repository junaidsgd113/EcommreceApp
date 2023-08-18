



import 'package:isar/isar.dart';
part 'cartmodel.g.dart';
@collection
 class  CartModel{
  
 int? quantity;
  String? title;
   int? price;
String? thumnail;
  
  String? uuid;
  @Index()
Id get isarId => fastHash(uuid ?? '');

CartModel(
      {this.quantity , 
      this.thumnail,
      this.title,
     required this.uuid,
      this.price,
     });
    
 }
 int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}