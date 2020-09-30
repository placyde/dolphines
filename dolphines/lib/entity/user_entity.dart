 import 'package:floor/floor.dart';

@Entity(tableName: 'user')
 class User {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String password;
  final String userType;
  final String phoneNumber;
  final String email;
  @ColumnInfo(name: 'create_time', nullable: false)
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;

   User({this.id, this.name, this.password, this.userType, this.phoneNumber, this.email, String createTime, this.updateTime}) : this.createTime = createTime ?? DateTime.now().toString();
 }