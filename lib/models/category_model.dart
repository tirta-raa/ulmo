part of 'models.dart';

class CategoryModel {
  int? id;
  String? name;

  CategoryModel({this.id, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// ------------------------------------------
// ------------------------------------------

class MockCategoryModel {
  String image;
  String text;

  MockCategoryModel({
    required this.image,
    required this.text,
  });
}

List<MockCategoryModel> mockCategory = [
  MockCategoryModel(image: 'assets/adidas.png', text: 'Adidas'),
  MockCategoryModel(image: 'assets/anta.png', text: 'Anta'),
  MockCategoryModel(image: 'assets/jordan.png', text: 'Jordan'),
  MockCategoryModel(image: 'assets/lining.png', text: 'Li-Ning'),
  MockCategoryModel(image: 'assets/newbalance.png', text: 'New Balance'),
  MockCategoryModel(image: 'assets/nikee.png', text: 'Nike'),
  MockCategoryModel(image: 'assets/peak.png', text: 'Peak'),
  MockCategoryModel(image: 'assets/puma.png', text: 'Puma'),
  MockCategoryModel(image: 'assets/underarmour.png', text: 'Armour'),
  MockCategoryModel(image: 'assets/yzy.png', text: 'Yeezy'),
];
