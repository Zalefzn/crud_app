class UserModel {
  late String id;
  late String title;
  late String firstName;
  late String lastName;
  late String picture;

  UserModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    };
  }
}
