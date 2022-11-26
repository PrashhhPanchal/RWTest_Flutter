
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ToDoModel
{
  String time = "";

  String task = "";

  ToDoModel({
    this.time = "",
    this.task = ""
  });

  void addNewTask(List<ToDoModel> toDOList) {
    var lastTime = DateFormat("hh:mm aa").parse(toDOList.last.time).add(Duration(hours: 1));
    if (lastTime.hour <= 19) {
      var time = DateFormat("hh:mm aa").format(lastTime);
      toDOList.add(ToDoModel(time: time));
    } else {
      Fluttertoast.showToast(msg: "You can not add new time slot...");
    }
  }

  void prepapreToDO(List<ToDoModel> toDOList, int addHour) {
    for (int i = 0; i < 7; i++) {
      var date = DateFormat("dd/MM/yyyy").parse(DateFormat("dd/MM/yyyy").format(DateTime.now()));
      date = date.add(Duration(hours: addHour));
      var time = DateFormat("hh:mm aa").format(date);
      toDOList.add(ToDoModel(time: time));
      addHour++;
    }
  }

  void printTask(List<ToDoModel> toDOList) {
    for (int i = 0; i < toDOList.length; i++) {
      if (toDOList[i].task.isNotEmpty) {
        print("To-Do Task : ${toDOList[i].time} || ${toDOList[i].task}");
      }
    }
  }
}