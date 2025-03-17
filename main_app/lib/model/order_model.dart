class OrderModel {
  late int id;
  late String totalPrice;
  late int quantity;
  late String paymentMethod;
  late int status;
  late String date;
  late int user;
  late int delivery;
  late int address;

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.quantity,
    required this.paymentMethod,
    required this.status,
    required this.date,
    required this.user,
    required this.delivery,
    required this.address,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    quantity = json['quantity'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    date = json['date'];
    user = json['user'];
    delivery = json['delivery'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_price'] = totalPrice;
    data['quantity'] = quantity;
    data['payment_method'] = paymentMethod;
    data['status'] = status;
    data['date'] = date;
    data['user'] = user;
    data['delivery'] = delivery;
    data['address'] = address;
    return data;
  }
}
