import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store{

  @observable
  int value = 0;

  @observable
  int value1 = 0;

  @action
  void increment(){
    value++;
  }

  void increment1(){
    value1++;
  }
}