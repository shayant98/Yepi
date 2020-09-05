class UserModel {
  final String id;
  final String name;
  final String surname;
  final String phone;
  final String email;

  UserModel({this.id, this.name, this.surname, this.phone, this.email});

  UserModel.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        surname = data['surname'],
        name = data['name'],
        phone = data['phone'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
    };
  }
}
