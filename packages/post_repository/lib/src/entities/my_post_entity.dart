import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class PostEntity {
  String postId;
  String title;
  String categorys;
  String description;
  double price;
  String cep;
  String post;
  DateTime createAt;
  MyUser myUser;

  PostEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'postId': postId,
      'title': title,
      'categorys': categorys,
      'description': description,
      'price': price,
      'cep': cep,
      'post': post,
      'createAt': createAt,
      'myUser': myUser.toEntity().toDocument(),
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> doc) {
    return PostEntity(
      postId: doc['postId'] as String,
      title: doc['title'],
      categorys: doc['categorys'],
      price: doc['price'],
      cep: doc['cep'],
      description: doc['description'],
      post: doc['post'] as String,
      createAt: (doc['createAt'] as Timestamp).toDate(),
      myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'])),
    );
  }

  List<Object?> get props => [
        postId,
        title,
        categorys,
        price,
        description,
        cep,
        post,
        createAt,
        myUser
      ];

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
