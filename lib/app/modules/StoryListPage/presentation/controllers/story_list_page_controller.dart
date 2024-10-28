import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:stories_list/app/common/fake_data.dart';
import '../../../StoryDetailsPage/presentation/views/story_details_page_view.dart';
import '../../data/repository/story_repository.dart';

class StoryListPageController extends GetxController with StateMixin<dynamic> {
  //TODO: Implement StoryListPageController
  StoryRepository storyRepository = StoryRepository();

  @override
  void onInit() {
    // print(fake_data);
    fetchStories();
    super.onInit();
  }

  void fetchStories() async {
    try {
      change(null, status: RxStatus.loading());
      final stories = await storyRepository.getStories();
      change(stories, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void navigateToStoryDetails(int storyId) {
    Get.to(() => StoryDetailsPageView(), arguments: storyId);
  }
}
