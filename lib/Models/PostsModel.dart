class PostsModel {
  PostsModel({
    required num userId,
    required num id,
    required String title,
    required String body,
  })   : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  PostsModel.fromJson(dynamic json)
      : _userId = json['userId'],
        _id = json['id'],
        _title = json['title'],
        _body = json['body'];

  final num _userId;
  final num _id;
  final String _title;
  final String _body;

  PostsModel copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) =>
      PostsModel(
        userId: userId ?? _userId,
        id: id ?? _id,
        title: title ?? _title,
        body: body ?? _body,
      );

  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  String get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
}
