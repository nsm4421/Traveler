import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:photo_manager/photo_manager.dart';

@lazySingleton
mixin class AssetMixIn {
  Future<File> xFile2File(XFile xFile) async {
    return File(xFile.path);
  }

  Future<File> asset2File(AssetEntity asset) async {
    final data = await asset.originBytes;
    final dir = await Directory.systemTemp.createTemp();
    final file = File('${dir.path}/${asset.id}.jpg');
    await file.writeAsBytes(data!);
    return file;
  }

  Future<File> compressFile(File file,
      {int quality = 80, int rotate = 0}) async {
    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.path.replaceFirst('.jpg', '_cmp.jpg'),
      quality: quality,
      rotate: rotate,
    ).then((res) => File(res!.path));
  }
}
