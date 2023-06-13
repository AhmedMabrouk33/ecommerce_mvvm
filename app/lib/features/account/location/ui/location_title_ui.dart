import 'package:flutter/material.dart';

import '../constants/location_bottom_sheet_configuration.dart';

class LocationTitleUi {
  final void Function(int? index) editMethod;
  final void Function(int index) deleteMethod;
  final void Function(int index) onTap;

  const LocationTitleUi({
    required this.editMethod,
    required this.deleteMethod,
    required this.onTap,
  });

  Widget buildWidget({
    required String title,
    required String details,
    required int locationIndex,
    required bool isMainLocation,
  }) {
    return Card(
      surfaceTintColor: const Color.fromARGB(214, 217, 217, 217),
      color: const Color.fromARGB(214, 217, 217, 217),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
      child: InkWell(
        onTap: () => onTap(locationIndex),
        child: SizedBox(
          height: 130,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 15),
              !isMainLocation
                  ? LocationBottomSheetConfiguration.unselectedIcon
                  : LocationBottomSheetConfiguration.selectedIcon,
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff53532F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        details,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              PopupMenuButton(
                onSelected: (selectedIndex) => selectedIndex == 0
                    ? editMethod(locationIndex)
                    : deleteMethod(locationIndex),
                iconSize: 35,
                icon: LocationBottomSheetConfiguration.popMenuIcon,
                // color: const Color(0xff3D976C),
                color: const Color(0xffAECAB1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                // surfaceTintColor: ,

                itemBuilder: (context) => const <PopupMenuItem>[
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LocationBottomSheetConfiguration.editIcon,
                        SizedBox(width: 10),
                        Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LocationBottomSheetConfiguration.deleteIcon,
                        SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
