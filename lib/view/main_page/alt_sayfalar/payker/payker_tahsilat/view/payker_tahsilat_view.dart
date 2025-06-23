import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_credit_card/flutter_credit_card.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/view/payker_web_view.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/view_model/payker_tahsilat_view_model.dart";

final class PaykerTahsilatView extends StatefulWidget {
  const PaykerTahsilatView({super.key});

  @override
  State<PaykerTahsilatView> createState() => _PaykerTahsilatViewState();
}

final class _PaykerTahsilatViewState extends BaseState<PaykerTahsilatView> {
  final PaykerTahsilatViewModel _viewModel = PaykerTahsilatViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController _cariController;
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryDateController;
  late final TextEditingController _cardHolderNameController;
  late final TextEditingController _cvvCodeController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _amountController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final FocusNode _cvvFocusNode;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _viewModel.setScrollDown(_scrollController.position.pixels > 0);
    });
    _cariController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expiryDateController = TextEditingController();
    _cardHolderNameController = TextEditingController();
    _cvvCodeController = TextEditingController();
    _descriptionController = TextEditingController();
    _amountController = TextEditingController();
    _cvvFocusNode = FocusNode();
    _cvvFocusNode.addListener(() {
      if (_cvvFocusNode.hasFocus) {
        _viewModel.setShowBackView(true);
      } else {
        _viewModel.setShowBackView(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cariController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cardHolderNameController.dispose();
    _cvvCodeController.dispose();
    _cvvFocusNode.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  List<ExpansionPanelRadio> _generateItems() => [
    ExpansionPanelRadio(
      value: "taksit_sec",
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) =>
          const ListTile(leading: Icon(Icons.payment_outlined), title: Text("Taksit Seçenekleri")),
      body: Observer(
        builder: (_) => _viewModel.isInstallmentLoading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            : _viewModel.taksitResponseModel?.isEmpty ?? true
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Taksit seçeneği bulunmamaktadır.")),
              )
            : ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 400,
                ),
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.7),
                  itemCount: _viewModel.taksitResponseModel?.length ?? 0,
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            foregroundImage: Image.network(
                              ApiUrls.basePaykerURLWithoutApi +
                                  (_viewModel.taksitResponseModel![index].taksitler?.firstOrNull?.banka?.logoUrl ?? ""),
                            ).image,
                          ),
                          title: Text(
                            _viewModel.taksitResponseModel![index].bankaAdi ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          ),
                          subtitle: Text(
                            "Tutar: ${_viewModel.taksitResponseModel![index].tutar?.toString() ?? "0"} $mainCurrency",
                            style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        const Divider(),
                        ListView.separated(
                          separatorBuilder: (context, index2) => const Divider(),
                          itemCount: _viewModel.taksitResponseModel![index].taksitler?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index2) => Padding(
                            padding: UIHelper.lowPadding,
                            child: Observer(
                              builder: (_) {
                                final item = _viewModel.taksitResponseModel![index].taksitler?[index2];
                                return RadioListTile.adaptive(
                                  groupValue: _viewModel.paymentModel.saleInfo?.installment,
                                  value: item?.id,
                                  onChanged: (value) {
                                    _viewModel
                                      ..setBankId(item?.banka?.id.toStringIfNotNull)
                                      ..setInstallment(item?.id);
                                  },
                                  title: Text(
                                    "${item?.odemeMetni}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${item?.taksit}"
                                    " × ${(item?.vadeFarkliTaksitTutari((_viewModel.taksitResponseModel![index].tutar ?? 0).toDouble()) ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"
                                    "  $mainCurrency ="
                                    " ${(item?.toplamVadeFarkliTaksitTutari((_viewModel.taksitResponseModel![index].tutar ?? 0).toDouble()) ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}  $mainCurrency",
                                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    ),
    ExpansionPanelRadio(
      value: "bilgilendirme",
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) =>
          const ListTile(leading: Icon(Icons.info_outlined), title: Text("Bilgilendirme")),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Card(child: ListTile(title: Text("• Taksit seçenekleri ve bilgilendirmeler için tutar giriniz."))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              child: ListTile(
                title: Text(
                  "• Şirketimiz kredi kartı taksit sayılarında herhangi bir ek kısıtlama uygulamamaktadır."
                  " Kredi kartı ile ödeme yaparken taksit sayıları, ilgili banka kaynaklı anlık değişkenlik"
                  " gösterebilir. Ödeme yapmadan önce kart sahibinin geçerli taksit sayılarını bankası"
                  " ile kontrol etmesini rica ederiz.",
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    ExpansionPanelRadio(
      value: "kullanim_sartlari",
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) =>
          const ListTile(leading: Icon(Icons.credit_card_outlined), title: Text("Kullanım Şartları")),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text(
              "BRACKET TEKNOLOJİ https://odeme.bracket.com.tr web sitesine hoş geldiniz. Bu web sitesinde"
              " sunulan hizmetlerin kullanım şartlarını, sitemize üye olarak veya hizmetlerimizden yararlanma"
              " aşamasında, bu sözleşmeyi kabul ettiğinizi beyan eden kutucuğu işaretleyerek kabul etmiş"
              " bulunmaktasınız. BRACKET TEKNOLOJİ https://odeme.bracket.com.tr web sitesinde bulunan"
              " hizmetlerde kullanım özellik ve şartlarında önceden bir bildirimde bulunmaksızın, herhangi"
              " bir zamanda değişiklik yapma, yürürlükten kaldırma ve güncelleme haklarını saklı tutar."
              " \n\nÜYELİK İŞLEMLERİ\nhttps://odeme.bracket.com.tr web sitesinde sağlanan hizmetler için siteye"
              " üye olmanız ve kayıt sırasında kayıt formunda istenen bilgileri tam ve doğru olarak sağlamanız"
              " gerekmektedir. Bilgilerinizdeki değişiklik olduğu zaman, üyelik profilinize girerek ilgili"
              " bölümleri güncellemek kullanıcının sorumluluğundadır. Güncellenmemiş bilgilerden dolayı size"
              " ulaşamadığımız zaman sorumluluk size aittir. Eğer bu hizmetlerden işvereniniz hesabına"
              " kullanıyorsanız, bu kullanım şartlarını onun adına kabul etmeye yetkili olduğunuz anlamına"
              " gelmektedir. Kayıt esnasında tarafınızca belirlenen şifreniz yalnızca sizin kullanımınız içindir."
              " Sizin hesabınız ile yapılan bütün işlemlerin sorumluluğu tamamıyla size aittir. Bu sözleşmeyi"
              " onaylanarak bunu kabul ve teyit etmiş oluyorsunuz. Bu sözleşmeyi onaylayarak şifrenizin veya"
              " hesabınızın haksız kullanımı durumunda https://odeme.bracket.com.tr personelini hemen bilgilendirmeyi"
              " de peşinen kabul ediyorsunuz. https://odeme.bracket.com.tr, hesabınızın veya şifrenizin başkası"
              " tarafından kullanımı nedeniyle, bilginiz olsun veya olmasın, oluşacak zararınızla ilgili herhangi"
              " bir yükümlülük kabul etmez. Ancak, hesabınızın veya şifrenizin başka bir kişi tarafından"
              " kullanımından https://odeme.bracket.com.tr veya başka bir kişi veya kuruluş zarar görürse, bu"
              " zarardan siz sorumlu tutulabilirsiniz. Hesap sahibinin izni olmaksızın başka bir hesabı"
              " kullanmanız yasaktır. \n\nGARANTİ VE FERAGAT\nhttps://odeme.bracket.com.tr ve sizin aranızda"
              " yapılan ayrı bir sözleşme ile açıkça belirlenmediği sürece, bu web sitesinden edinilen bütün"
              " hizmetler size olduğu haliyle sağlanmış olup, herhangi bir amaca uygunluk açısından veya başka"
              " bir açıdan herhangi bir garantiye tabi değildir. https://odeme.bracket.com.tr hiçbir şekilde"
              " tarafınız veya başka bir üçüncü kişi tarafından bu web sitesine erişimden, bu web sitesinin veya"
              " bu web sitesinden linkle yönlendirilmiş başka bir web sitesine erişimden veya bu web sitesinde"
              " yer alan hizmetlerin kullanımı vasıtasıyla uğranılmış dolaysız veya dolaylı bir zarardan, gelir"
              " veya veri kaybından veya başka bir zarardan sorumlu değildir. BU WEB SİTESİNDE SAĞLANAN ÜÇÜNCÜ"
              " KİŞİLERE AİT İÇERİK Bu web sitesi üçüncü kişiler tarafından sağlanmış içerik veya yazılımlar"
              " bulunmaktadır. Bu web sitesinde yer alan bütün üçüncü kişilere ait içerik ve yazılımlar için de"
              " yukarıda yer alan “GARANTİ VE FERAGAT” bölümü hükümleri geçerlidir.",
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) =>
      BaseScaffold(appBar: _appBar(), floatingActionButton: _fab(context), body: _body());

  AppBar _appBar() => AppBar(title: const AppBarTitle(title: "Payker Tahsilat"));

  Widget _fab(BuildContext context) => Observer(
    builder: (_) => FloatingActionButton.extended(
      onPressed: () async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        if (!(_viewModel.paymentModel.saleInfo?.isValid ?? false)) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Lütfen tüm alanları doldurun")));
          return;
        }
        if ((_viewModel.taksitResponseModel == null || _viewModel.taksitResponseModel!.isEmpty) &&
            _viewModel.paymentModel.saleInfo?.installment == null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Lütfen taksit seçiniz")));
          return;
        }
        await _viewModel.createPayment();
        if (_viewModel.paymentResponseModel?.message != null) {
          final result = await Get.to(
            () => PaykerWebView(
              html: _viewModel.paymentResponseModel!.message!,
            ),
            fullscreenDialog: true,
          );
          if (result == true) {
            Get.back(result: true);
          }
        }
      },
      label: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: !_viewModel.isScrollDown ? const Text("Tahsilat Yap") : const SizedBox.shrink(),
      ),
      icon: const Icon(Icons.payment_outlined),
      extendedIconLabelSpacing: _viewModel.isScrollDown ? 0 : 8,
    ),
  );

  SingleChildScrollView _body() => SingleChildScrollView(
    controller: _scrollController,
    physics: const AlwaysScrollableScrollPhysics(),
    child: Padding(
      padding: UIHelper.lowPaddingHorizontal,
      child: Form(
        key: _formKey,
        child: Column(
          spacing: UIHelper.midSize,
          children: [
            Observer(
              builder: (_) => CreditCardWidget(
                padding: 25,
                cardNumber: _viewModel.paymentModel.saleInfo?.cardNumber ?? _viewModel.cardNumberMask,
                expiryDate: _viewModel.paymentModel.saleInfo?.expiryDate ?? _viewModel.expiryDateMask,
                backgroundImage: Assets.background.paykerCard2Background.path,
                cardHolderName: _viewModel.paymentModel.saleInfo?.cardNameSurname ?? _viewModel.cardHolderNameMask,
                cvvCode: _viewModel.paymentModel.saleInfo?.cardCvv ?? _viewModel.cvvCodeMask,
                cardBgColor: ColorPalette.outerSpace,
                frontCardBorder: Border.all(color: ColorPalette.outerSpace),
                backCardBorder: Border.all(color: ColorPalette.outerSpace),
                showBackView: _viewModel.showBackView,
                enableFloatingCard: true,
                labelCardHolder: "Kart Sahibi",
                labelExpiredDate:
                    "${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}",
                labelValidThru: "SKT",
                isHolderNameVisible: true,
                onCreditCardWidgetChange: (p0) {},
                obscureCardCvv: false,
                obscureCardNumber: false,
              ),
            ),

            AutofillGroup(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Cari",
                    controller: _cariController,
                    // TODO : Cari kodunu view model'e set et
                    valueWidget: Observer(
                      builder: (_) => Text(_viewModel.paymentModel.customerInfo?.customerId ?? ""),
                    ),
                    suffixMore: true,
                    readOnly: true,
                    onClear: () => _viewModel.setCari(null),
                    suffix: IconButton(
                      icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                      onPressed: () async {
                        if (_viewModel.paymentModel.customerInfo?.customerId == null) {
                          dialogManager.showErrorSnackBar(
                            "Cari seçiniz.",
                          );
                        }
                        if (_cariController.text.isNotEmpty) {
                          if (await networkManager.getCariModel(
                                CariRequestModel(
                                  kod: [_viewModel.paymentModel.customerInfo?.customerId ?? ""],
                                ),
                              )
                              case final value?) {
                            dialogManager.showCariGridViewDialog(value);
                          }
                        }
                      },
                    ),
                    onTap: () async {
                      final result = await Get.toNamed("/mainPage/cariListesiOzel");
                      if (result is CariListesiModel) {
                        _cariController.text = result.cariAdi ?? "";
                        _viewModel.setCari(result);
                      }
                    },
                  ),
                  CustomTextField(
                    labelText: "Kart Numarası",
                    autofillHints: AutofillHints.creditCardNumber,
                    isMust: true,
                    hintText: _viewModel.cardNumberMask,
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    // inputFormatter: [LengthLimitingTextInputFormatter(16)],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kart numarası boş olamaz";
                      }
                      if (value.length < 16) {
                        return "Kart numarası 16 haneli olmalıdır";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.replaceAll(RegExp(r"\s+"), "").length > 16) {
                        return;
                      }
                      final String formattedValue = value
                          .replaceAll(RegExp(r"\s+"), "") // Önce tüm boşlukları kaldır
                          .replaceAllMapped(
                            RegExp(r"(\d{4})"),
                            (match) => "${match.group(1)} ",
                          ); // Her 4 karakterde bir boşluk ekle
                      if (kIsWeb) {
                        _cardNumberController.value = TextEditingValue(
                          text: formattedValue,
                          selection: TextSelection.collapsed(offset: formattedValue.length),
                        );
                      } else {
                        _cardNumberController.text = formattedValue;
                      }
                      // _cardNumberController.text = formattedValue.trim(); // Sonundaki boşluğu kaldır

                      _viewModel.setCardNumber(value);
                    },
                  ),
                  CustomTextField(
                    labelText: "Kart Sahibi",

                    autofillHints: AutofillHints.creditCardName,
                    isMust: true,
                    hintText: _viewModel.cardHolderNameMask,
                    controller: _cardHolderNameController,
                    keyboardType: TextInputType.name,
                    inputFormatter: [LengthLimitingTextInputFormatter(30)],
                    onChanged: _viewModel.setCardHolderName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kart sahibi boş olamaz";
                      }
                      return null;
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Son Kullanma Tarihi",
                          autofillHints: AutofillHints.creditCardExpirationDate,
                          isMust: true,
                          hintText: _viewModel.expiryDateMask,
                          controller: _expiryDateController,
                          keyboardType: TextInputType.number,
                          inputFormatter: [LengthLimitingTextInputFormatter(5)],
                          onChanged: (value) {
                            // format as MM/YY
                            final formattedValue = value
                                .replaceAll(RegExp(r"\s+"), "")
                                .replaceAllMapped(RegExp(r"(\d{2})(?=\d)"), (match) => "${match.group(1)}/");
                            if (kIsWeb) {
                              _expiryDateController.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.collapsed(offset: value.length),
                              );
                            } else {
                              _expiryDateController.text = formattedValue;
                            }
                            // _expiryDateController.text = value
                            //     .replaceAll(RegExp(r"\s+"), "")
                            //     .replaceAllMapped(RegExp(r"(\d{2})(?=\d)"), (match) => "${match.group(1)}/");
                            _viewModel.setExpiryDate(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Son kullanma tarihi boş olamaz";
                            }
                            if (value.length < 4) {
                              return "Son kullanma tarihi 4 haneli olmalıdır";
                            }
                            final dateParts = value.split("/");
                            final DateTime now = DateTime.now();
                            final int month = int.parse(dateParts[0]);
                            final int year = int.parse(dateParts[1]);
                            if (month < 1 || month > 12) {
                              return "Geçersiz ay";
                            }
                            if (year < now.year % 100 || (year == now.year % 100 && month < now.month)) {
                              return "Kart süresi geçmiş";
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "CVV",
                          autofillHints: AutofillHints.creditCardSecurityCode,
                          isMust: true,
                          hintText: _viewModel.cvvCodeMask,
                          controller: _cvvCodeController,
                          focusNode: _cvvFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatter: [LengthLimitingTextInputFormatter(3)],
                          onChanged: _viewModel.setCvvCode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "CVV kodu boş olamaz";
                            }
                            if (value.length < 3) {
                              return "CVV kodu 3 haneli olmalıdır";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomTextField(
              labelText: "Tutar",
              isMust: true,
              isFormattedString: true,
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatter: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
              onChanged: (value) {
                _viewModel
                  ..setAmount(value.toDoubleWithFormattedString)
                  ..getInstallments();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tutar boş olamaz";
                }
                if (value.toDoubleWithFormattedString <= 0) {
                  return "Tutar 0'dan büyük olmalıdır";
                }
                return null;
              },
            ),
            CustomTextField(
              labelText: "Açıklama",
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              inputFormatter: [LengthLimitingTextInputFormatter(50)],
              onChanged: (value) {},
            ),
            ExpansionPanelList.radio(children: _generateItems(), initialOpenPanelValue: "taksit_sec"),

            const SizedBox(height: 100),
          ],
        ),
      ),
    ),
  );
}
