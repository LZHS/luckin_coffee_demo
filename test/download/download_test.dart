import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Download_test", () async {

    var dio = Dio();
    dio.interceptors.add(LogInterceptor());

    var url =
        "https://imtt.dd.qq.com/16891/apk/F0F77A2D3CB9F96B2C912DE7452AA3FD.apk?fsname=com.moji.mjweather_8.0405.02_8040502.apk&csr=1bbd";

    // var url = "https://www.baidu.com/img/bdlogo.gif";
    await download1(dio, url, "./example/apk.apk");

  });
}


Future download1(Dio dio, String url, savePath) async {
  // CancelToken cancelToken = CancelToken();
  try {
    await dio.download(url, savePath,
        onReceiveProgress: showDownloadProgress);
  } catch (e) {
    print(e);
  }
}

//Another way to downloading small file
Future download2(Dio dio, String url, String savePath) async {
  try {
    Response response = await dio.get(
      url,
      onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      // options: Options(
      //     responseType: ResponseType.bytes,
      //     followRedirects: false,
      //     receiveTimeout: 0),
    );
    // print(response.headers);
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    // response.data is List<int> type
    raf.writeFromSync(response.data);
    await raf.close();
  } catch (e) {
    print(e);
  }
}
var countReceived=0;
void showDownloadProgress(int received, int total) {
  if (total != -1) {

    print("${(received/( 1024*1024)).toStringAsFixed(2)}/${(total/(1024*1024)).toStringAsFixed(2)}MB");
    print((received / total * 100).toStringAsFixed(2) + "%");
  }
}