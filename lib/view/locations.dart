import 'package:flutter/material.dart';
import 'package:tractian_challenge/controller/filter/filter_alert/critical_alert_filter.dart';
import 'package:tractian_challenge/controller/filter/filter_energy/power_sensor_filter.dart';
import 'package:tractian_challenge/controller/filter/filter_text/text_filter.dart';
import 'package:tractian_challenge/controller/loading_locations.dart';
import 'package:tractian_challenge/model/data.dart';
import 'package:tractian_challenge/model/equipment.dart';
import 'package:tractian_challenge/view/assets/assets_view.dart';

class LocationsList extends StatefulWidget {
  const LocationsList({super.key});

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  bool _loading = true;
  List<Equipment> apiData = [];
  final ScrollController _scrollController = ScrollController();
  final List<Equipment> _visibleTotals = [];
  final int _itemsToLoad = 10;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final selectedCompany = ModalRoute.of(context)!.settings.arguments as Data;
      joinData(companyId: selectedCompany.id).then((result) {
        apiData = result;
        _loadMoreItems();
        _loading = false;
        setState(() {});

        _scrollController.addListener(() {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            _loadMoreItems();
          }
        });
      });
    });
    super.initState();
  }

  void _loadMoreItems() {
    setState(() {
      final int startIndex = _visibleTotals.length;
      final int endIndex = startIndex + _itemsToLoad;
      if (startIndex < apiData.length) {
        _visibleTotals.addAll(
          apiData.skip(startIndex).take(endIndex),
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool energyFilterButton = false;
  bool alertFilterButton = false;
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    final selectedCompany = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text(
            'Assets',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF17192D),
        ),
        body: _loading
            ? const Center(child: Text('Carregando'))
            : SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: widthDevice * 0.05, right: widthDevice * 0.05),
                        width: widthDevice,
                        height: heightDevice * 0.05,
                        child: TextField(
                          cursorColor: Colors.blue,
                          controller: _searchController,
                          onSubmitted: (value) {
                            alertFilterButton = false;
                            energyFilterButton = false;
                            setState(() {
                              _loading = true;
                              apiData = [];
                            });
                            _visibleTotals.clear();
                            joinDataTextFilter(companyId: selectedCompany.id, filterType: TextFilter(), text: value).then((result) {
                              apiData = result;
                              _loadMoreItems();
                              _loading = false;
                              setState(() {});
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightDevice * 0.1,
                        child: Padding(
                          padding: EdgeInsets.only(left: widthDevice * 0.05, right: widthDevice * 0.10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  _searchController.text = '';
                                  if (energyFilterButton == false) {
                                    alertFilterButton = false;
                                    energyFilterButton = true;
                                    setState(() {
                                      _loading = true;
                                    });
                                    _visibleTotals.clear();
                                    await joinDataFilter(companyId: selectedCompany.id, filterType: FilterEnergy()).then((result) {
                                      apiData = result;
                                      _loadMoreItems();
                                      _loading = false;
                                      setState(() {});
                                    });
                                  } else {
                                    alertFilterButton = false;
                                    energyFilterButton = false;
                                    setState(() {
                                      _loading = true;
                                      _visibleTotals.clear();
                                    });

                                    joinData(companyId: selectedCompany.id).then((result) {
                                      apiData = result;
                                      _loadMoreItems();
                                      _loading = false;
                                      setState(() {});
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: energyFilterButton == true ? Colors.blue : Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.electric_bolt_outlined,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                    Text(
                                      'Sensor de energia',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: widthDevice * 0.05,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  _searchController.text = '';
                                  if (alertFilterButton == false) {
                                    alertFilterButton = true;
                                    energyFilterButton = false;
                                    setState(() {
                                      _loading = true;
                                      apiData = [];
                                    });
                                    _visibleTotals.clear();
                                    joinDataFilter(companyId: selectedCompany.id, filterType: FilterAlert()).then((result) {
                                      apiData = result;
                                      _loadMoreItems();
                                      _loading = false;
                                      setState(() {});
                                    });
                                  } else {
                                    alertFilterButton = false;
                                    energyFilterButton = false;
                                    setState(() {
                                      _loading = true;
                                      _visibleTotals.clear();
                                    });

                                    joinData(companyId: selectedCompany.id).then((result) {
                                      apiData = result;
                                      _loadMoreItems();
                                      _loading = false;
                                      setState(() {});
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: alertFilterButton == true ? Colors.blue : Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                    Text(
                                      'Critico',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SizedBox(
                          width: widthDevice,
                          height: heightDevice * 0.70,
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _visibleTotals.length,
                            itemBuilder: (context, index) {
                              return buildPanel(_visibleTotals[index], context, 0);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
