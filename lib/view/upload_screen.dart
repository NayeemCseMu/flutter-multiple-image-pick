import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:multiplle_image_uploads/controller/controller.dart';

class UploadScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Uploads"),
          actions: [
            controller.selectedImages.isNotEmpty
                ? IconButton(
                    onPressed: () async {
                      // await controller.putAsset();
                      controller.selectedImages.clear();
                    },
                    icon: Icon(Icons.done))
                : IconButton(
                    onPressed: () async {
                      await controller.putAsset();
                    },
                    icon: Icon(Icons.add))
          ],
        ),
        body: controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.selectedImages.isEmpty
                ? Center(
                    child: Text(
                      "Select From Gallery\nTap top bar + icon.",
                      textAlign: TextAlign.center,
                    ),
                  )
                : GridView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: controller.selectedImages
                        .map(
                          (element) => AssetThumb(
                            asset: element,
                            width: 300,
                            height: 300,
                            spinner: Center(child: Text("Loading...")),
                          ),
                        )
                        .toList(),
                  ),
      ),
    );
  }
}
