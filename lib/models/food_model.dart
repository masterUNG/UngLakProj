import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodModel {
  final String id;
  final String category;
  final String nameFood;
  final String price;
  final String detail;
  final String image;
  FoodModel({
    required this.id,
    required this.category,
    required this.nameFood,
    required this.price,
    required this.detail,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'nameFood': nameFood,
      'price': price,
      'detail': detail,
      'image': image,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: (map['id'] ?? '') as String,
      category: (map['category'] ?? '') as String,
      nameFood: (map['nameFood'] ?? '') as String,
      price: (map['price'] ?? '') as String,
      detail: (map['detail'] ?? '') as String,
      image: (map['image'] ?? '') as String,
    );
  }

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
