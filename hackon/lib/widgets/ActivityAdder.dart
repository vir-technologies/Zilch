import 'package:flutter/material.dart';

// MENU
int weight = 0;

// this widget will be used to add activities to the calendar
class ActivityAdder extends StatefulWidget {
  // final String title;

  ActivityAdder({Key? key}) : super(key: key);
  // It is stateful -. has State obj containing fields that affect how it looks.
  // This class is the configuration for the state. holds the values (eg title)
  // provided by the parent (eg App widget) and used by the build method of the
  // State. Fields in a Widget subclass are always marked "final".

  @override
  _ActivityAdderState createState() => _ActivityAdderState();
}

class _ActivityAdderState extends State<ActivityAdder> {
  // place changeable fields here

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final otherController = TextEditingController();

  int _counter = 0;

  @override
  void dispose() {
    // Clean up the controller(s) when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("increment counter pressed");
    });
  }

  // adds a textfield.
  // invalidCondition is a function in a form of (x) => [boolean expression]
  // x is the "value" of the texfield input. eg. if it cant be empty:

  Padding textField(String labelText, TextEditingController controller,
      [String? invalidMessage, bool Function(String?)? isInvalid]) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: (value) {
          if (isInvalid != null && isInvalid(value)) {
            return invalidMessage;
          } else
            return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new Activity"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'YEET COUNTER:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                textField("Activity Name", nameController, "cannot be empty",
                    (x) => (x == null || x.isEmpty)),
                textField(
                    "some other field", otherController), // todo: delete this
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: ElevatedButton(
                      child: Text('Add Activity'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // if valid, display snackbar (pop-up at bottom screen)
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Activity saved')));
                          addActivityToCalendar();
                        }
                      }),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // this one can be deleted, but it looks neat
        onPressed: _incrementCounter,
        tooltip: 'Increments the counter',
        child: Icon(Icons.add),
      ),
    );
  }

  //  makes activity and adds it to calendar based on textbox values
  void addActivityToCalendar() {
    print("adding activity:" + nameController.text);
    // stub
  }
}
