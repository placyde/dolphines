 import 'package:floor/floor.dart';

import 'entity.dart';

@Entity(tableName: 'carWash',
foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: CarWash,
    ),
    ForeignKey(
      childColumns: ['cartypeownerId'],
      parentColumns: ['id'],
      entity: CarType,
    ),

      ],)
 class CarWash {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String matricule;
  final String washPrice;
  @ColumnInfo(name: 'owner_id')
  final int ownerId;
  @ColumnInfo(name: 'cartypeownerId')
  final int cartypeownerId;

  @ColumnInfo(name: 'washerid')
  final int washer;
  @ColumnInfo(name: 'create_time', nullable: false)
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;
  
  CarWash({this.id, this.matricule, this.washPrice, this.ownerId, this.cartypeownerId, this.washer,  String createTime, this.updateTime}) : this.createTime = createTime ?? DateTime.now().toString();
 }