import 'package:klausse/repositories/repository.dart';
import 'package:klausse/user.dart';

class UserService {
  Repository repository;

  UserService(){
    repository = Repository();
  }


  saveUser(User user) async{
    return await repository.insertData('user', user.userMap());
  }
}