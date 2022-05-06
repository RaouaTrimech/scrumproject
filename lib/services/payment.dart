import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

//to manage the response
class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({
    required this.message,
    required this.success,
  });
}

class StripeServices {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeServices.apiBase}/payment_intents';
  static Uri paymentApiUri = Uri.parse(paymentApiUrl);
  static String secret =
      'sk_test_51KtdfYKovOx4rUFHbT0r8CPMAogetb9SoHLvrgzOjqTtYDKLwWFZVrCnaBG99AxHEKPgLnuabcxDh3rB26Zl5OoN00cRVqvrWi';

  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeServices.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  //initializing the stripe payment
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
        'pk_test_51KtdfYKovOx4rUFHTZZ7fsfvFSbChZrgbFTnAoEUpqRkPCQjUPTDrZS7lqSO5XKGXzkMeBElFqnzA2pR6dU7yFSv002h7bOXFh',
        androidPayMode: 'test',
        merchantId: 'test'));

  }

  //dans paymentIntent on va passer la data
  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount, //a discuter apres car on a toujours un ticket
        'currency': currency,
      };

      var response =
      await http.post(paymentApiUri, headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (error) {
      print('error Happened while creating paymentIntent');
      throw error;
    }
  }

  //sending the request to pay
  static Future<StripeTransactionResponse> payNowHandler(
      {required String amount, required String currency}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      print(paymentMethod);
      var paymentIntent =
      await StripeServices.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));

      if (response.status == 'succeeded') {
        return StripeTransactionResponse(
            message: 'Transaction succeful', success: true);
      } else {
        return StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    }on PlatformException catch (error) {
      return StripeServices.getErrorAndAnalyze(error);
    } catch (error) {
      return StripeTransactionResponse(
          message: 'Transaction failed in the catch block', success: false);
    }
  }

  static getErrorAndAnalyze(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction canceled';
    }
    return StripeTransactionResponse(message: message, success: false);
  }
}
