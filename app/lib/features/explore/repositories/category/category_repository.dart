import '../../models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> fetchAllCategory();
}
