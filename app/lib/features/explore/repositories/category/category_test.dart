import './category_repository.dart';

import '../../models/category_model.dart';

class CategoryTest implements CategoryRepository {
  const CategoryTest();

  @override
  Future<List<CategoryModel>> fetchAllCategory() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> categoriesJson = [
      {
        'id': '0',
        'title': 'Men',
        'image':
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fman-icon&psig=AOvVaw0mTuzianrB5i6WUhPEs3Gg&ust=1686827063326000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCKC6hszOwv8CFQAAAAAdAAAAABAF',
      },
      {
        'id': '1',
        'title': 'Women',
        'image':
            'https://cdn.iconscout.com/icon/premium/png-256-thumb/women-43-155146.png?f=webp&w=256',
      },
      {
        'id': '2',
        'title': 'Device',
        'image':
            'https://cdn.iconscout.com/icon/free/png-256/free-devices-1891053-1597957.png?f=webp&w=256',
      },
      {
        'id': '3',
        'title': 'Gadgets',
        'image':
            'https://cdn.iconscout.com/icon/premium/png-256-thumb/gadgets-6435468-5305078.png?f=webp&w=256',
      },
      {
        'id': '4',
        'title': 'Game',
        'image':
            'https://cdn.iconscout.com/icon/premium/png-256-thumb/gamepad-11-119613.png?f=webp&w=256',
      },
    ];

    return [
      for (final Map<String, dynamic> categoryJson in categoriesJson)
        CategoryModel.fromJson(categoryJson),
    ];
    // throw 'There is error in fetch data';
  }
}
