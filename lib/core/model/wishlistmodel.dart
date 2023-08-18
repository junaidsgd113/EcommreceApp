
import 'package:isar/isar.dart';

part 'wishlistmodel.g.dart';

@collection
class WishListModel {
  String? title;
  int? price;
  int? id;
  String? category;
  String? thumnail;
  String? uuid;
  @Index()
  Id get isarId => fastHash(uuid ?? '');
  WishListModel({
    this.thumnail,
    this.title,
    required this.uuid,
    this.price,
     this.id,
     this.category
  });

  

  
  
 



  @override
  bool operator ==(covariant WishListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.price == price &&
      other.id == id &&
      other.thumnail == thumnail &&
      other.uuid == uuid;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      price.hashCode ^
      id.hashCode ^
      thumnail.hashCode ^
      uuid.hashCode;
  }

  @override
  String toString() {
    return 'WishListModel(title: $title, price: $price, id: $id, thumnail: $thumnail, uuid: $uuid)';
  }
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
