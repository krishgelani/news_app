/// page : 1
/// per_page : 1
/// videos : [{"id":3571264,"width":3840,"height":2160,"duration":33,"full_res":null,"tags":[],"url":"https://www.pexels.com/video/drone-view-of-big-waves-rushing-to-the-shore-3571264/","image":"https://images.pexels.com/videos/3571264/free-video-3571264.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200","avg_color":null,"user":{"id":1498112,"name":"Enrique Hoyos","url":"https://www.pexels.com/@enriquehoyos"},"video_files":[{"id":368793,"quality":"sd","file_type":"video/mp4","width":960,"height":540,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=165&oauth2_token_id=57447761"},{"id":368794,"quality":"sd","file_type":"video/mp4","width":426,"height":240,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=139&oauth2_token_id=57447761"},{"id":368795,"quality":"hd","file_type":"video/mp4","width":2560,"height":1440,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=170&oauth2_token_id=57447761"},{"id":368796,"quality":"hd","file_type":"video/mp4","width":1280,"height":720,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=174&oauth2_token_id=57447761"},{"id":368797,"quality":"sd","file_type":"video/mp4","width":640,"height":360,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=164&oauth2_token_id=57447761"},{"id":368798,"quality":"hd","file_type":"video/mp4","width":3840,"height":2160,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=172&oauth2_token_id=57447761"},{"id":368799,"quality":"hd","file_type":"video/mp4","width":1920,"height":1080,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=175&oauth2_token_id=57447761"}],"video_pictures":[{"id":815098,"nr":0,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-0.jpg"},{"id":815099,"nr":1,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-1.jpg"},{"id":815100,"nr":2,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-2.jpg"},{"id":815101,"nr":3,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-3.jpg"},{"id":815102,"nr":4,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-4.jpg"},{"id":815103,"nr":5,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-5.jpg"},{"id":815104,"nr":6,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-6.jpg"},{"id":815105,"nr":7,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-7.jpg"},{"id":815106,"nr":8,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-8.jpg"},{"id":815107,"nr":9,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-9.jpg"},{"id":815108,"nr":10,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-10.jpg"},{"id":815109,"nr":11,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-11.jpg"},{"id":815110,"nr":12,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-12.jpg"},{"id":815111,"nr":13,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-13.jpg"},{"id":815112,"nr":14,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-14.jpg"}]}]
/// total_results : 8000
/// next_page : "https://api.pexels.com/v1/videos/search/?page=2&per_page=1&query=nature"
/// url : "https://api-server.pexels.com/search/videos/nature/"

class VideoModel {
  VideoModel({
      num? page, 
      num? perPage, 
      List<Videos>? videos, 
      num? totalResults, 
      String? nextPage, 
      String? url,}){
    _page = page;
    _perPage = perPage;
    _videos = videos;
    _totalResults = totalResults;
    _nextPage = nextPage;
    _url = url;
}

  VideoModel.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    if (json['videos'] != null) {
      _videos = [];
      json['videos'].forEach((v) {
        _videos?.add(Videos.fromJson(v));
      });
    }
    _totalResults = json['total_results'];
    _nextPage = json['next_page'];
    _url = json['url'];
  }
  num? _page;
  num? _perPage;
  List<Videos>? _videos;
  num? _totalResults;
  String? _nextPage;
  String? _url;
VideoModel copyWith({  num? page,
  num? perPage,
  List<Videos>? videos,
  num? totalResults,
  String? nextPage,
  String? url,
}) => VideoModel(  page: page ?? _page,
  perPage: perPage ?? _perPage,
  videos: videos ?? _videos,
  totalResults: totalResults ?? _totalResults,
  nextPage: nextPage ?? _nextPage,
  url: url ?? _url,
);
  num? get page => _page;
  num? get perPage => _perPage;
  List<Videos>? get videos => _videos;
  num? get totalResults => _totalResults;
  String? get nextPage => _nextPage;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    if (_videos != null) {
      map['videos'] = _videos?.map((v) => v.toJson()).toList();
    }
    map['total_results'] = _totalResults;
    map['next_page'] = _nextPage;
    map['url'] = _url;
    return map;
  }

}

