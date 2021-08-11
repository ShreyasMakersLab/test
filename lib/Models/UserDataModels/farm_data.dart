class FarmModel {
  int farmID;
  String farmName;
  int farmSize;

  FarmModel({this.farmID, this.farmName, this.farmSize});

  FarmModel.fromMap(Map<String, dynamic> map) {
    farmID = map['farmID'];
    farmName = map['farmName'];
    farmSize = map['farmSize'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farmID'] = this.farmID;
    data['farmName'] = this.farmName;
    data['farmSize'] = this.farmSize;
    return data;
  }
}
