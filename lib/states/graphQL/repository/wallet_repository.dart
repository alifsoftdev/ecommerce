import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../model/add_payee_response_model.dart';
import '../../model/add_wallet_money_response_model.dart';
import '../../model/cart_id_response_model.dart';
import '../../model/delete_payee.dart';
import '../../model/order_response_model.dart';
import '../../model/payee_list_response_model.dart';
import '../../model/payment_methods_response_model.dart';
import '../../model/transaction_list_response_model.dart';
import '../../model/transfer_money_response_model.dart';
import '../../model/wallet_balance_response_model.dart';
import '../../model/wallet_option_response_model.dart';
import '../../model/wallet_payment_model.dart';
import '../../model/wallet_transfer_code_response_model.dart';
import '../HelperUtils/global_constant.dart';
import '../graphql_provider.dart';

abstract class IWalletRepository {
  Future<AddPayeeModel> addPayee(
      int customerID, String name, String email, String confEmail);

  Future<PayeeListResponseModel> getPayeeList(int customerID);

  Future<DeletePayeeResponseModel> deletePayee(int payeeID);

  Future<TransactionListResponseModel> getTransactionListApi(int customerID);

  Future<CartIdResponseModel> getCartIDApi();
}

class WalletRepository implements IWalletRepository {
  @override
  Future<AddPayeeModel> addPayee(
      int customerID, String name, String email, String confEmail) async {
    late AddPayeeModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    print('$customerID');
    final MutationOptions options = MutationOptions(
        document: parseString('''

 mutation {
  addpayee(
      customerId: $customerID,
      nickName:"$name",
      customerEmail: "$email",
      confirmEmail: "$confEmail"
  ){
      message
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      responseData = AddPayeeModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  @override
  Future<PayeeListResponseModel> getPayeeList(int customerID) async {
    late PayeeListResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final QueryOptions options = QueryOptions(
        document: parseString('''

query {
  addedpayeeslist(customerId: $customerID) {
      PayeeId
    Nick_name
    Email_address
    Status
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.query(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = PayeeListResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  @override
  Future<DeletePayeeResponseModel> deletePayee(int payeeID) async {
    late DeletePayeeResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    final MutationOptions options = MutationOptions(
        document: parseString('''

mutation {
      deletePayee(
          payeeId:$payeeID
          ) {
        message
      }
    }
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);
      responseData = DeletePayeeResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  @override
  Future<TransactionListResponseModel> getTransactionListApi(
      int customerID) async {
    late TransactionListResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    print('$customerID');
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/
    final QueryOptions options = QueryOptions(
        document: parseString('''

query {
  lasttransactions(customerId: $customerID) {
   reference
    reference_note
    transaction_note
    debit
    credit
    status
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.query(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = TransactionListResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  @override
  Future<WalletBalanceResponseModel> getWalletBalanceApi(int customerID) async {
    late WalletBalanceResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    print('$customerID');
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/
    final QueryOptions options = QueryOptions(
        document: parseString('''

query {
  adminallcustomerwallent(customerId: $customerID){
    CustomerName
    TotalAmount
    RemainingAmount
    UsedAmount
    ModifyAt
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.query(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = WalletBalanceResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

//API to get code to transfer money
  @override
  Future<TransferCodeResponseModel> getTrasferCodeApi(
      int customerID, int payeeID, double amount, String note) async {
    late TransferCodeResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    print('$customerID');
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/
    final MutationOptions options = MutationOptions(
        document: parseString('''

mutation {
  sendcodetransferamount(
      senderId:$customerID
      receiverId:$payeeID
      amount:$amount
      walletnote:$note
      ) {
    transfercode
    message
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = TransferCodeResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

//API to transfer wallet money
  @override
  Future<TransferMoneyResponseModel> transferMoneyApi(
      int customerID, int payeeID, double amount, int code) async {
    late TransferMoneyResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery();
    print('$customerID');
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/
    final MutationOptions options = MutationOptions(
        document: parseString('''

mutation {
  sendtransferamount(
      senderId:$customerID
      receiverId:$payeeID
      amount:$amount
      baseAmount:$amount
      code:$code
      ) {
    
    message
  }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = TransferMoneyResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to get cart id
  @override
  Future<CartIdResponseModel> getCartIDApi() async {
    late CartIdResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/

    final MutationOptions options = MutationOptions(
        document: parseString('''

{
  customerCart{
    id
    email
    items{
      id
      quantity
      product{
        id
        sku
        name
      }
      }
    }
  }
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = CartIdResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to get payment methods
  @override
  Future<PaymentMethodsResponseModel> getPaymentMethodsApi(
      String cartID) async {
    late PaymentMethodsResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/

    final QueryOptions options = QueryOptions(
        document: parseString(''' 

query {
    cart(cart_id: "$cartID") {
        available_payment_methods {
            code
            title
        }
    }
}
  '''), // call the query
        variables: const {});

/*
    final QueryOptions options = QueryOptions(
        document: parseString('''
query {
    cart(cart_id: $cartID) {
        available_payment_methods {
            code
            title
        }
    }
}
  '''), // call the query
        variables: {});*/
    final QueryResult result = await client.query(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = PaymentMethodsResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to get payment methods
  @override
  Future<WalletOptionResponseModel> showWalletOptionApi(
      int customerID, double amount) async {
    late WalletOptionResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/

    final QueryOptions options = QueryOptions(
        document: parseString(''' 

query {
        walletpaymentcheckoutpage(
            customerId: $customerID
            productPrice: $amount
            ) {
          PaymentToBeMade
          AmountInYourWallet
          RemainingAmount
          LeftAmountTobePaid
        }
     }
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.query(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = WalletOptionResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to set wallet payment
  @override
  Future<WalletPaymentModel> setWalletPaymentApi(String cartID) async {
    late WalletPaymentModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();
    // final QueryOptions options = QueryOptions(document: document)
    /* final MutationOptions options = MutationOptions(
        document: parseString('''*/

    final MutationOptions options = MutationOptions(
        document: parseString(''' 

mutation {
    setPaymentMethodOnCart(
        input: {
            cart_id: "$cartID"
            payment_method: { code: "walletsystem" }
        }
    ) {
        cart {
            selected_payment_method {
                code
            }
        }
    }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = WalletPaymentModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to set wallet payment
  @override
  Future<WalletOrderResponseModel> placeWalletOrderApi(String cartID) async {
    late WalletOrderResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();

    final MutationOptions options = MutationOptions(
        document: parseString(''' 

mutation {
    placeOrder(input: { cart_id: "$cartID" }) {
        order {
            order_number
        }
    }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = WalletOrderResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

  //API to add money to wallet
  @override
  Future<AddWalletMoneyResponseModel> addMoneyToWallet(amount) async {
    late AddWalletMoneyResponseModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();

    final MutationOptions options = MutationOptions(
        document: parseString(''' 

mutation {
  addamounttowallet(
      qty:1
      price:$amount
    )
    {
        message
    }
}
  '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print(result.toString());

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = AddWalletMoneyResponseModel.fromRawJson(responseDetails);
    }

    return responseData;
  }
}
