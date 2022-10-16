import 'dart:js_util';

import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _form();
}

class _form extends State<form> {
  int _value = 0;
  var formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController asal = TextEditingController();
  TextEditingController tanggal = TextEditingController();

  void inistate() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pendaftaran')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: alamat,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: asal,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Asal Sekolah",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: tanggal,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker

                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          dateController.text = pickedDate.toString();
                        });
                      } else {
                        print("Tidak Terpilih");
                      }
                    }),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Laki-laki"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Perempuan"),
                  ],
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Simpan"))),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              name.clear();
                              alamat.clear();
                              asal.clear();
                              tanggal.clear();
                              dateController.clear();
                            },
                            child: Text("Cancel"))),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
