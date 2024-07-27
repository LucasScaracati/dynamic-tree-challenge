import 'package:flutter/material.dart';
import 'package:tractian_challenge/const.dart';
import 'package:tractian_challenge/model/data.dart';

Widget _buttonSelectCompany({required Data company, required BuildContext context}) {
  double heightDevice = MediaQuery.of(context).size.height;
  double widthDevice = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () => Navigator.pushNamed(context, locationRouteName, arguments: company),
    child: Container(
      padding: EdgeInsets.only(left: widthDevice * 0.05, right: widthDevice * 0.05),
      height: heightDevice * 0.1,
      width: widthDevice * 0.80,
      decoration: const BoxDecoration(
        color: Color(0xFF2188FF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(
            height: heightDevice * 0.05,
            width: widthDevice * 0.05,
            child: Image.asset('lib/icons/companyicon.png'),
          ),
          SizedBox(
            width: widthDevice * 0.05,
          ),
          Text(
            '${company.name} Unit',
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}

List<Widget> listButtonSelectCompanies({required List<Data> apiData, required BuildContext context}) {
  List<Widget> listButtons = [];
  for (var element in apiData) {
    listButtons.add(Center(child: Padding(padding: const EdgeInsets.only(top: 50), child: _buttonSelectCompany(company: element, context: context))));
  }

  return listButtons;
}
