import 'dart:io';

import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:multiplle_image_uploads/utils/upload_helper.dart';

class Controller extends GetxController {
  var isLoading = false.obs;
  var selectedImages = <Asset>[].obs;
  var selected = <File>[].obs;

  Future putAsset() async {
    try {
      isLoading(true);
      final result = await UploadHelper.instance.upload();
      if (result.isNotEmpty) {
        selectedImages.assignAll(result);
        update();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future putFiles() async {
    try {
      isLoading(true);
      final result = await UploadHelper.instance.openFileManager();
      if (result.isNotEmpty) {
        // selected.assignAll(result);
        update();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
