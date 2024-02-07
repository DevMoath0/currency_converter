import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network.dart';

class CurrencyApi {
  final TextEditingController _sarController;
  final TextEditingController _usdController;

  //Instance for getting the apiKey and host.
  Network network = Network();

  CurrencyApi(this._sarController, this._usdController);

  Future<void> convertCurrency({required bool fromSAR}) async {
    String fromCurrency = fromSAR ? 'SAR' : 'USD';
    String toCurrency = fromSAR ? 'USD' : 'SAR';

    TextEditingController fromController =
        fromSAR ? _sarController : _usdController;

    final amount = fromController.text;
    if (amount.isEmpty) return;

    try {
      String apiKey = network.apiKey;
      String host = network.host;

      //Parse the desired input to the api
      final Uri url = Uri.parse(
          'https://currency-converter18.p.rapidapi.com/api/v1/convert?from=$fromCurrency&to=$toCurrency&amount=$amount');
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': host,
        },
      );

      //If the response is successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse['success']) {
          final result = jsonResponse['result'];
          if (result != null) {
            final convertedAmount = result['convertedAmount'];
            //Assuming fromSAR is true, update USD controller, otherwise update SAR controller
            if (fromSAR) {
              _usdController.text = convertedAmount.toStringAsFixed(2);
            } else {
              _sarController.text = convertedAmount.toStringAsFixed(2);
            }
          }
        } else {
          print('Conversion failed or invalid response');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
