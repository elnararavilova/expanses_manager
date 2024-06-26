import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkScreen extends StatefulWidget {
  @override
  _NetworkScreenState createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  late Future<Map<String, double?>> exchangeRates;

  Future<Map<String, double?>> fetchExchangeRates() async {
    final response = await http.get(Uri.parse(
        'https://v6.exchangerate-api.com/v6/adaa276b08114c4d562b8f30/latest/USD'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return {
        'USD': 1.0,
        'EUR': data['conversion_rates']['EUR'],
        'RUB': data['conversion_rates']['RUB'],
      };
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }

  @override
  void initState() {
    super.initState();
    exchangeRates = fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Курсы валют'),
      ),
      body: FutureBuilder<Map<String, double?>>(
        future: exchangeRates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Данные не доступны.'));
          } else {
            final rates = snapshot.data!;
            return ListView(
              children: rates.keys.map((currency) {
                final rate = rates[currency];
                final imageUrl = getCurrencyImageUrl(currency);
                return ListTile(
                  leading: Image.network(imageUrl, width: 50, height: 50),
                  title: Text(
                    '$currency: ${rate != null ? rate.toStringAsFixed(2) : 'Нет данных'}',
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  String getCurrencyImageUrl(String currency) {
    switch (currency) {
      case 'USD':
        return 'https://i.postimg.cc/132nfdtL/usd.jpg'; // Укажите URL для изображения USD
      case 'EUR':
        return 'https://i.postimg.cc/PfyMPtk9/eur.jpg'; // Укажите URL для изображения EUR
      case 'RUB':
        return 'https://i.postimg.cc/kGNMXjZP/rub.jpg'; // Укажите URL для изображения GBP
      default:
        return 'https://example.com/default.png'; // Укажите URL для изображения по умолчанию
    }
  }
}
