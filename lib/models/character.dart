class Character{

  String name;
  String status;
  String species;
  String gender;
  String origin;
  String type;
  String lastLoc;
  String image;

  Character(this.name,this.status, this.species, this.gender, this.origin,this.type, this.lastLoc, this.image);

  Character.fromJson(Map map){
    this.name = map['name'];
    this.status = map['status'];
    this.species = map['species'];
    this.gender = map['gender'];
    this.origin = map['origin']['name'];
    this.type = map['type'];
    this.lastLoc = map['location']['name'];
    this.image = map['image'];
  }


}