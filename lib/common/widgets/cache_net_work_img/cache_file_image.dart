import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

class CacheFileImage {
  /// 获取url字符串的MD5值
  String getUrlMd5(String url) {
    var content = Utf8Encoder().convert(url);
    var digest = md5.convert(content);
    return digest.toString();
  }

  /// 获取图片缓存路劲
  Future<String> getCachePath() =>
      getApplicationDocumentsDirectory().then((dir) {
        var cachePath = Directory("${dir.path}/imagecache/");
        if (!cachePath.existsSync()) cachePath.createSync();
        return Future.value(cachePath.path);
      });

  /// 判斷是否有对应图片缓存文件存在
  Future<Uint8List> getFileBytes(String url) =>
      getCachePath().then((cacheDirPath) {
        var file = File("$cacheDirPath/${getUrlMd5(url)}");
        if (file.existsSync()) return Future.value(file.readAsBytes());
        return Future.value(null);
      });

  /// 将下载的图片数据缓存到指定文件
  Future<File> saveBytesToFiles(String url, Uint8List bytes) =>
      getCachePath().then((cacheDirPath) {
        var file = File("$cacheDirPath/${getUrlMd5(url)}");
        if (!file.existsSync()) file.createSync();
        return file.writeAsBytes(bytes);
      });
}
