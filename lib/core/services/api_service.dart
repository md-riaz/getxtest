import 'package:get/get.dart';

class ApiService extends GetxService {
  Future<ApiService> init() async {
    print('ApiService initialized');
    return this;
  }
}
