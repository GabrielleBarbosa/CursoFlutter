import 'dart:io';

import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController(),
        _emailController = TextEditingController(),
        _phoneController = TextEditingController();
  bool _userEdited = false;
  Contact _editedContact;
  final _nameFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.contact == null){
      _editedContact = Contact();
    } else{
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _phoneController.text = _editedContact.phone;
      _emailController.text = _editedContact.email;
      _nameController.text = _editedContact.name;

    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(_editedContact.name ?? "Novo contato"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(_editedContact.name != null && _editedContact.name.isNotEmpty){
                Navigator.pop(context, _editedContact);
              } else {
                FocusScope.of(context).requestFocus(_nameFocus);
              }
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: _editedContact.img != null ? FileImage(File(_editedContact.img)) : AssetImage("images/contact.png"),
                          fit: BoxFit.cover
                        ),

                    ),
                  ),
                  onTap: (){
                      ImagePicker.pickImage(source: ImageSource.gallery).then((file){
                        if(file == null) return;
                        setState(() {
                          _editedContact.img = file.path;
                          _userEdited = true;
                        });
                      });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editedContact.name = text;
                    });
                  },
                  controller: _nameController,
                  focusNode: _nameFocus,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (text){
                    _userEdited = true;
                    _editedContact.email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Phone"),
                  onChanged: (text){
                    _userEdited = true;
                    _editedContact.phone = text;
                  },
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                )
              ],
            ),
          ),
        ),
    );
  }

  Future<bool> _requestPop(){
    if(_userEdited){
      showDialog(
          context: context,
        builder: (context){
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair, as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
        }
      );
      return Future.value(false);
    }
    else{
      return Future.value(true);
    }
  }
}
