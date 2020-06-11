import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'UsersResponse.g.dart';

@JsonSerializable()
class UsersResponse {

	@JsonKey(name: "results")
	final List<UserModel> users;

	final Info info;

  UsersResponse(this.users, this.info);

	factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
	Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}

@JsonSerializable()
class Info {

	final int page;

	Info(this.page);

	factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
	Map<String, dynamic> toJson() => _$InfoToJson(this);

}

@JsonSerializable()
class UserModel {

	final UserName name;
	final UserPicture picture;
	final String email;
	final String gender;
	final String phone;

	UserModel(this.name, this.picture, this.email, this.gender, this.phone);

	factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
	Map<String, dynamic> toJson() => _$UserModelToJson(this);

}

@JsonSerializable()
class UserName {

	final String first;
	final String last;

	String get fullname => '$first $last';

  UserName(this.first, this.last);

	factory UserName.fromJson(Map<String, dynamic> json) => _$UserNameFromJson(json);
	Map<String, dynamic> toJson() => _$UserNameToJson(this);


}

@JsonSerializable()
class UserPicture {

	final String large;
	final String medium;
	final String thumbnail;

  UserPicture(this.large, this.medium, this.thumbnail);

  factory UserPicture.fromJson(Map<String, dynamic> json) => _$UserPictureFromJson(json);
  Map<String, dynamic> toJson() => _$UserPictureToJson(this);

}