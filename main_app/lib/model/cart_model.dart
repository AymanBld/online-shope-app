import 'package:online_shope_app/model/products_model.dart';

class CartModel {
  late int id;
  late ProductModel product;
  late int quantity;
  late int user;
  int? order;

  CartModel({required this.id, required this.product, required this.quantity, required this.user, this.order});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
    user = json['user'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product.toJson();
    data['quantity'] = quantity;
    data['user'] = user;
    data['order'] = order;
    return data;
  }
}
