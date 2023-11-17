import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/demo_app/coin_model.dart';
import 'package:flutter_demo_project/demo_app/themes/themes.dart';

import 'main_coin_screen.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);
  final bool isDarkMode;

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  List<CoinModel>? _items;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await Dio()
        .getUri(Uri.https('api.coincap.io', '/v2/assets', {'limit': '20'}));
    //Dio().get('https://api.coincap.io/v2/assets?limit=20');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data['data'];
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => CoinModel.fromJson(e)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.isDarkMode ? darkTheme : lightTheme;
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coin Page'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MainCoinScreen(items: _items);
    }
  }
}
