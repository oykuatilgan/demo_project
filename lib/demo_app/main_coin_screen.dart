import 'package:flutter/material.dart';
import 'package:flutter_demo_project/demo_app/coin_model.dart';

class MainCoinScreen extends StatelessWidget {
  const MainCoinScreen({
    super.key,
    required List<CoinModel>? items,
  }) : _items = items;

  final List<CoinModel>? _items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: _ImageSymbol(
                      model: _items?[index],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      children: [
                        Text(_items?[index].symbol ?? 'no data'),
                        Text(
                          _items?[index].name ?? 'no data',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: _PriceColumn(
                      model: _items?[index],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: _ChangeRow(
                      model: _items?[index],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

/*
class _ImageSymbol extends StatelessWidget {
  const _ImageSymbol({
    Key? key,
    required CoinModel? model,
  })  : _model = model,
        super(key: key);

  final CoinModel? _model;

  Future<String> _loadImageUriString() async {
    String _symbolLowerCase = (_model?.symbol ?? '').toLowerCase();
    String uriString =
        'https://assets.coincap.io/assets/icons/$_symbolLowerCase@2x.png';
    return uriString;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadImageUriString(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return Image.network(snapshot.data!);
          }
        }
        return CircularProgressIndicator(); // Display a loading indicator while loading.
      },
    );
  }
}
*/
class _ImageSymbol extends StatelessWidget {
  const _ImageSymbol({
    Key? key,
    required CoinModel? model,
  })  : _model = model,
        super(key: key);

  final CoinModel? _model;

  @override
  Widget build(BuildContext context) {
    String _symbolLowerCase = (_model?.symbol ?? '').toLowerCase();
    String uriString =
        'https://assets.coincap.io/assets/icons/$_symbolLowerCase@2x.png';

    return Image.network(uriString);
  }
}

class _PriceColumn extends StatelessWidget {
  const _PriceColumn({
    Key? key,
    required CoinModel? model,
  })  : _model = model,
        super(key: key);

  final CoinModel? _model;

  @override
  Widget build(BuildContext context) {
    double? priceUsd = double.tryParse(_model?.priceUsd ?? '');
    double? marketCapUsd = double.tryParse(_model?.marketCapUsd ?? '');
    double? volumeUsd24Hr = double.tryParse(_model?.volumeUsd24Hr ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Tooltip(
          message:
              'Price: \$${priceUsd != null ? priceUsd.toStringAsFixed(2) : 'noprice'}',
          child: Text(
            'Price: \$${priceUsd != null ? priceUsd.toStringAsFixed(2) : 'noprice'}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalOffset: -20,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Tooltip(
          message:
              'Market Cap: \$${marketCapUsd != null ? marketCapUsd.toStringAsFixed(2) : 'noprice'}',
          child: Text(
            'Market Cap: \$${marketCapUsd != null ? marketCapUsd.toStringAsFixed(2) : 'noprice'}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalOffset: -20,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Tooltip(
          message:
              'Volume: \$${volumeUsd24Hr != null ? volumeUsd24Hr.toStringAsFixed(2) : 'noprice'}',
          child: Text(
            'Volume: \$${volumeUsd24Hr != null ? volumeUsd24Hr.toStringAsFixed(2) : 'noprice'}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalOffset: -20,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

class _ChangeRow extends StatelessWidget {
  const _ChangeRow({
    Key? key,
    required CoinModel? model,
  })  : _model = model,
        super(key: key);

  final CoinModel? _model;

  @override
  Widget build(BuildContext context) {
    double? changePercent24Hr =
        double.tryParse(_model?.changePercent24Hr ?? '');
    Color _arrowColor;
    bool _changeVal;

    if (changePercent24Hr != null && changePercent24Hr > 0) {
      _arrowColor = Colors.green;
      _changeVal = true;
    } else if (changePercent24Hr != null && changePercent24Hr < 0) {
      _arrowColor = Colors.red;
      _changeVal = false;
    } else {
      _arrowColor = Colors.transparent;
      _changeVal = false;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          (_changeVal ? Icons.add : Icons.remove),
          size: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ),
        Text(
            '%${changePercent24Hr != null ? changePercent24Hr.toStringAsFixed(2) : 'noprice'}'),
        Icon(_changeVal ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: _arrowColor),
      ],
    );
  }
}
