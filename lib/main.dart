import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thein_test/common/constants.dart';
import 'package:thein_test/components/exhibit_card.dart';
import 'package:thein_test/models/exhibit.dart';
import 'package:thein_test/services/exhibit_http_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<List<Exhibit>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = ExhibitsGet().getExhibitList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Technical task for Flutter',
          style: TextStyle(color: darkColor),
        ),
        backgroundColor: primaryLightColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: FutureBuilder<List<Exhibit>>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExhibitCard(exhibit: snapshot.data![index]);
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
