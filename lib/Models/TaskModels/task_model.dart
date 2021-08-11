class TaskModel {
  int taskID;
  String mainTask;
  String subTask;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  int taskColor;
  String taskStatus;
  String priority;
  int selectedCropID;
  //select crop id

  TaskModel(
      {this.taskID,
      this.mainTask,
      this.subTask,
      this.startDate,
      this.startTime,
      this.endDate,
      this.endTime,
      this.priority,
      this.selectedCropID,
      this.taskColor,
      this.taskStatus});

  Map<String, dynamic> toMap() {
    // used when inserting data endTime the database
    return <String, dynamic>{
      "taskID": taskID,
      "mainTask": mainTask,
      "subTask": subTask,
      "startDate": startDate,
      "startTime": startTime,
      "endDate": endDate,
      "endTime": endTime,
      "priority": priority,
      "selectedCropID": selectedCropID,
      "taskColor": taskColor,
      "taskStatus": taskStatus
    };
  }

  TaskModel.fromJson(Map<String, dynamic> data) {
    taskID = data['taskID'];
    mainTask = data['mainTask'];
    subTask = data["subTask"];
    startDate = data["startDate"];
    startTime = data["startTime"];
    endDate = data["endDate"];
    endTime = data["endTime"];
    priority = data['priority'];
    selectedCropID = data['selectedCropID'];
    taskColor = data["taskColor"];
    taskStatus = data["taskStatus"];
  }
}
