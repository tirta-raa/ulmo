part of 'models.dart';

class ProductModel {
  String image;
  String title;
  int price;

  ProductModel({
    this.image = '',
    this.price = 0,
    this.title = '',
  });
}

List<ProductModel> mockProduct = [
  ProductModel(
    image: 'assets/shoes1.png',
    title: 'Air Zoom',
    price: 320,
  ),
  ProductModel(
    image: 'assets/shoes2.png',
    title: 'Air Max',
    price: 120,
  ),
  ProductModel(
    image: 'assets/shoes3.png',
    title: 'Night Club Shoes',
    price: 80,
  ),
  ProductModel(
    image: 'assets/shoes4.png',
    title: 'Nike Dual Shoes',
    price: 580,
  ),
  ProductModel(
    image: 'assets/shoes5.png',
    title: 'Rebook Shoes',
    price: 220,
  ),
  ProductModel(
    image: 'assets/shoes6.png',
    title: 'Sport Shoes',
    price: 110,
  ),
  ProductModel(
    image: 'assets/shoes7.png',
    title: 'Extream Shoes',
    price: 55,
  ),
];
