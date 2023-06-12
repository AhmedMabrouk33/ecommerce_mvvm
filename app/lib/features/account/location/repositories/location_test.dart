import '../models/location_model.dart';

import './location_repository.dart';

// FIXME: Remove this import.
import 'dart:math';

class LocationTest implements LocationRepository {
  const LocationTest();
  @override
  Future<void> deleteLocation(String locationId) async {
    await Future.delayed(const Duration(seconds: 5));
    // throw 'Can\'t delete, Please try again';
  }

  @override
  Future<List<LocationModel>> fetchAllUserLocation(String userId) {
    // TODO: implement fetchAllUserLocation
    throw UnimplementedError();
  }

  @override
  Future<LocationModel> sendNewLocation({
    required String userId,
    required LocationModel newLocation,
  }) async {
    await Future.delayed(const Duration(seconds: 10));
    // throw 'Can\'t upload new location in test mode';
    try {
      return LocationModel.fromJson(
        {
          'id': (Random().nextInt(100) + 2).toString(),
          'title': newLocation.title,
          'buildingNo': newLocation.buildingNo,
          'flatNo': newLocation.flatNo,
          'streetAddress': newLocation.streetAddress,
          'city': newLocation.city,
          'area': newLocation.area,
          'isMainAddress': newLocation.isMainAddress,
        },
      );
    } catch (error) {
      print('Error Message is $error');
      throw 'Can\'t upload new location in test mode';
    }
  }

  @override
  Future<LocationModel> updateLocation({
    required LocationModel location,
  }) async {
    await Future.delayed(const Duration(seconds: 20));
    return LocationModel.fromJson(
      {
        'id': location.id,
        'title': location.title,
        'buildingNo': location.buildingNo,
        'flatNo': location.flatNo,
        'streetAddress': location.streetAddress,
        'city': location.city,
        'area': location.area,
        'isMainAddress': location.isMainAddress,
      },
    );
    // TODO: implement updateLocation
    // throw 'There is error please try again';
  }
}
