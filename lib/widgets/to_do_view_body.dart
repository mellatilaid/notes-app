import 'package:flutter/material.dart';

class ToDoViewBody extends StatefulWidget {
  const ToDoViewBody({super.key});

  @override
  State<ToDoViewBody> createState() => _ToDoViewBodyState();
}

class _ToDoViewBodyState extends State<ToDoViewBody> {
  List<String> toDoItems = [];
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<TextEditingController> controllers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*controllers.add(TextEditingController());
    focusNodes.add(FocusNode());*/
    /*focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    });*/
  }

  @override
  void dispose() {
    // Dispose all controllers
    /*for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }*/
    super.dispose();
    focusNode.dispose();
    controller.dispose();
  }

  void _showAddToDoDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add To-Do Item'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < toDoItems.length; i++)
                      CheckboxListTile(
                        value: false,
                        onChanged: (bool? value) {
                          if (value!) {
                            setState(
                              () {
                                toDoItems.removeAt(i);
                              },
                            );
                          }
                        },
                        title: Text(toDoItems[i]),
                      ),
                    TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Enter to-do item',
                      ),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (String value) {
                        setState(
                          () {
                            toDoItems.add(value);
                          },
                        );
                        controller.clear();
                        FocusScope.of(context).requestFocus(focusNode);
                      },
                    )
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                if (focusNode.hasFocus) {
                  FocusScope.of(context).unfocus();
                }

                Navigator.pop(context);

                controller.clear();
                toDoItems.clear();
                //focusNode.clear();
                //controllers.add(TextEditingController());
                //focusNode.add(FocusNode());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _showAddToDoDialog,
        child: const Text('Add To-Do'),
      ),
    );
  }
}
