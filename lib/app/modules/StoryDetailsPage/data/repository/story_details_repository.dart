import 'dart:convert';
import '../../domain/models/stories_details_model.dart';
import '../data_source/story_details_service.dart';

class StoryDetailsRepository {
  StoryDetailsService storyDetailsService = StoryDetailsService();

  Future<dynamic> fetchStoryDetails(storyId) async {
    final response = await storyDetailsService.getStoryDetails(storyId);
    if (response.statusCode == 200) {
      return StoriesDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch stories');
    }
  }
}
