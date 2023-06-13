import '../../features/account/location/repositories/location_test.dart';
import '../../features/account/location/repositories/location_repository.dart';

import '../../features/account/profile/repositories/profile_test.dart';
import '../../features/account/profile/repositories/profile_repository.dart';

class ApplicationRepositories {
  static const ProfileRepository profileRepository = ProfileTest();
  static const LocationRepository locationRepository = LocationTest();
}
