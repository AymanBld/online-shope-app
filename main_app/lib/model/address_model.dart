class AddressModel {
  late int id;
  late String name;
  late String city;
  late String street;
  double? lang;
  double? lat;
  late int user;

  AddressModel({
    required this.id,
    required this.name,
    required this.city,
    required this.street,
    this.lang,
    this.lat,
    required this.user,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    street = json['street'];
    lang = json['lang'];
    lat = json['lat'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city'] = city;
    data['street'] = street;
    data['lang'] = lang;
    data['lat'] = lat;
    data['user'] = user;
    return data;
  }
}
