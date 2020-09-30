 import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'washOption',
foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: CarWasher,
    ),
    ForeignKey(
      childColumns: ['carwash_id'],
      parentColumns: ['id'],
      entity: WashType,
    )
  ],)
 class WashOption {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String washOptionName;
  @ColumnInfo(name: 'owner_id')
  final int ownerId;
  @ColumnInfo(name: 'carwash_id')
  final int carwashId;

  WashOption({this.id, this.washOptionName, this.ownerId, this.carwashId});
 }