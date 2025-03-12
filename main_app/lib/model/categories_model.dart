class CategoryModel {
  late int id;
  late String name;
  String? imageUrl;

  CategoryModel({required this.id, required this.name, this.imageUrl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    return data;
  }
}
