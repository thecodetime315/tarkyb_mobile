part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool forceRefresh;
  final baseUrl = "https://mashaghil.ip4s.com";
  final String _branch = "6";

  DioHelper({this.forceRefresh = true, required this.context}) {
      _dio = Dio(
        BaseOptions(
            baseUrl: baseUrl,
            contentType: "application/x-www-form-urlencoded; charset=utf-8"),
      )
        ..interceptors.add(_getCacheManager().interceptor)
        ..interceptors.add(LogInterceptor(responseBody: true));
    }


  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }



  Options _buildCacheOptions(Map<String, dynamic> body, {bool subKey = true}) {
    return buildCacheOptions(const Duration(hours: 1),
        maxStale: const Duration(days: 1),
        forceRefresh: forceRefresh,
        subKey: subKey ? json.encode(body) : "");
  }

  Future<dynamic> get(String url, Map<String, dynamic> body) async {
    body.addAll({"branch_id": _branch});
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    var response = await _dio.post("$baseUrl$url",
        data: FormData.fromMap(body), options: _buildCacheOptions(body));
    if (response.statusCode == 200) {
      var data = response.data;
      if (data["key"] == 1) {
        return data;
      } else {
        SnackBarHelper.showBasicSnack(msg:data["msg"].toString());
      }
    } else if (response.statusCode == 401 || response.statusCode == 301) {
      logout();
    } else {
      SnackBarHelper.showBasicSnack(msg:tr(context,"checkNet"));
    }
    return null;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    AppLoaderHelper.showLoadingDialog();
    body.addAll({"branch_id": _branch});
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    var response = await _dio.post("$baseUrl$url",
        data: FormData.fromMap(body), options: _buildCacheOptions(body));
    print("response ${response.statusCode}");

    if (response.statusCode == 200) {
      var data = response.data;
      print(response.data);
      if (data["key"] == 1) {
        EasyLoading.dismiss();
        SnackBarHelper.showBasicSnack(msg:data["msg"].toString());
        return data;
      } else {
        EasyLoading.dismiss();
        SnackBarHelper.showBasicSnack(msg:data["msg"].toString());
      }
    } else if (response.statusCode == 401 || response.statusCode == 301) {
      logout();
    } else {
      EasyLoading.dismiss();
      SnackBarHelper.showBasicSnack(msg:tr(context,"chickNet"));
    }
    return null;
  }

  Future<dynamic> uploadFile(String url, Map<String, dynamic> body) async {
    AppLoaderHelper.showLoadingDialog();
    body.addAll({"branch_id": _branch});
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method
    var response = await _dio.post("$baseUrl$url",
        data: formData, options: _buildCacheOptions(body, subKey: false));

    if (response.statusCode == 200) {
      var data = response.data;
      if (data["key"] == 1) {
        EasyLoading.dismiss();
        SnackBarHelper.showBasicSnack(msg:data["msg"].toString());
        return data;
      } else {
        EasyLoading.dismiss();
        SnackBarHelper.showBasicSnack(msg:data["msg"].toString());
      }
    } else if (response.statusCode == 401 || response.statusCode == 301) {
      logout();
    } else {
      EasyLoading.dismiss();
      SnackBarHelper.showBasicSnack(msg:tr(context,"chickNet"));
    }
    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    log(
        "-------------------------------------------------------------------");
    log(body.toString());
    log(
        "-------------------------------------------------------------------");
  }

  _getHeader() async {
    // todo : add Token
    // String token = GlobalState.instance.get("token") ?? "";
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ',
    };
  }

  Future<void> logout() async {
    AppLoaderHelper.showLoadingDialog();
    String? deviceId = await Utils.getDeviceId();
    Map<String, dynamic> body = {
      // "lang":context.read<LangBloc>().state.lang,
      // "user_id":context.read<UserCubit>().state.model.id,
      "device_id": deviceId
    };
    log(body.toString());
    await DioHelper(context: context).get("/api/v1/logout", body);
    EasyLoading.dismiss().then((value) {
      Utils.clearSavedData();
      Phoenix.rebirth(context);
    });
  }
}
