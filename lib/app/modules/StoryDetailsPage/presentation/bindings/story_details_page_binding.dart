import 'package:get/get.dart';

import '../controllers/story_details_page_controller.dart';

class StoryDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryDetailsController>(
      () => StoryDetailsController(),
    );
  }
}
