
class StoriesDetailsModel {
  int? storyId;
  String? title;
  String? starsAverage;
  String? author;
  String? image;

  StoriesDetailsModel({this.storyId, this.title, this.starsAverage, this.author, this.image});

  StoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    if(json["story_id"] is int) {
      storyId = json["story_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["stars_average"] is String) {
      starsAverage = json["stars_average"];
    }
    if(json["author"] is String) {
      author = json["author"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["story_id"] = storyId;
    _data["title"] = title;
    _data["stars_average"] = starsAverage;
    _data["author"] = author;
    _data["image"] = image;
    return _data;
  }
}