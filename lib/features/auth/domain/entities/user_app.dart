class UserApp {
  String name;
  String? id;
  String email;
  String phone;
String ?role  ; 
String  ? password ; 

  UserApp({
    required this.name,
    required this.phone,
    required this.email,
    required this.role , 
    this.password ,
     this.id,
  });
}
