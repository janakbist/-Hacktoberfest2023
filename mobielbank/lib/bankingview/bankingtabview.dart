import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobielbank/bankingview/internetbankingtab.dart';
import 'package:mobielbank/bankingview/mobilebankingtab.dart';

class BankingTabView extends StatefulWidget {
  const BankingTabView({super.key});

  @override
  State<StatefulWidget> createState() => _BankingTabView();

}

class _BankingTabView extends State<BankingTabView> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16.0,left: 16,right: 16,bottom: 1),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: const Color.fromARGB(221, 158, 156, 156),width: sqrt1_2),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(border: Border(bottom: BorderSide.none)),
              tabs: const [
                  Tab(child: Text("Mobile Banking",style: TextStyle(fontSize: 16),),),
                  Tab(child: Text("Internet Banking",style: TextStyle(fontSize: 16),),),
                ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(           
            controller: _tabController,
            children: [
              MobileBankingTab(tabController: _tabController,),
              InternetBankingTab(tabController: _tabController,),
            ],
          ),
        ),
      ],
    );
  }
}