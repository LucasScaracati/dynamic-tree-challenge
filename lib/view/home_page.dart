import 'package:flutter/material.dart';
import 'package:tractian_challenge/controller/loading_home_page.dart';
import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/view/button_company.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  List<Data> apiData = [];
  @override
  void initState() {
    loadingHomePage().then((result) {
      apiData = result;
      _loading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Tractian',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF17192D),
      ),
      body: SizedBox(
        child: _loading
            ? const Center(child: Text('loading...'))
            : Column(
                children: listButtonSelectCompanies(apiData: apiData, context: context),
              ),
      ),
    );
  }
}
