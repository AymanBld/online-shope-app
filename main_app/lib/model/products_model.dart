import 'package:online_shope_app/model/categories_model.dart';

class ProductModel {
  late int id;
  late String name;
  String? description;
  String? imageUrl;
  late double price;
  int? discount;
  late bool isFavorite;
  late CategoryModel category;
  late double dicountedPrice;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.price,
    this.discount,
    required this.isFavorite,
    required this.category,
    required this.dicountedPrice,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
    price = json['price'];
    discount = json['discount'];
    isFavorite = json['is_favorite'];
    dicountedPrice = json['dicountedPrice'];
    category = CategoryModel.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['price'] = price;
    data['discount'] = discount;
    data['is_favorite'] = isFavorite;
    data['dicountedPrice'] = dicountedPrice;
    data['category'] = category.toJson();
    return data;
  }
}
