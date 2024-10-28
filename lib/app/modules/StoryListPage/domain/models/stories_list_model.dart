
class StoriesListModel {
  Stories? stories;

  StoriesListModel({this.stories});

  StoriesListModel.fromJson(Map<String, dynamic> json) {
    if(json["stories"] is Map) {
      stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(stories != null) {
      _data["stories"] = stories?.toJson();
    }
    return _data;
  }
}

class Stories {
  List<Data>? data;

  Stories({this.data});

  Stories.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? storyId;
  String? title;
  String? starsAverage;
  String? author;
  String? image;

  Data({this.storyId, this.title, this.starsAverage, this.author, this.image});

  Data.fromJson(Map<String, dynamic> json) {
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