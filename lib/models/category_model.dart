part of 'models.dart';

class CategoryModel {
  String image;
  String text;

  CategoryModel({
    required this.image,
    required this.text,
  });
}

List<CategoryModel> mockCategory = [
  CategoryModel(image: 'assets/adidas.png', text: 'Adidas'),
  CategoryModel(image: 'assets/anta.png', text: 'Anta'),
  CategoryModel(image: 'assets/jordan.png', text: 'Jordan'),
  CategoryModel(image: 'assets/lining.png', text: 'Li-Ning'),
  CategoryModel(image: 'assets/newbalance.png', text: 'New Balance'),
  CategoryModel(image: 'assets/nikee.png', text: 'Nike'),
  CategoryModel(image: 'assets/peak.png', text: 'Peak'),
  CategoryModel(image: 'assets/puma.png', text: 'Puma'),
  CategoryModel(image: 'assets/underarmour.png', text: 'Armour'),
  CategoryModel(image: 'assets/yzy.png', text: 'Yeezy'),
];
