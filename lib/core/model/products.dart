import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part "products.g.dart";
@collection
@JsonSerializable()
class Product {
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'thumbnail')
  String? thumnail;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'rating')
  double? rating;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(includeFromJson: false)
  int quantity;
  String? uuid;
 @Index()
  Id get isarId => fastHash(uuid ?? '');
  Product(
      {this.quantity = 1,
      this.images,
      this.thumnail,
      this.category,
      this.title,
      this.description,
      this.rating,
      required this.id,
      this.price,
      this.brand});
@ignore
  List<Object?> get props => [
        category,
        title,
        price,
        thumnail,
        id,
        rating,
        description,
        brand,
        images,
        quantity
      ];

  @override
  int get hashCode => props.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          props == other.props;

  factory Product.fromJson(Map<String, dynamic> map,String uuid) => _$ProductFromJson(map,uuid);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return 'Product(category: $category, title: $title, price: $price, thumnail: $thumnail, id: $id, rating: $rating, description: $description, brand: $brand, images: $images, quantity: $quantity)';
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
}
