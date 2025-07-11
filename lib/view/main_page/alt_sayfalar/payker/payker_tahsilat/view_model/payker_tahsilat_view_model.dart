import "package:collection/collection.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/payment_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/payment_response_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/model/taksit_response_model.dart";

part "payker_tahsilat_view_model.g.dart";

class PaykerTahsilatViewModel = _PaykerTahsilatViewModelBase with _$PaykerTahsilatViewModel;

abstract class _PaykerTahsilatViewModelBase with Store, MobxNetworkMixin {
  _PaykerTahsilatViewModelBase() {
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(),
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
  PaymentModel paymentModel = PaymentModel(
    customerIpAddress: AccountModel.instance.localIp,
    customerInfo: const CustomerInfo(
      customerId: "120.0004",
    ),
    saleInfo: SaleInfo(
      currency: 949, // TRY sabit,
    ),
    payment3D: const Payment3D(),
    order: const Order(),
    erpInfo: ERPInfo(
      branchCode: (CacheManager.getVeriTabani["Şube"] as int?)?.toString(),
      companyCode: CacheManager.getVeriTabani["Şirket"],
      businessUnitCode: CacheManager.getVeriTabani["İşletme"].toString(),
      operatorUser: CacheManager.getAnaVeri!.userModel?.kuladi,
    ),
  );

  @observable
  PaymentResponseModel? paymentResponseModel;

  @observable
  ObservableList<TaksitResponseModel>? taksitResponseModel;

  @observable
  bool isInstallmentLoading = false;

  @action
  void setIsInstallmentLoading(bool value) {
    if (value != isInstallmentLoading) {
      isInstallmentLoading = value;
    }
  }

  @action
  void setCari(CariListesiModel? value) {
    paymentModel = paymentModel.copyWith(customerInfo: CustomerInfo.fromCariListesiModel(value ?? CariListesiModel()));
  }

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
  void setPaymentResponseModel(PaymentResponseModel? value) {
    paymentResponseModel = value;
  }

  @action
  void setInstallment(int? value) {
    if (value == paymentModel.saleInfo?.installment) return;
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        installment: value,
      ),
    );
  }

  @action
  void setBankId(String? value) {
    if (value == paymentModel.saleInfo?.bankCode) return;
    paymentModel = paymentModel.copyWith(
      saleInfo: paymentModel.saleInfo?.copyWith(
        bankCode: value,
      ),
    );
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
    setTaksitResponseModel(null);
    setIsInstallmentLoading(true);
    final result = await networkManager.getInstallments(
      cariKodu: paymentModel.customerInfo?.customerId ?? "",
      amount: (paymentModel.saleInfo?.amount ?? 0).toDouble(),
    );
    setIsInstallmentLoading(false);
    if (result != null) {
      setTaksitResponseModel(result);
    } else {
      setTaksitResponseModel(null);
    }
  }

  @action
  Future<void> createPayment() async {
    paymentModel = paymentModel.copyWith(order: null);
    final result = await networkManager.createPayment(
      paymentModel.copyWith(
        payment3D: Payment3D(
          isDesktop: false,
          returnUrl: ApiUrls.paymentCallback,
          confirm: true,
        ),
        saleInfo: paymentModel.saleInfo?.copyWith(
          cardNumber: paymentModel.saleInfo?.cardNumber?.replaceAll(" ", ""),
          cardExpiryDateYear: 2000 + (paymentModel.saleInfo?.cardExpiryDateYear ?? 0),
          installment:
              taksitResponseModel
                  ?.firstWhereOrNull((element) => element.bankaId.toStringIfNotNull == paymentModel.saleInfo?.bankCode)
                  ?.taksitler
                  ?.firstWhereOrNull(
                    (element) => element.id == paymentModel.saleInfo?.installment,
                  )
                  ?.taksit ??
              paymentModel.saleInfo?.installment,
        ),
      ),
    );
    setPaymentResponseModel(result);
  }
}
