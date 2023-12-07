class UserModel{
  final String uid;
  final String codigo;
  final String name;
  final String email;
  final String image;
  final DateTime lastActivate;
  final bool isOnline;

  const UserModel({
    required this.name,
    required this.image,
    required this.lastActivate,
    required this.uid,
    required this.email,
    required this.codigo,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic>json)=>
  UserModel(
    name: json['name'],
     image: json['image'],
      lastActivate: json['lastActivate'],
       uid: json['uid'],
        email: json['email'],
        codigo: json['codigo']);
Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'image': image,
        'email': email,
        'isOnline': isOnline,
        'lastActivate': lastActivate,
        'codigo': codigo,
      };
}