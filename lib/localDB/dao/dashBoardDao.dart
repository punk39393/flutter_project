import 'package:floor/floor.dart';
import 'package:project/models/dashboard_model.dart';
import '../../models/login_model.dart';

@dao
abstract class DashBoardDao {

  @Query('SELECT * FROM User')
  Future<DashBoardDetails?> findAllData();

  @insert
  Future<void> insertData(DashBoardDetails dashBoardDetails);
}



  // @Query('SELECT * FROM Person')
  // Future<List<User>> findAllPersons();