import 'package:flutter/widgets.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There Are No Suitable Products',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
