import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/payment_model.dart";
import "package:uuid/uuid.dart";

part "payker_tahsilat_view_model.g.dart";

class PaykerTahsilatViewModel = _PaykerTahsilatViewModelBase with _$PaykerTahsilatViewModel;

abstract class _PaykerTahsilatViewModelBase with Store, MobxNetworkMixin {
  _PaykerTahsilatViewModelBase() {
    cardNumber = cardNumberMask;
    expiryDate = expiryDateMask;
    cardHolderName = cardHolderNameMask;
    cvvCode = cvvCodeMask;
  }

  final String cardNumberMask = "5269 1111 2222 3333";
  final expiryDateMask =
      "${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}";
  final cardHolderNameMask = "Burak Talha Yılmaz";
  final cvvCodeMask = "123";

  @observable
  bool isScrollDown = false;

  @observable
  String cardNumber = "";

  @observable
  String expiryDate = "";

  @observable
  String cardHolderName = "";

  @observable
  String cvvCode = "";

  @observable
  bool showBackView = false;

  @observable
  bool isExpanded = false;

  @action
  void setScrollDown(bool value) {
    if (value != isScrollDown) {
      isScrollDown = value;
    }
  }

  @action
  void setCardNumber(String value) {
    cardNumber = value;
  }

  @action
  void setExpiryDate(String value) {
    expiryDate = value;
  }

  @action
  void setCardHolderName(String value) {
    cardHolderName = value;
  }

  @action
  void setCvvCode(String value) {
    cvvCode = value;
  }

  @action
  void setShowBackView(bool value) {
    showBackView = value;
  }

  @action
  void setIsExtended(bool value) {
    isExpanded = value;
  }

  PaymentModel get paymentModel => PaymentModel(
    customerInfo: CustomerInfo(
      name: cardHolderName,
      customerId: "120.0004",
    ),
    saleInfo: SaleInfo(
      cardNumber: cardNumber,
      cardExpiryDateMonth: int.tryParse(expiryDate.split("/")[0]) ?? 0,
      cardExpiryDateYear: int.tryParse(expiryDate.split("/")[1]) ?? 0,
      cardCvv: cvvCode,
      currency: 949, // TRY sabit,
    ),
    order: Order(
      orderId: const Uuid().v4(),
    ),
  );

  @action
  Future<void> getInstallments() async {
    networkManager.getInstallments(cariKodu: paymentModel.customerInfo?.customerId ?? "", amount: 1);
  }
}
