import 'package:flutter/material.dart';

class PayingButton extends StatefulWidget {
  const PayingButton({super.key});

  @override
  State<PayingButton> createState() => _PayingButtonState();
}

class _PayingButtonState extends State<PayingButton> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(child: Text('Pay now')),
              content: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Amount',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Center(
                    child: Text(
                      'Pay',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('Payment Sucessfull!!!'),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Pay',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
