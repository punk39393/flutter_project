import 'package:floor/floor.dart';
import '../../models/login_model.dart';




@dao
abstract class UserDao {

  @Query('SELECT * FROM User')
  Future<User?> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findById(int id);

  @insert
  Future<void> insertUser(User user);
}



  // @Query('SELECT * FROM Person')
  // Future<List<User>> findAllPersons();