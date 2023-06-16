import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductItemUi {
  static Widget createProductItem({
    required ProductModel productModel,
    required void Function(String productId) onTapMethod,
  }) {
    return SizedBox(
      height: 319,
      width: 164,
      child: InkWell(
        onTap: () => onTapMethod(productModel.id),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // TODO : when Save in cart show text on image.
            Container(
              height: 240,
              width: 164,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: productModel.image.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(
                          productModel.image,
                        ),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) => Container(
                          height: 240,
                          width: 164,
                          color: Colors.transparent,
                        ),
                      )
                    : null,
              ),
              alignment: Alignment.topRight,
              child: productModel.productCartModel.cart > 0
                  ? Container(
                      height: 20,
                      width: 75,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        'In Cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 10),
            Text(
              productModel.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              productModel.brand,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff929292),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '\$ ${productModel.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff00C569),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