/// id : 3571264
/// width : 3840
/// height : 2160
/// duration : 33
/// full_res : null
/// tags : []
/// url : "https://www.pexels.com/video/drone-view-of-big-waves-rushing-to-the-shore-3571264/"
/// image : "https://images.pexels.com/videos/3571264/free-video-3571264.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200"
/// avg_color : null
/// user : {"id":1498112,"name":"Enrique Hoyos","url":"https://www.pexels.com/@enriquehoyos"}
/// video_files : [{"id":368793,"quality":"sd","file_type":"video/mp4","width":960,"height":540,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=165&oauth2_token_id=57447761"},{"id":368794,"quality":"sd","file_type":"video/mp4","width":426,"height":240,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=139&oauth2_token_id=57447761"},{"id":368795,"quality":"hd","file_type":"video/mp4","width":2560,"height":1440,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=170&oauth2_token_id=57447761"},{"id":368796,"quality":"hd","file_type":"video/mp4","width":1280,"height":720,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=174&oauth2_token_id=57447761"},{"id":368797,"quality":"sd","file_type":"video/mp4","width":640,"height":360,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=164&oauth2_token_id=57447761"},{"id":368798,"quality":"hd","file_type":"video/mp4","width":3840,"height":2160,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=172&oauth2_token_id=57447761"},{"id":368799,"quality":"hd","file_type":"video/mp4","width":1920,"height":1080,"fps":29.97,"link":"https://player.vimeo.com/external/384761655.hd.mp4?s=5eecd63d94629aa928726912a5601a7577a3ca8a&profile_id=175&oauth2_token_id=57447761"}]
/// video_pictures : [{"id":815098,"nr":0,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-0.jpg"},{"id":815099,"nr":1,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-1.jpg"},{"id":815100,"nr":2,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-2.jpg"},{"id":815101,"nr":3,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-3.jpg"},{"id":815102,"nr":4,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-4.jpg"},{"id":815103,"nr":5,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-5.jpg"},{"id":815104,"nr":6,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-6.jpg"},{"id":815105,"nr":7,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-7.jpg"},{"id":815106,"nr":8,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-8.jpg"},{"id":815107,"nr":9,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-9.jpg"},{"id":815108,"nr":10,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-10.jpg"},{"id":815109,"nr":11,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-11.jpg"},{"id":815110,"nr":12,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-12.jpg"},{"id":815111,"nr":13,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-13.jpg"},{"id":815112,"nr":14,"picture":"https://images.pexels.com/videos/3571264/pictures/preview-14.jpg"}]

class Videos {
  Videos({
      num? id, 
      num? width, 
      num? height, 
      num? duration, 
      dynamic fullRes, 
      List<dynamic>? tags, 
      String? url, 
      String? image, 
      dynamic avgColor, 
      User? user, 
      List<VideoFiles>? videoFiles, 
      List<VideoPictures>? videoPictures,}){
    _id = id;
    _width = width;
    _height = height;
    _duration = duration;
    _fullRes = fullRes;
    _tags = tags;
    _url = url;
    _image = image;
    _avgColor = avgColor;
    _user = user;
    _videoFiles = videoFiles;
    _videoPictures = videoPictures;
}

  Videos.fromJson(dynamic json) {
    _id = json['id'];
    _width = json['width'];
    _height = json['height'];
    _duration = json['duration'];
    _fullRes = json['full_res'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(VideoModel.fromJson(v));
      });
    }
    _url = json['url'];
    _image = json['image'];
    _avgColor = json['avg_color'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['video_files'] != null) {
      _videoFiles = [];
      json['video_files'].forEach((v) {
        _videoFiles?.add(VideoFiles.fromJson(v));
      });
    }
    if (json['video_pictures'] != null) {
      _videoPictures = [];
      json['video_pictures'].forEach((v) {
        _videoPictures?.add(VideoPictures.fromJson(v));
      });
    }
  }
  num? _id;
  num? _width;
  num? _height;
  num? _duration;
  dynamic _fullRes;
  List<dynamic>? _tags;
  String? _url;
  String? _image;
  dynamic _avgColor;
  User? _user;
  List<VideoFiles>? _videoFiles;
  List<VideoPictures>? _videoPictures;
