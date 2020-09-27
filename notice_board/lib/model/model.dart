class News {
  final String title;
  final String description;
  final String id;
  final String author;

  News({this.title, this.description, this.id, this.author});

  News.fromMap(Map<String, dynamic> data, String id)
      : title = data["title"],
        description = data['description'],
        author = data["author"],
        id = id;

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description, "author": author};
  }
}
