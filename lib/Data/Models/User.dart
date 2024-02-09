class User {
  String? userName;
  String? profileImage;
  List<BodyMonitors>? bodyMonitors;
  List<WorkoutPrograms>? workoutPrograms;

  User(
      {this.userName,
        this.profileImage,
        this.bodyMonitors,
        this.workoutPrograms});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    profileImage = json['profileImage'];
    if (json['bodyMonitors'] != null) {
      bodyMonitors = <BodyMonitors>[];
      json['bodyMonitors'].forEach((v) {
        bodyMonitors!.add(BodyMonitors.fromJson(v));
      });
    }
    if (json['workoutPrograms'] != null) {
      workoutPrograms = <WorkoutPrograms>[];
      json['workoutPrograms'].forEach((v) {
        workoutPrograms!.add(WorkoutPrograms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['profileImage'] = profileImage;
    if (bodyMonitors != null) {
      data['bodyMonitors'] = bodyMonitors!.map((v) => v.toJson()).toList();
    }
    if (workoutPrograms != null) {
      data['workoutPrograms'] =
          workoutPrograms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BodyMonitors {
  String? title;
  String? image;
  String? value;

  BodyMonitors({this.title, this.image, this.value});

  BodyMonitors.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['value'] = value;
    return data;
  }
}

class WorkoutPrograms {
  String? type;
  List<Items>? items;

  WorkoutPrograms({this.type, this.items});

  WorkoutPrograms.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  String? time;
  List<String>? userImages;
  String? coachImage;

  Items({this.title, this.time, this.userImages, this.coachImage});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    userImages = json['userImages'].cast<String>();
    coachImage = json['coachImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['time'] = time;
    data['userImages'] = userImages;
    data['coachImage'] = coachImage;
    return data;
  }
}