import '../../features/account/location/repositories/location_test.dart';
import '../../features/account/location/repositories/location_repository.dart';

import '../../features/account/profile/repositories/profile_test.dart';
import '../../features/account/profile/repositories/profile_repository.dart';

import '../../features/explore/repositories/category/category_test.dart';
import '../../features/explore/repositories/category/category_repository.dart';

import '../../features/explore/repositories/product/product_test.dart';
import '../../features/explore/repositories/product/product_repository.dart';

class ApplicationRepositories {
  static const ProfileRepository profileRepository = ProfileTest();
  static const LocationRepository locationRepository = LocationTest();
  static const CategoryRepository categoryRepository = CategoryTest();
  static const ProductRepository productRepository = ProductTest();
}
