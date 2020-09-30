 import 'package:floor/floor.dart';

@Entity(tableName: 'carWasher')
 class CarWasher {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String fisrtName;
  final String lastName;
  final String matricule;
  final String alias;
  final String cniNumber;
  final String phone;
  final String picture;
  @ColumnInfo(name: 'create_time', nullable: false)
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;
  CarWasher({this.id, this.fisrtName, this.lastName, this.matricule, this.alias, this.cniNumber, this.phone, this.picture, String createTime, this.updateTime}) : this.createTime = createTime ?? DateTime.now().toString();
 }