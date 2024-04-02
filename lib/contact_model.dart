import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final String? lastName;

  ContactModel(
      {required this.name, required this.phoneNumber, required this.lastName});
}
