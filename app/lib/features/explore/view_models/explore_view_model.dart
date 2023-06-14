import 'package:get/get.dart';

import '../models/category_model.dart';

import '../../../core/data/repository_configuration.dart';

class ExploreViewModel extends GetxController {
  
  List<CategoryModel> categoriesItem = [];
  
  bool showBottomNavBar = false;
  
  Future<void> prepareData() async {
    return await Future.wait(
      [
        ApplicationRepositories.categoryRepository.fetchAllCategory(),
      ],
    ).then(
      (responseValue) {
        categoriesItem = [...responseValue.first];
        showBottomNavBar = true;
        update(['explore_bottom_nav_bar']);
      },
    ).catchError(
      (errorResponse) {
        print('There is error');
        throw (errorResponse);
      },
    );
  }

  void rebuildScreen() {
    update(['Main-Explore-Controller']);
  }

  void pushCategoryPage(String categoryTitle){}
}
