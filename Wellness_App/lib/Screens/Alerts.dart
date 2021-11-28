import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/AlertsHelper.dart';
import 'package:nb_utils/nb_utils.dart';

class Alerts extends StatefulWidget {
  // Alerts({Key? key}) : super(key: key);

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  var emailController = new TextEditingController();
  var nameController = new TextEditingController();
  var alertController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts Section'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Card(
                child: Text('Ambrose Kyusya'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    print('Send alert clicked');
                    sendAlert(context);
                  },
                  child: Text('Send Alert')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    print('create alertee clicked, show dialog with form');
                    showAlert(context);
                  },
                  child: Text('Create Alertee')),
            ],
          ),
        ),
      ),
    );
  }

  // Methods
  showAlert(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create an alert'),
            children: [
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Whats your email address',
                              labelText: 'Email address'),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Please enter an email addresses.';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.verified_user),
                              hintText: 'Whats the recipient name',
                              labelText: 'Recipient Name'),
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Please enter a recipient name.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.verified_user),
                              hintText: 'Whats the alert message',
                              labelText: 'Alert Message'),
                          controller: alertController,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Please enter the alert message.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton.icon(
                    onPressed: () async {
                      //add alertee

                      if (_formKey.currentState.validate()) {
                        //form is valid
                        var _sPrefs = await
                            SharedPreferences.getInstance();
                        var payload = {
                          'user_id': _sPrefs.getInt('userId'),
                          'alerteeEmail': emailController.text,
                          'alerteeName': nameController.text,
                          'alertMessage': alertController.text
                        };
                        new AlertsHelper().createAlert(payload, context);
                      }

                      print('add alertee pressed');
                    },
                    icon: Icon(Icons.check),
                    label: Text('Submit')),
              ),
            ],
          );
        });
  }

  sendAlert(context) {
    //send email
    new AlertsHelper().sendAlert(context);
  }
}
