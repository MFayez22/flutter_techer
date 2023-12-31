class StudentModel {

  String? name;
  String? id;
  String? email;
  String? password;
  String? phone;
  String? groupId;
  String? groupName;
  String? userId;
  bool? isAdmin;



  StudentModel({
    this.name,
    this.id,
    this.email,
    this.password,
    this.phone,
    this.groupId,
    this.groupName,
    this.userId,
    this.isAdmin,
  });
  StudentModel.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    groupId = json['groupId'];
    groupName = json['groupName'];
    userId = json['userId'];
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
      'groupId' :groupId,
      'groupName' :groupName,
      'userId' :userId,
      'isAdmin' :isAdmin,
    };
  }

}