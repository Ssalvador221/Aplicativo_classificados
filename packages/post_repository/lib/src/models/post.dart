import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

class Post {
  String postId;
  String title;
  String categorys;
  String description;
  double price;
  String cep;
  String post;
  DateTime createAt;
  MyUser myUser;

  Post({
    required this.postId,
    required this.title,
    required this.categorys,
    required this.description,
    required this.price,
    required this.cep,
    required this.post,
    required this.createAt,
    required this.myUser,
  });

  /// Empty user which represents an unauthenticated user.
  static final empty = Post(
      postId: '',
      post: '',
      createAt: DateTime.now(),
      myUser: MyUser.empty,
      title: '',
      categorys: '',
      description: '',
      price: 0,
      cep: '');

  /// Modify MyUser parameters
  Post copyWith(
      {String? postId,
      String? title,
      String? categorys,
      String? description,
      double? price,
      String? cep,
      String? post,
      DateTime? createAt,
      MyUser? myUser}) {
    return Post(
      postId: postId ?? this.postId,
      post: post ?? this.post,
      createAt: createAt ?? this.createAt,
      myUser: myUser ?? this.myUser,
      title: title ?? this.title,
      categorys: categorys ?? this.categorys,
      description: description ?? this.description,
      price: price ?? this.price,
      cep: cep ?? this.cep,
    );
  }

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == Post.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      post: post,
      createAt: createAt,
      myUser: myUser,
      title: title,
      categorys: categorys,
      description: description,
      price: price,
      cep: cep,
    );
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
        postId: entity.postId,
        post: entity.post,
        createAt: entity.createAt,
        myUser: entity.myUser,
        title: entity.title,
        categorys: entity.categorys,
        description: entity.description,
        price: entity.price,
        cep: entity.cep);
  }

  @override
  String toString() {
    return '''PostEntity: {
      postId: $postId
      title: $title
      categorys: $categorys
      description: $description
      price: $price
      cep: $cep
      post: $post
      createAt: $createAt
      myUser: $myUser
    }''';
  }
}
