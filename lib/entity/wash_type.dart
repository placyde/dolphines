 import 'package:floor/floor.dart';

@Entity(tableName: 'washType')
 class WashType {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String washName;
  final String washPrice;
  @ColumnInfo(name: 'create_time', nullable: false)
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;
   WashType({this.id, this.washName, this.washPrice, String createTime, this.updateTime}) : this.createTime = createTime ?? DateTime.now().toString();
 }