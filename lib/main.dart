import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/viewmodel.dart';

void main() async {
  Get.put<ViewModel>(ViewModel());

  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _tcontroller = TextEditingController();
  final repository = Get.find<ViewModel>();


  @override
  void initState() {
    super.initState();
    repository.api();
    _tcontroller;
  }

  @override
  void dispose() {
    _tcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API test',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _tcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '검색',
                labelText: 'ID',
                prefixIcon: Icon(Icons.perm_identity),
              ),
             onChanged: (text) {
             },
            ),
            ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Card(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          Image.network('${repository.jsonF[index].previewURL}',fit: BoxFit.cover,),
                          Text('${repository.jsonF[index].tags}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
