class GroupModel {

  String? name;
  String? id;



  GroupModel({
    this.name,
    this.id,

  });
  GroupModel.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];

    id = json['id'];


  }

  Map<String, dynamic> toMap()
  {
    return {
      'name' :name,
      'id' :id,

    };
  }

}