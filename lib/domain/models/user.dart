class User {
  final int id;
  final String numberId;
  final String name;
  final String lastName;
  final String? direccion;
  final String? telefono;

  User({
    required this.id,
    required this.numberId,
    required this.name,
    required this.lastName,
    required this.direccion,
    required this.telefono,
  });

/*
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        numberId: json['numberId'],
        name: json['name'],
        lastName: json['lastName'],
        direccion: json['direccion'],
        telefono: json['telefono']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numberId': numberId,
      'name': name,
      'lastName': lastName,
      'direccion': direccion,
      'telefono': telefono,
    };
  }
  */
}
