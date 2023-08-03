part of 'models.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updateAt;
  List<GalleriesModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updateAt,
    this.galleries,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.tryParse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    // Check if 'category' is not null before parsing it
    if (json['category'] != null) {
      category = CategoryModel.fromJson(json['category']);
    }
    // Check if 'createdAt' is not null before parsing it
    if (json['createdAt'] != null) {
      createdAt = DateTime.parse(json['createdAt']);
    }
    // Check if 'updateAt' is not null before parsing it
    if (json['updateAt'] != null) {
      updateAt = DateTime.parse(json['updateAt']);
    }
    // Check if 'galleries' is not null before parsing it
    if (json['galleries'] != null) {
      galleries = json['galleries']
          .map<GalleriesModel>((gallery) => GalleriesModel.fromJson(gallery))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags, // Remove the space after 'tags'
      'category': category?.toJson(), // Call toJson() on category
      'createdAt':
          createdAt?.toIso8601String(), // Convert DateTime to ISO 8601 string
      'updateAt':
          updateAt?.toIso8601String(), // Convert DateTime to ISO 8601 string
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
    };
  }
}

// class MockProductModel {
//   String image;
//   String title;
//   int price;

//   MockProductModel({
//     this.image = '',
//     this.price = 0,
//     this.title = '',
//   });
// }

// List<MockProductModel> mockProduct = [
//   MockProductModel(
//     image: 'assets/shoes1.png',
//     title: 'Air Zoom',
//     price: 320,
//   ),
//   MockProductModel(
//     image: 'assets/shoes2.png',
//     title: 'Air Max',
//     price: 120,
//   ),
//   MockProductModel(
//     image: 'assets/shoes3.png',
//     title: 'Night Club Shoes',
//     price: 80,
//   ),
//   MockProductModel(
//     image: 'assets/shoes4.png',
//     title: 'Nike Dual Shoes',
//     price: 580,
//   ),
//   MockProductModel(
//     image: 'assets/shoes5.png',
//     title: 'Rebook Shoes',
//     price: 220,
//   ),
//   MockProductModel(
//     image: 'assets/shoes6.png',
//     title: 'Sport Shoes',
//     price: 110,
//   ),
//   MockProductModel(
//     image: 'assets/shoes7.png',
//     title: 'Extream Shoes',
//     price: 55,
//   ),
// ];
