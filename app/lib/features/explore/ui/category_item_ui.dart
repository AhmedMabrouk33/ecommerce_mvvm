import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryItemUi {
  static Widget createCategoryItem({
    required CategoryModel categoryModel,
    required void Function(String selectedTitle) onTapMethod,
  }) {
    return SizedBox(
      height: 90,
      width: 60,
      child: InkWell(
        onTap: () => onTapMethod(categoryModel.title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shadowColor: Colors.black,
              elevation: 5,
              color: Colors.white,
              shape: const CircleBorder(),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: categoryModel.image.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(categoryModel.image),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) => Container(
                                height: 40,
                                width: 40,
                                color: Colors.transparent,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 15),
            const Spacer(),
            Text(
              categoryModel.title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
