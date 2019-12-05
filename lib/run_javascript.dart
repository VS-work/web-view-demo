import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RunJSInWebView extends StatefulWidget {
  @override
  RunJSInWebViewState createState() {
    return new RunJSInWebViewState();
  }
}

class RunJSInWebViewState extends State<RunJSInWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    int step = 0;
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((viewState) async {
      if (viewState.type == WebViewState.finishLoad) {
        String js;
        if (step == 0) {
          step++;
          js = """
          try {
            setTimeout(() => {
              var myAccountLnk = document.getElementById('postlks').getElementsByTagName('li')[1];
              var myAccountHref = myAccountLnk.getElementsByTagName('a')[0];
              myAccountHref.click();
            }, 500);
          } catch (e) {
            alert(e);
          }
        """;
        } else if (step == 1) {
          step++;
          js = """
          try {
            setTimeout(() => {
              var emailField = document.getElementById('inputEmailHandle');
              var passwordField = document.getElementById('inputPassword');
              var loginButton = document.getElementById('login');
              emailField.value = 'vyacheslav.chub@valor-software.com';
              passwordField.value = 'barfoo_2019';
              login.click();
            }, 500);
          } catch (e) {
            alert(e);
          }
          """;
        } else if (step == 2) {
          step++;
          js = """
          try {
            setTimeout(() => {
              var goForm = document.getElementsByTagName('form')[1];
              var goButton = goForm.getElementsByTagName('button')[0];
              goButton.click();
            }, 500);
          } catch (e) {
            alert(e);
          }
          """;
        } else if (step == 3 || step == 4 || step == 5) {
          step++;
          js = """
          try {
            setTimeout(() => {
              var goForm = document.getElementsByTagName('form')[0];
              var label = goForm.getElementsByTagName('input')[1];
              var button = goForm.getElementsByClassName('pickbutton')[0];
              label.click();
              button.click();
            }, 500);
          } catch (e) {
            alert(e);
          }
          """;
        } else if (step == 6) {
          step++;
          js = """
          try {
            setTimeout(() => {
              document.getElementsByName('PostingTitle')[0].value = 'test post';
              document.getElementsByName('GeographicArea')[0].value='Kharkov';
              document.getElementsByName('postal')[0].value = '12345';
              document.getElementsByName('PostingBody')[0].value = 'text message';
              // document.getElementsByName('remuneration')[0].value = '54321';
              // document.getElementsByTagName('option')[1].selected = true;
              document.getElementsByClassName('submit-button')[0].click();
            }, 500);
          } catch (e) {
            alert(e);
          }
          """;
        } else {
          step++;
        }
        if (js != null) {
          flutterWebviewPlugin.evalJavascript(js);
        }
      }
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://ukraine.craigslist.org',
      hidden: true,
      appBar: AppBar(title: Text("Craigslist")),
    );
  }
}
