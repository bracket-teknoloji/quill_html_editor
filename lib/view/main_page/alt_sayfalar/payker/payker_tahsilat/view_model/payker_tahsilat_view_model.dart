import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/payment_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/taksit_response_model.dart";
import "package:uuid/uuid.dart";

part "payker_tahsilat_view_model.g.dart";

class PaykerTahsilatViewModel = _PaykerTahsilatViewModelBase with _$PaykerTahsilatViewModel;

abstract class _PaykerTahsilatViewModelBase with Store, MobxNetworkMixin {
  _PaykerTahsilatViewModelBase() {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        amount: 0, // Başlangıçta tutar 0 olarak ayarlanır
        cardCvv: cvvCodeMask,
        cardNameSurname: cardHolderNameMask,
        cardNumber: cardNumberMask,
        cardExpiryDateMonth: int.tryParse(expiryDateMask.split("/")[0]),
        cardExpiryDateYear: int.tryParse(expiryDateMask.split("/")[1]),
      ),
    );
  }

  final String cardNumberMask = "5269 1111 2222 3333";
  final expiryDateMask =
      "${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}";
  final cardHolderNameMask = "Burak Talha Yılmaz";
  final cvvCodeMask = "123";

  @observable
  bool isScrollDown = false;

  @observable
  bool showBackView = false;

  @observable
  bool isExpanded = false;

  @observable
  int? selectedBankId;

  @observable
  PaymentModel paymentModel = PaymentModel(
    customerInfo: const CustomerInfo(
      customerId: "120.0004",
    ),
    saleInfo: SaleInfo(
      currency: 949, // TRY sabit,
    ),
    payment3D: const Payment3D(),
    order: Order(
      orderId: const Uuid().v4(),
    ),
  );

  @observable
  ObservableList<TaksitResponseModel>? taksitResponseModel;

  @action
  void setTaksitResponseModel(List<TaksitResponseModel>? value) {
    if (value != null) {
      taksitResponseModel = ObservableList<TaksitResponseModel>.of(value);
    } else {
      taksitResponseModel = null;
    }
  }

  @action
  void setScrollDown(bool value) {
    if (value != isScrollDown) {
      isScrollDown = value;
    }
  }

  @action
  void setAmount(double? value) {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        amount: value?.toInt(),
      ),
    );
  }

  @action
  void setSelectedBankId(int? value) {
    if (value == selectedBankId) return;
    if (value != selectedBankId) {
      selectedBankId = value;
    }
  }

  @action
  void setCardNumber(String value) {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        cardNumber: value,
      ),
    );
  }

  @action
  void setExpiryDate(String value) {
    final parts = value.split("/");
    if (parts.length == 2) {
      final month = int.tryParse(parts[0]);
      final year = int.tryParse(parts[1]);
      paymentModel = paymentModel.copyWith(
        saleInfo: paymentModel.saleInfo?.copyWith(
          cardExpiryDateMonth: month,
          cardExpiryDateYear: year,
        ),
      );
    }
  }

  @action
  void setCardHolderName(String value) {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        cardNameSurname: value,
      ),
    );
  }

  @action
  void setCvvCode(String value) {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        cardCvv: value,
      ),
    );
  }

  @action
  void setShowBackView(bool value) {
    showBackView = value;
  }

  @action
  void setIsExtended(bool value) {
    isExpanded = value;
  }

  @action
  Future<void> getInstallments() async {
    final result = await networkManager.getInstallments(
      cariKodu: paymentModel.customerInfo?.customerId ?? "",
      amount: (paymentModel.saleInfo?.amount ?? 0).toDouble(),
    );
    if (result != null) {
      setTaksitResponseModel(result);
    } else {
      setTaksitResponseModel(null);
    }
  }
}
