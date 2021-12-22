import 'package:flutter_demo/provider/count_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> hiProviders = [
  ChangeNotifierProvider(create: (_) => CountProvider()),
];
