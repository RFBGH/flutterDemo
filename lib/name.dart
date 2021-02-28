import 'package:mobx/mobx.dart';

part 'name.g.dart';

class Name = NameBase with _$Name;

abstract class NameBase with Store{

  @observable
  String name = "old name";

  @action
  void setName(String name){
    this.name = name;
  }
}