import 'package:flutter/material.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:package_info/package_info.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageController createState() => _AboutPageController();
}

class _AboutPageController extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => _AboutPageView(this);
}

class _AboutPageView extends WidgetView<AboutPage, _AboutPageController> {
  _AboutPageView(_AboutPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        child: FutureBuilder<PackageInfo>(
          future: PackageInfo
              .fromPlatform(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("App name : "),
                      Text(snapshot.data.appName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Version : "),
                      Text(snapshot.data.version),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Build number : "),
                      Text(snapshot.data.buildNumber),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error loading app version");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
