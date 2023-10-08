import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StripeCheckoutCall {
  static Future<ApiCallResponse> call({
    String? sk = '',
    String? acc = '',
    String? priceID = '',
    String? successUrl = '',
    String? cancelUrl = '',
    int? fee,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Checkout',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${sk}',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Account': '${acc}',
      },
      params: {
        'line_items[][price]': priceID,
        'line_items[][quantity]': 1,
        'mode': "payment",
        'success_url': successUrl,
        'cancel_url': cancelUrl,
        'payment_intent_data[application_fee_amount]': fee,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
