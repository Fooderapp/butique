import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_bottom_model.dart';
export 'payment_bottom_model.dart';

class PaymentBottomWidget extends StatefulWidget {
  const PaymentBottomWidget({Key? key}) : super(key: key);

  @override
  _PaymentBottomWidgetState createState() => _PaymentBottomWidgetState();
}

class _PaymentBottomWidgetState extends State<PaymentBottomWidget> {
  late PaymentBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowWebView(
        content:
            'https://checkout.stripe.com/c/pay/cs_test_a1LMxRGLfN5WP6L6uaLd3OJAnfvAgE0cMRGi2sy1WA3JkOuUx25H9H3jhA#fidkdWxOYHwnPyd1blpxYHZxWjA0SW9sRjVNTElISlNgQG9uMEpwVjdodHZuS05iTExfNmxfaDZLSXZhZHJ2UEFublZ9dGQ8Yms0clNnVEZTMDRwQ3BCNTdURkxQSHFmZ112d3JAcHAwN0pgNTU8QXM0dHJrfycpJ3VpbGtuQH11anZgYUxhJz8ncWB2cVo1NWJmSlQyMUJnN29md1Y8REcneCUl',
        bypass: false,
        height: 500.0,
        verticalScroll: false,
        horizontalScroll: false,
      ),
    );
  }
}
