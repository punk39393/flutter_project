import 'package:floor/floor.dart';

import '../../models/orders_model.dart';

@dao
abstract class OrdersDao {

  @Query('SELECT * FROM User')
  Future<List<Data?>> findAllOrders();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<Data?> findById(int id);

  @insert  
  Future<void> insertAllData(List<Data> data); 
}