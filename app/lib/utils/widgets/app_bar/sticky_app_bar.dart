import 'package:flutter/material.dart';

class StickyAppBar {
  static Widget buildAppBar({
    required String imageNetworkUrl,
    required VoidCallback popAction,
    required VoidCallback favouriteAction,
    required bool isFavourite,
  }) {
    return Container(
      height: 189,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: imageNetworkUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(imageNetworkUrl),
                fit: BoxFit.fitHeight,
              )
            : null,
      ),
      child: Container(
        height: 60,
        width: double.infinity,
        color: const Color.fromRGBO(217, 217, 217, 0.1),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: popAction,
              child: const CircleAvatar(
                radius: 22.5,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Icon(
                  Icons.chevron_left_outlined,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            InkWell(
              onTap: favouriteAction,
              child: const CircleAvatar(
                radius: 22.5,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Icon(
                  Icons.star_border_purple500_outlined,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
