// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      createdAt: json['createdAt'],
      email: json['email'] as String,
      followersCount: json['followersCount'] as int,
      followingsCount: json['followingsCount'] as int,
      userName: json['userName'] as String,
      userImageURL: json['userImageURL'] as String,
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'email': instance.email,
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
      'userName': instance.userName,
      'userImageURL': instance.userImageURL,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
    };
