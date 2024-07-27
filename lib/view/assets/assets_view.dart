import 'package:flutter/material.dart';
import 'package:tractian_challenge/model/equipment.dart';

ListView assets({required List<Equipment> apiData, required BuildContext context}) {
  ListView widgetList = ListView.builder(
    itemCount: apiData.length,
    itemBuilder: (context, index) {
      return buildPanel(apiData[index], context, 0);
    },
  );

  return widgetList;
}

Widget buildPanel(Equipment total, BuildContext context, double padding) {
  double heightDevice = MediaQuery.of(context).size.height;
  double widthDevice = MediaQuery.of(context).size.width;
  if (total.children!.isEmpty) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: SizedBox(
        child: Row(
          children: [
            total.isLocal
                ? const SizedBox(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                  )
                : SizedBox(
                    height: heightDevice * 0.05,
                    width: widthDevice * 0.05,
                    child: Image.asset('lib/icons/assetboxsensor.png'),
                  ),
            SizedBox(
              width: widthDevice * 0.6,
              child: Text(
                total.name,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            total.status == 'alert'
                ? const SizedBox(
                    child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 6,
                  ))
                : total.sensorType == "energy"
                    ? const SizedBox(
                        child: Icon(
                          Icons.electric_bolt_outlined,
                          color: Colors.green,
                          size: 13,
                        ),
                      )
                    : const SizedBox()
          ],
        ),
      ),
    );
  }
  return ExpansionTile(
    title: Row(
      children: [
        total.isLocal
            ? const SizedBox(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                ),
              )
            : SizedBox(
                height: heightDevice * 0.05,
                width: widthDevice * 0.05,
                child: Image.asset('lib/icons/assetbox.png'),
              ),
        Text(
          total.name,
          style: const TextStyle(fontSize: 13),
        ),
        total.status == 'alert'
            ? const SizedBox(
                child: Icon(
                Icons.circle,
                color: Colors.red,
                size: 6,
              ))
            : total.sensorType == "energy"
                ? const SizedBox(
                    child: Icon(
                    Icons.electric_bolt_outlined,
                    color: Colors.green,
                    size: 13,
                  ))
                : const SizedBox()
      ],
    ),
    childrenPadding: EdgeInsets.only(left: padding),
    children: total.children!.map((subTotal) => buildPanel(subTotal, context, padding + 7)).toList(),
  );
}
