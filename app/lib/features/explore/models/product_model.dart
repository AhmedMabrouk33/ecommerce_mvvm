class ProductModel {
  final String id;
  final String image;
  final String title;
  final String category;
  final String brand;
  final double price;
  final String details;
  final ProductCartModel productCartModel;

  const ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.brand,
    required this.price,
    required this.details,
    required this.productCartModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      details: json['details'],
      productCartModel: ProductCartModel(
        cart: 0,
        totalPrice: 0.0,
        state: '',
      ),
    );
  }
}

class ProductCartModel {
  int cart;
  double totalPrice;
  String state;

  ProductCartModel({
    required this.cart,
    required this.totalPrice,
    required this.state,
  });
}
