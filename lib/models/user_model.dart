class UserModel
{

  String? name;
  String? phone;
  String? id;
  String? email;
  String? password;
  bool? isAdmin;

  UserModel({this.name,this.phone,this.id,this.email,this.password,this.isAdmin});

UserModel.forJson(Map<String ,dynamic> json)
{
  name = json['name'];
  phone = json['phone'];
  id = json['id'];
  email = json['email'];
  password = json['password'];
  isAdmin = json['isAdmin'];
}

  Map<String, dynamic> toMap()
  {
    return {
      'name' :name,
      'id' :id,
      'email' :email,
      'password' :password,
      'phone' :phone,
      'isAdmin' :isAdmin,
    };
  }
}