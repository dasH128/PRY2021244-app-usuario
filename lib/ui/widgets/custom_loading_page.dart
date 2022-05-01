import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class CustomLoadingPage extends StatelessWidget {
  const CustomLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 8),
          Text(
            "Loading ...",
            style: AppTheme.textEtiquetaStlyle,
          )
        ],
      ),
    );
  }
}
