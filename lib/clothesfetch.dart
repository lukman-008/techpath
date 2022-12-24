import 'package:flutter/material.dart';
import 'package:flutter_application_1/clothesremote_data.dart';
import 'package:flutter_application_1/foomodel.dart';

class clothesfetch extends StatefulWidget {
  const clothesfetch({super.key});

  @override
  State<clothesfetch> createState() => _clothesfetchState();
}

class _clothesfetchState extends State<clothesfetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CLOTHES SUPPLIES"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<List<UserModel>>(
                stream: FirestoreHelper1.read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("some error occured"),
                    );
                  }
                  if (snapshot.hasData) {
                    final userdata = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                          itemCount: userdata!.length,
                          itemBuilder: (context, index) {
                            final singleuser = userdata[index];
                            return Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 7, left: 15, right: 15),
                              child: ListTile(
                                tileColor: Color.fromARGB(255, 220, 217, 217),
                                title: Text("Name :- ${singleuser.name}" +
                                    "\nEmail :- ${singleuser.email}" +
                                    "\nContact :- ${singleuser.contact}" +
                                    "\nAddress :- ${singleuser.address}" +
                                    "\nQuantity :- ${singleuser.total}" +
                                    "\nDescription :- ${singleuser.descr}"),
                              ),
                            );
                          }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
