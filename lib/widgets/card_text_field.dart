import 'package:country_flags/country_flags.dart';
import 'package:currency_converter/constants.dart';
import 'package:flutter/material.dart';

class CardTextField extends StatelessWidget {
  const CardTextField({
    super.key,
    required TextEditingController inputController,
    required String country,
    required String placeHolder,
  })  : _inputController = inputController,
        _country = country,
        _placeHolder = placeHolder;

  final TextEditingController _inputController;
  final String _country;
  final String _placeHolder;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CountryFlag.fromCountryCode(
          _country,
          height: 48,
          width: 62,
          borderRadius: 10,
        ),
        title: TextField(
          controller: _inputController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kBabyBlue,
                width: 3,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
                width: 3,
              ),
            ),
            label: Text(_placeHolder),
          ),
        ),
      ),
    );
  }
}
