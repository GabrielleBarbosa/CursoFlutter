import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Contact c = Contact();
    c.id = 1;
    c.name = "Gabi";
    c.email = "gabi@gmail.com";
    c.phone = "992295042";
    c.img = "imgTest";

    helper.saveContact(c);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
