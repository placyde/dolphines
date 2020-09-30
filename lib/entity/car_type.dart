 import 'package:floor/floor.dart';

@Entity(tableName: 'carType')
 class CarType {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String typeName;
  @ColumnInfo(name: 'create_time', nullable: false)
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;
   CarType( {this.id, this.typeName,  String createTime, this.updateTime }) : this.createTime = createTime ?? DateTime.now().toString();
 }