class UserCreationRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? gender;
  String? age;

  UserCreationRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
