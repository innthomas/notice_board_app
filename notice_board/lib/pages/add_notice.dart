import 'package:flutter/material.dart';
import 'package:notice_board/firebase_service/firebase_service.dart';
import 'package:notice_board/model/model.dart';

class AddNewsPage extends StatefulWidget {
  final News news;

  const AddNewsPage({Key key, this.news}) : super(key: key);
  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _authorController;
  FocusNode _descriptionNode;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: isEditNews ? widget.news.title : '');
    _descriptionController =
        TextEditingController(text: isEditNews ? widget.news.description : '');
    _authorController =
        TextEditingController(text: isEditNews ? widget.news.author : '');
    _descriptionNode = FocusNode();
  }

  get isEditNews => widget.news != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditNews ? 'Edit Notice' : 'Add Notice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Title cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _descriptionNode,
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _authorController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "author",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditNews ? "Update" : "Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditNews) {
                        News news = News(
                          description: _descriptionController.text,
                          title: _titleController.text,
                          id: widget.news.id,
                          author: widget.news.author,
                        );
                        await FirestoreService().updateNews(news);
                        Navigator.pop(context);
                      } else {
                        News news = News(
                          description: _descriptionController.text,
                          title: _titleController.text,
                          author: _authorController.text,
                        );
                        await FirestoreService().addNews(news);
                      }
                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
