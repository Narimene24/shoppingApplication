
class User {
  int id;
  String firstName;
  String lastName;
  String emailAddress;
  String password;

  userMap(){
    var mapping = Map<String, dynamic>();

    mapping ['id'] = id;
    mapping ['firstName'] = firstName;
    mapping ['lastName'] = lastName;
    mapping ['emailAddress'] = emailAddress;
    mapping ['password'] = password;

    return mapping;
  }


}