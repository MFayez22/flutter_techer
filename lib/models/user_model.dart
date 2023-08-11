class UserModel
{

  String? name;
  String? phone;
  String? id;
  String? email;
  String? password;

  UserModel({this.name,this.phone,this.id,this.email,this.password});

UserModel.forJson(Map<String ,dynamic> json)
{
  name = json['name'];
  phone = json['phone'];
  id = json['id'];
  email = json['email'];
  password = json['password'];
}

  Map<String, dynamic> toMap()
  {
    return {
      'name' :name,
      'id' :id,
      'email' :email,
      'password' :password,
      'phone' :phone,
    };
  }
}