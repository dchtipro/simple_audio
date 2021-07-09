class Questions {
  int? nro;
  int? selectAmount;
  bool? isDynamic;
  bool? allowSelectFavoriteAnswer;
  bool? isActive;
  int? version;
  String? questionType;
  List<Labels>? labels;
  List<Answers>? answers;
  List<Null>? filterMemberships;

  Questions(
      {this.nro,
      this.selectAmount,
      this.isDynamic,
      this.allowSelectFavoriteAnswer,
      this.isActive,
      this.version,
      this.questionType,
      this.labels,
      this.answers,
      this.filterMemberships});

  Questions.fromJson(Map<String, dynamic> json) {
    nro = json['nro'];
    selectAmount = json['selectAmount'];
    isDynamic = json['isDynamic'];
    allowSelectFavoriteAnswer = json['allowSelectFavoriteAnswer'];
    isActive = json['isActive'];
    version = json['version'];
    questionType = json['questionType'];
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(Labels.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    if (json['filterMemberships'] != null) {
      filterMemberships = <Null>[];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nro'] = nro;
    data['selectAmount'] = selectAmount;
    data['isDynamic'] = isDynamic;
    data['allowSelectFavoriteAnswer'] = allowSelectFavoriteAnswer;
    data['isActive'] = isActive;
    data['version'] = version;
    data['questionType'] = questionType;
    if (labels != null) {
      data['labels'] = labels!.map((v) => v.toJson()).toList();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    if (filterMemberships != null) {
      data['filterMemberships'] = filterMemberships!.map((v) => v!).toList();
    }
    return data;
  }
}

class Labels {
  String? text;
  String? code;
  String? fileName;
  String? filePath;
  bool? hasAudio;

  Labels({this.text, this.code, this.fileName, this.filePath, this.hasAudio});

  Labels.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    code = json['code'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    hasAudio = json['hasAudio'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['code'] = code;
    data['fileName'] = fileName;
    data['filePath'] = filePath;
    data['hasAudio'] = hasAudio;
    return data;
  }
}

class Answers {
  int? aNro;
  int? qNro;
  bool? isOk;
  bool? isActive;
  int? version;
  List<Labels>? labels;

  Answers(
      {this.aNro,
      this.qNro,
      this.isOk,
      this.isActive,
      this.version,
      this.labels});

  Answers.fromJson(Map<String, dynamic> json) {
    aNro = json['aNro'];
    qNro = json['qNro'];
    isOk = json['isOk'];
    isActive = json['isActive'];
    version = json['version'];
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(Labels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['aNro'] = aNro;
    data['qNro'] = qNro;
    data['isOk'] = isOk;
    data['isActive'] = isActive;
    data['version'] = version;
    if (labels != null) {
      data['labels'] = labels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
