import 'package:get/get.dart';

import '../controllers/story_list_page_controller.dart';

class StoryListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryListPageController>(
      () => StoryListPageController(),
    );
  }
}
