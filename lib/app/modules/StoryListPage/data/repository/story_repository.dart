import 'dart:convert';

import '../../domain/models/stories_list_model.dart';
import '../data_source/story_list_service.dart';

class StoryRepository {
  StoriesListApiService storiesListApiProvider = StoriesListApiService();

  Future<dynamic> getStories() async {
    final response = await storiesListApiProvider.fetchStories();

    // if (response.statusCode == 200) {
      var res = StoriesListModel.fromJson(response);
      return res;
    // } else {
    //   throw Exception('Failed to fetch stories');
    // }
  }
}
