class CropModel {
  int cropID;
  String cropName;
  String farmSelected;
  int farmSizeSelected;
  String sowingDate;
  //image

  CropModel(
      {this.cropID,
      this.cropName,
      this.farmSelected,
      this.farmSizeSelected,
      this.sowingDate});

  CropModel.fromMap(Map<String, dynamic> json) {
    cropID = json['cropID'];
    cropName = json['cropName'];
    farmSelected = json['farmSelected'];
    farmSizeSelected = json['farmSizeSelected'];
    sowingDate = json['sowingDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cropID'] = this.cropID;
    data['cropName'] = this.cropName;
    data['farmSelected'] = this.farmSelected;
    data['farmSizeSelected'] = this.farmSizeSelected;
    data['sowingDate'] = this.sowingDate;
    return data;
  }
}
