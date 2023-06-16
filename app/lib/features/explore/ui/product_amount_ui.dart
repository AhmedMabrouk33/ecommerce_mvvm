import 'package:flutter/material.dart';

class ProductAmountUi {
  static Widget showAmountAction({
    required int amount,
    required VoidCallback incrementAction,
    required VoidCallback decrementAction,
  }) {
    return amount > 0
        ? Expanded(
            child: Container(
              height: 47,
              width: 180,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.3),
                // FIXME: Border Side @ top and bottom.
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(61, 151, 108, 0.64),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: incrementAction,
                      child: Container(
                        height: 47,
                        width: 47,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color.fromRGBO(61, 151, 108, 0.64),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 39,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        amount.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: decrementAction,
                      child: Container(
                        height: 47,
                        width: 47,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color(0xffD9D9D9),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Color.fromRGBO(61, 151, 108, 0.84),
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 39,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : ElevatedButton(
            onPressed: incrementAction,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(136, 47),
              backgroundColor: const Color.fromRGBO(61, 151, 108, 0.64),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            child: const Text('ADD'),
          );
  }
}
