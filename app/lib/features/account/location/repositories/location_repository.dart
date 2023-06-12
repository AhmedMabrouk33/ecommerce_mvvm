import '../models/location_model.dart';

abstract class LocationRepository {
  Future<List<LocationModel>> fetchAllUserLocation(String userId);
  Future<LocationModel> sendNewLocation({
    required String userId,
    required LocationModel newLocation,
  });
  Future<LocationModel> updateLocation({
    required LocationModel location,
  });

  Future<void> deleteLocation(String locationId);
}
