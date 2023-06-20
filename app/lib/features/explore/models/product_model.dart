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

  int get productAmount => productCartModel.cart;
  double get productTotalPrice => productCartModel.totalPrice;
  int get productGlobalIndex => productCartModel.productLocalIndex;

  factory ProductModel.fromJson({
    required Map<String, dynamic> json,
    required int productLocalIndex,
  }) {
    return ProductModel(
      id: json['id'].toString(),
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      details: json['details'],
      productCartModel: ProductCartModel.initEmpty(productLocalIndex),
    );
  }
}

class ProductCartModel {
  int productLocalIndex;
  int cart;
  double totalPrice;
  String state;

  ProductCartModel({
    required this.productLocalIndex,
    required this.cart,
    required this.totalPrice,
    required this.state,
  });

  ProductCartModel.initEmpty(this.productLocalIndex)
      : cart = 0,
        totalPrice = 0.0,
        state = '';
}
