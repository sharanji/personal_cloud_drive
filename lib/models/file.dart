class FileModel {
  int? id;
  int? userId;
  String? fileName;
  String? mimeType;
  String? fileSize;
  String? lastUpdated;

  FileModel({this.id, this.userId, this.fileName, this.mimeType, this.fileSize, this.lastUpdated});

  FileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    fileName = json['fileName'];
    mimeType = json['mimeType'];
    fileSize = json['fileSize'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['fileName'] = this.fileName;
    data['mimeType'] = this.mimeType;
    data['fileSize'] = this.fileSize;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}
