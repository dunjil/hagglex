import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/country_provider.dart';
import 'screens/welcome_screen.dart';
import 'utils/graphql_config.dart';
import 'utils/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => AuthProvider()),
                ChangeNotifierProvider(create: (_) => CountryProvider()),
              ],
              child: GraphQLProvider(
                client: graphQLConfiguration.client,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'HaggleX',
                  theme: ThemeData(),
                  home: WelcomeScreen(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
