class FeedbackForm {
  String name;
  String regno;
  String sec;
  String issue;
  String type;

  FeedbackForm(this.name, this.regno, this.sec, this.issue, this.type);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['regno']}", "${json['sec']}",
        "${json['issue']}", "${json['type']}");
  }

  // Method to make GET parameters.
  Map toJson() =>
      {'name': name, 'regno': regno, 'sec': sec, 'issue': issue, 'type': type};
}
