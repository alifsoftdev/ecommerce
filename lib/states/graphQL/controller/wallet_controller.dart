import 'package:get/get.dart';
import '../../model/payee_list_response_model.dart';
import '../../model/payment_methods_response_model.dart';
import '../../model/transaction_list_response_model.dart';
import '../repository/wallet_repository.dart';

class WalletController extends GetxController {
  final WalletRepository walletRepository = Get.put(WalletRepository());
  final postList = [].obs;
  List<Addedpayeeslist> payeeList = <Addedpayeeslist>[].obs;
  List<Lasttransaction> transactionList = <Lasttransaction>[].obs;
  List<AvailablePaymentMethod> availablePaymentMethods =
      <AvailablePaymentMethod>[].obs;
  String walletBalance = '';
  int transferCode = 0;
  String cartID = '';
  String orderNumber = '';
  String addMoneyMessage = '';

  final title = "".obs;
  final deleteMessage = "".obs;
  String transferMessage = '';
  String paymentToBeMade = '';
  String amountInYourWallet = '';
  String remainingAmount = '';
  String leftAmountTobePaid = '';

  RxBool addPayeeLoadingFlag = true.obs;
  RxBool getPayeeListLoadingFlag = true.obs;
  RxBool deletePayeeLoadingFlag = true.obs;
  RxBool transactionListLoadingFlag = true.obs;
  RxBool walletBalanceLoadingFlag = true.obs;
  RxBool transferCodeLoadingFlag = true.obs;
  RxBool transferMoneyLoadingFlag = true.obs;
  RxBool cartIDLoadingFlag = true.obs;
  RxBool paymentMethodsLoadingFlag = true.obs;
  RxBool walletOptionsLoadingFlag = true.obs;
  RxBool walletPaymentLoadingFlag = true.obs;
  RxBool walletOrderLoadingFlag = true.obs;
  RxBool addMoneyToWalletLoadingFlag = true.obs;

  Future<void> addPayeeApi(
      int customerID, String name, String email, String confEmail) async {
    addPayeeLoadingFlag.value = true;
    // var response = await walletRepository.getAllPost(1, 105); // paginate

    var response = await walletRepository.addPayee(
        customerID, name, email, confEmail); // paginate

    if (response.addpayee.message.isNotEmpty) {
      title.value = response.addpayee.message;
      addPayeeLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> getPayeeListApi(int customerID) async {
    getPayeeListLoadingFlag.value = true;

    var response = await walletRepository.getPayeeList(customerID); // paginate

    if (response.addedpayeeslist.isNotEmpty) {
      payeeList = response.addedpayeeslist;
      getPayeeListLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> deletePayeeApi(int payeeID, int customerID) async {
    deletePayeeLoadingFlag.value = true;
    var response = await walletRepository.deletePayee(payeeID); // paginate

    if (response.deletePayee.message.isNotEmpty) {
      deleteMessage.value = response.deletePayee.message;
      getPayeeListApi(customerID);
      deletePayeeLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> getTransactionListApi(int customerID) async {
    transactionListLoadingFlag.value = true;
    // var response = await walletRepository.getAllPost(1, 105); // paginate

    var response =
        await walletRepository.getTransactionListApi(customerID); // paginate

    if (response.lasttransactions.isNotEmpty) {
      transactionList = response.lasttransactions;
      transactionListLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> getWalletBalanceApi(int customerID) async {
    walletBalanceLoadingFlag.value = true;

    var response =
        await walletRepository.getWalletBalanceApi(customerID); // paginate

    if (response.adminallcustomerwallent.isNotEmpty) {
      walletBalance = response.adminallcustomerwallent[0].remainingAmount;
      walletBalanceLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

//function to get code to transfer wallet money
  Future<void> getTransferCodeApi(
      int customerID, int payeeID, double amount, String note) async {
    transferMoneyLoadingFlag.value = true;

    var response = await walletRepository.getTrasferCodeApi(
        customerID, payeeID, amount, note);

    if (response.sendcodetransferamount != null) {
      transferCode = response.sendcodetransferamount.transfercode;
      transferMoneyApi(customerID, payeeID, amount, transferCode);
      // transferCodeLoadingFlag.value = false;
      print("transfer code $transferCode");
    } else {
      print("empty data!");
    }
  }

//function to transfer wallet money
  Future<void> transferMoneyApi(
      int customerID, int payeeID, double amount, int code) async {
    // transferMoneyLoadingFlag.value = true;

    var response = await walletRepository.transferMoneyApi(
        customerID, payeeID, amount, code);

    if (response.sendtransferamount != null) {
      transferMessage = response.sendtransferamount.message;
      transferMoneyLoadingFlag.value = false;
      print("transfer code $transferCode");
    } else {
      print("empty data!");
    }
  }

  Future<void> getCartIDApi() async {
    cartIDLoadingFlag.value = true;

    var response = await walletRepository.getCartIDApi();

    if (response.customerCart.id.isNotEmpty) {
      cartID = response.customerCart.id;
      getPaymentMethodsApi(cartID);
      // cartIDLoadingFlag.value = false;
      print("cartID $cartID");
    } else {
      print("empty data!");
    }
  }

  Future<void> getPaymentMethodsApi(String cartID) async {
    // paymentMethodsLoadingFlag.value = true;

    var response = await walletRepository.getPaymentMethodsApi(cartID);

    if (response.cart.availablePaymentMethods.isNotEmpty) {
      availablePaymentMethods = response.cart.availablePaymentMethods;
      cartIDLoadingFlag.value = false;

      // paymentMethodsLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> getWalletOptionsApi(int customerID, double amount) async {
    walletOptionsLoadingFlag.value = true;

    var response =
        await walletRepository.showWalletOptionApi(customerID, amount);

    if (response.walletpaymentcheckoutpage.paymentToBeMade.isNotEmpty) {
      paymentToBeMade = response.walletpaymentcheckoutpage.paymentToBeMade;
      amountInYourWallet =
          response.walletpaymentcheckoutpage.amountInYourWallet;
      remainingAmount = response.walletpaymentcheckoutpage.remainingAmount;
      leftAmountTobePaid =
          response.walletpaymentcheckoutpage.leftAmountTobePaid;
      walletOptionsLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> setWalletPaymentApi(String cartID) async {
    walletPaymentLoadingFlag.value = true;

    var response = await walletRepository.setWalletPaymentApi(cartID);

    if (response.setPaymentMethodOnCart.cart != null) {
      placeWalletOrderApi(cartID);
      // walletPaymentLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> placeWalletOrderApi(String cartID) async {
    // walletOrderLoadingFlag.value = true;

    var response = await walletRepository.placeWalletOrderApi(cartID);

    if (response.placeOrder.order.orderNumber.isNotEmpty) {
      orderNumber = response.placeOrder.order.orderNumber;

      walletPaymentLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }

  Future<void> addMoneyToWallet(double amount) async {
    addMoneyToWalletLoadingFlag.value = true;

    var response = await walletRepository.addMoneyToWallet(amount);

    if (response.addamounttowallet.message.isNotEmpty) {
      addMoneyMessage = response.addamounttowallet.message;

      addMoneyToWalletLoadingFlag.value = false;
    } else {
      print("empty data!");
    }
  }
}
