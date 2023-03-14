import 'package:dio/dio.dart';


import '../../constant/Strings.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: AppString.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: 20 * 1000,
        sendTimeout: 20 * 1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get(AppString.endPointChar);
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