Videos copyWith({  num? id,
  num? width,
  num? height,
  num? duration,
  dynamic fullRes,
  List<dynamic>? tags,
  String? url,
  String? image,
  dynamic avgColor,
  User? user,
  List<VideoFiles>? videoFiles,
  List<VideoPictures>? videoPictures,
}) => Videos(  id: id ?? _id,
  width: width ?? _width,
  height: height ?? _height,
  duration: duration ?? _duration,
  fullRes: fullRes ?? _fullRes,
  tags: tags ?? _tags,
  url: url ?? _url,
  image: image ?? _image,
  avgColor: avgColor ?? _avgColor,
  user: user ?? _user,
  videoFiles: videoFiles ?? _videoFiles,
  videoPictures: videoPictures ?? _videoPictures,
);
  num? get id => _id;
  num? get width => _width;
  num? get height => _height;
  num? get duration => _duration;
  dynamic get fullRes => _fullRes;
  List<dynamic>? get tags => _tags;
  String? get url => _url;
  String? get image => _image;
  dynamic get avgColor => _avgColor;
  User? get user => _user;
  List<VideoFiles>? get videoFiles => _videoFiles;
  List<VideoPictures>? get videoPictures => _videoPictures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['width'] = _width;
    map['height'] = _height;
    map['duration'] = _duration;
    map['full_res'] = _fullRes;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['url'] = _url;
    map['image'] = _image;
    map['avg_color'] = _avgColor;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_videoFiles != null) {
      map['video_files'] = _videoFiles?.map((v) => v.toJson()).toList();
    }
    if (_videoPictures != null) {
      map['video_pictures'] = _videoPictures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 815098
/// nr : 0
/// picture : "https://images.pexels.com/videos/3571264/pictures/preview-0.jpg"

class VideoPictures {
  VideoPictures({
      num? id, 
      num? nr, 
      String? picture,}){
    _id = id;
    _nr = nr;
    _picture = picture;
}

  VideoPictures.fromJson(dynamic json) {
    _id = json['id'];
    _nr = json['nr'];
    _picture = json['picture'];
  }
  num? _id;
  num? _nr;
  String? _picture;
VideoPictures copyWith({  num? id,
  num? nr,
  String? picture,
}) => VideoPictures(  id: id ?? _id,
  nr: nr ?? _nr,
  picture: picture ?? _picture,
);
  num? get id => _id;
  num? get nr => _nr;
  String? get picture => _picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nr'] = _nr;
    map['picture'] = _picture;
    return map;
  }

}

/// id : 368793
/// quality : "sd"
/// file_type : "video/mp4"
/// width : 960
/// height : 540
/// fps : 29.97
/// link : "https://player.vimeo.com/external/384761655.sd.mp4?s=383ab4dbc773cd0d5ece3af208d8f963368f67e4&profile_id=165&oauth2_token_id=57447761"

class VideoFiles {
  VideoFiles({
      num? id, 
      String? quality, 
      String? fileType, 
      num? width, 
      num? height, 
      num? fps, 
      String? link,}){
    _id = id;
    _quality = quality;
    _fileType = fileType;
    _width = width;
    _height = height;
    _fps = fps;
    _link = link;
}

  VideoFiles.fromJson(dynamic json) {
    _id = json['id'];
    _quality = json['quality'];
    _fileType = json['file_type'];
    _width = json['width'];
    _height = json['height'];
    _fps = json['fps'];
    _link = json['link'];
  }
  num? _id;
  String? _quality;
  String? _fileType;
  num? _width;
  num? _height;
  num? _fps;
  String? _link;
VideoFiles copyWith({  num? id,
  String? quality,
  String? fileType,
  num? width,
  num? height,
  num? fps,
  String? link,
}) => VideoFiles(  id: id ?? _id,
  quality: quality ?? _quality,
  fileType: fileType ?? _fileType,
  width: width ?? _width,
  height: height ?? _height,
  fps: fps ?? _fps,
  link: link ?? _link,
);
  num? get id => _id;
  String? get quality => _quality;
  String? get fileType => _fileType;
  num? get width => _width;
  num? get height => _height;
  num? get fps => _fps;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quality'] = _quality;
    map['file_type'] = _fileType;
    map['width'] = _width;
    map['height'] = _height;
    map['fps'] = _fps;
    map['link'] = _link;
    return map;
  }

}

/// id : 1498112
/// name : "Enrique Hoyos"
/// url : "https://www.pexels.com/@enriquehoyos"

class User {
  User({
      num? id, 
      String? name, 
      String? url,}){
    _id = id;
    _name = name;
    _url = url;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
  }
  num? _id;
  String? _name;
  String? _url;
User copyWith({  num? id,
  String? name,
  String? url,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  url: url ?? _url,
);
  num? get id => _id;
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}