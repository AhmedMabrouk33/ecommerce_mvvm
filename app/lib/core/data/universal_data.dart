import '../../features/account/profile/models/profile_model.dart';
import '../../features/account/location/models/location_model.dart';

import '../../features/explore/models/product_model.dart';

ProfileModel userData = ProfileModel(
  id: 0,
  userName: 'Ahmed mohamed mabrouk',
  userEmail: 'ahmedmabrouk3394@gmail.com',
  userPassword: 'password1234',
  userImage:
      'https://images.unsplash.com/photo-1608155686393-8fdd966d784d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
);

List<LocationModel> userLocations = [
  LocationModel(
    id: '0',
    title: 'title',
    buildingNo: 'buildingNo',
    flatNo: 'flatNo',
    streetAddress: 'streetAddress',
    city: 'city',
    area: 'area',
    isMainAddress: false,
  ),
  LocationModel(
    id: '1',
    title: 'title1',
    buildingNo: 'buildingNo1',
    flatNo: 'flatNo1',
    streetAddress: 'streetAddress1',
    city: 'city1',
    area: 'area1',
    isMainAddress: true,
  ),
];

List<ProductModel> products = [];

List<ProductModel> bestSellingProducts = [];

List<ProductModel> cartProducts = [];
