import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio();

  DioClient() {
    // إعداد الـ Interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // إضافة headers هنا
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';
        return handler.next(options); // تابع إلى الطلب
      },
      onResponse: (response, handler) {
        // معالجة الاستجابة هنا إذا كنت بحاجة إلى
        return handler.next(response); // تابع إلى الاستجابة
      },
      onError: (DioError e, handler) {
        // معالجة الأخطاء هنا
        String errorMessage = _handleError(e);
        return handler.reject(DioError(
          requestOptions: e.requestOptions,
          error: errorMessage,
          response: e.response,
          type: e.type,
        ));
      },
    ));
  }

  String _handleError(DioError e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return 'Bad Request';
        case 401:
          return 'Unauthorized';
        case 404:
          return 'Not Found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Unexpected error: ${e.message}';
      }
    } else {
      return 'Connection failed: ${e.message}';
    }
  }
}
