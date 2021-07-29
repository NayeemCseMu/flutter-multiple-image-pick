import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UploadHelper {
  UploadHelper._();
  static final UploadHelper _instance = UploadHelper._();
  static UploadHelper get instance => _instance;

/*-----------------multi_image_picker-----------------*/
  Future<List<Asset>> upload() async {
    List<Asset> _images = [];
    List<Asset> resultList = [];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: false,
        selectedAssets: _images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Pick Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    _images = resultList;
    return _images;
  }

/*-----------------file_picker-----------------*/

  Future<List<File>> openFileManager() async {
    FilePickerResult? _filePickerResult;
    late List<File> _filesPathList = [];

    try {
      _filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (_filePickerResult!.files.isNotEmpty) {
        // _filesPathList =
        //     _filePickerResult.paths.map((path) => File(path)).toList();
      } else {
        // User canceled the picker
        print("User canceled");
      }
    } on PlatformException catch (e) {
      print('error $e');
    }
    return _filesPathList;
  }
}
