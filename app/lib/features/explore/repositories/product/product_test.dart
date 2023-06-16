import './product_repository.dart';

import '../../models/product_model.dart';

class ProductTest implements ProductRepository {
  const ProductTest();

  @override
  Future<List<ProductModel>> fetchAllProduct() async {
    await Future.delayed(const Duration(seconds: 5));
    throw 'There is error in Product Fetch\n Please try again';
  }

  @override
  Future<List<ProductModel>> fetchBestSellingProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    var bestSellingItemsJson = [
      {
        'id': '1',
        'image':
            'https://cdn-images.farfetch-contents.com/17/05/27/14/17052714_34597895_1000.jpg',
        'title': 'BeoPlay Speaker',
        'category': 'men',
        'brand': 'Bang and Olufsen',
        'price': '755.0',
        'details':
            '''Stream wirelessly via AirPlay, DLNA or Bluetooth; access built-in streaming services and internet radio
480 watts of powerful sound and intuitive touch control
Room adaptation technology optimizes sound and automatic software updates future proof your sound system
Black or white cover included, additional cover colors available to match your home and style
In the box: Beoplay A9 sound system, front cover, 3 x wooden legs, mains cable, Quick Start guide''',
      },
      {
        'id': '2',
        'image':
            'https://m.media-amazon.com/images/I/51+oVuBoriS._AC_SY400_.jpg',
        'title': 'Leather Wristwatch',
        'category': 'men',
        'brand': 'Tag Heuer',
        'price': '450',
        'details': '''very fancy and special watch
Extra elegant black leather strap
it displays date
very amazing design
it's an eye-attractive watch
black color''',
      }
    ];
    return [
      for (var item in bestSellingItemsJson) ProductModel.fromJson(item),
    ];
    // throw 'There is error in Best Selling  Fetch\n Please try again';
  }
}
