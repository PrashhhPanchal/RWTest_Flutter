
import 'package:flutter/material.dart';
import 'package:rw_test_flutter/helper/ColorRes.dart';
import 'package:rw_test_flutter/model/ToDoModel.dart';

class MainScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>
{
  int addHour = 9;
  List<ToDoModel> toDOList = <ToDoModel>[];

  @override
  void initState() {
    // TODO: implement initState
    ToDoModel().prepapreToDO(toDOList, addHour);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ColorRes.primaryColor,
        title: Text(
          "To-Do App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ToDoModel().printTask(toDOList);
            },
            icon: Icon(Icons.apps_sharp, size: 25, color: ColorRes.white,),
          )
        ],
      ),
      body: _todoListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ToDoModel().addNewTask(toDOList);
          setState(() {});
        },
        child: Icon(Icons.add, size: 25, color: ColorRes.white,),
      ),
    );
  }

  Widget _todoListWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: toDOList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      toDOList[index].time,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      onChanged: (value) {
                        toDOList[index].task = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your To-Do here..."
                      ),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}