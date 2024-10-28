import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stories_list/app/common/fake_data.dart';

class StoryDetailsService {
  Future<dynamic> getStoryDetails(storyId) async {
    // Making fake API call to fetch story details :)
    // final response =
    //     await http.post(Uri.parse(url), body: {"storyid": storyId.toString()});
    
    return fake_data["list"]!["data"]!.elementAt(storyId);
  }
}
