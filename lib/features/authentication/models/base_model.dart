abstract class BaseModel {
  Map<String, dynamic> toJson();

  List<String> validate() {
    return [];
  }
}
