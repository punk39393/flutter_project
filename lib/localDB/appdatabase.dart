import 'dart:async';
import 'package:floor/floor.dart';
import 'package:project/models/dashboard_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:project/localDB/dao/userDao.dart';
import 'package:project/models/login_model.dart';
import '../models/orders_model.dart';
import 'dao/dashBoardDao.dart';
import 'dao/ordersDao.dart';

part 'appdatabase.g.dart';

@Database(version: 1, entities: [User,Data,DashBoardDetails])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  OrdersDao get ordersDao;
  DashBoardDao get dashBoardDao;

}
