import 'package:flutter/material.dart';

class LoadErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Last Action Failed',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),
      ),
    );
  }
}
