import 'package:get/get.dart';

import '../modules/StoryDetailsPage/presentation/bindings/story_details_page_binding.dart';
import '../modules/StoryDetailsPage/presentation/views/story_details_page_view.dart';
import '../modules/StoryListPage/presentation/bindings/story_list_page_binding.dart';
import '../modules/StoryListPage/presentation/views/story_list_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STORY_LIST_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.STORY_LIST_PAGE,
      page: () => const StoryListPageView(),
      binding: StoryListPageBinding(),
    ),
    GetPage(
      name: _Paths.STORY_DETAILS_PAGE,
      page: () => StoryDetailsPageView(),
      binding: StoryDetailsPageBinding(),
    ),
    
  ];
}
