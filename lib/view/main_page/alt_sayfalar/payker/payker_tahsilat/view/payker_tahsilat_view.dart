import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_credit_card/flutter_credit_card.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_tahsilat/view_model/payker_tahsilat_view_model.dart";

final class PaykerTahsilatView extends StatefulWidget {
  const PaykerTahsilatView({super.key});

  @override
  State<PaykerTahsilatView> createState() => _PaykerTahsilatViewState();
}

final class _PaykerTahsilatViewState extends State<PaykerTahsilatView> {
  final PaykerTahsilatViewModel _viewModel = PaykerTahsilatViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryDateController;
  late final TextEditingController _cardHolderNameController;
  late final TextEditingController _cvvCodeController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _amountController;

  late final FocusNode _cvvFocusNode;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _viewModel.setScrollDown(_scrollController.position.pixels > 0);
    });
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
      value: "bilgilendirme",
      canTapOnHeader: true,
      headerBuilder:
          (context, isExpanded) => const ListTile(leading: Icon(Icons.info_outlined), title: Text("Bilgilendirme")),
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
                  "• Şirketimiz kredi kartı taksit sayılarında herhangi bir ek kısıtlama uygulamamaktadır. Kredi kartı ile ödeme yaparken taksit sayıları, ilgili banka kaynaklı anlık değişkenlik gösterebilir. Ödeme yapmadan önce kart sahibinin geçerli taksit sayılarını bankası ile kontrol etmesini rica ederiz.",
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
      headerBuilder:
          (context, isExpanded) =>
              const ListTile(leading: Icon(Icons.credit_card_outlined), title: Text("Kullanım Şartları")),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text(
              "BRACKET TEKNOLOJİ https://odeme.bracket.com.tr web sitesine hoş geldiniz. Bu web sitesinde sunulan hizmetlerin kullanım şartlarını, sitemize üye olarak veya hizmetlerimizden yararlanma aşamasında, bu sözleşmeyi kabul ettiğinizi beyan eden kutucuğu işaretleyerek kabul etmiş bulunmaktasınız. BRACKET TEKNOLOJİ https://odeme.bracket.com.tr web sitesinde bulunan hizmetlerde kullanım özellik ve şartlarında önceden bir bildirimde bulunmaksızın, herhangi bir zamanda değişiklik yapma, yürürlükten kaldırma ve güncelleme haklarını saklı tutar. \n\nÜYELİK İŞLEMLERİ\nhttps://odeme.bracket.com.tr web sitesinde sağlanan hizmetler için siteye üye olmanız ve kayıt sırasında kayıt formunda istenen bilgileri tam ve doğru olarak sağlamanız gerekmektedir. Bilgilerinizdeki değişiklik olduğu zaman, üyelik profilinize girerek ilgili bölümleri güncellemek kullanıcının sorumluluğundadır. Güncellenmemiş bilgilerden dolayı size ulaşamadığımız zaman sorumluluk size aittir. Eğer bu hizmetlerden işvereniniz hesabına kullanıyorsanız, bu kullanım şartlarını onun adına kabul etmeye yetkili olduğunuz anlamına gelmektedir. Kayıt esnasında tarafınızca belirlenen şifreniz yalnızca sizin kullanımınız içindir. Sizin hesabınız ile yapılan bütün işlemlerin sorumluluğu tamamıyla size aittir. Bu sözleşmeyi onaylanarak bunu kabul ve teyit etmiş oluyorsunuz. Bu sözleşmeyi onaylayarak şifrenizin veya hesabınızın haksız kullanımı durumunda https://odeme.bracket.com.tr personelini hemen bilgilendirmeyi de peşinen kabul ediyorsunuz. https://odeme.bracket.com.tr, hesabınızın veya şifrenizin başkası tarafından kullanımı nedeniyle, bilginiz olsun veya olmasın, oluşacak zararınızla ilgili herhangi bir yükümlülük kabul etmez. Ancak, hesabınızın veya şifrenizin başka bir kişi tarafından kullanımından https://odeme.bracket.com.tr veya başka bir kişi veya kuruluş zarar görürse, bu zarardan siz sorumlu tutulabilirsiniz. Hesap sahibinin izni olmaksızın başka bir hesabı kullanmanız yasaktır. \n\nGARANTİ VE FERAGAT\nhttps://odeme.bracket.com.tr ve sizin aranızda yapılan ayrı bir sözleşme ile açıkça belirlenmediği sürece, bu web sitesinden edinilen bütün hizmetler size olduğu haliyle sağlanmış olup, herhangi bir amaca uygunluk açısından veya başka bir açıdan herhangi bir garantiye tabi değildir. https://odeme.bracket.com.tr hiçbir şekilde tarafınız veya başka bir üçüncü kişi tarafından bu web sitesine erişimden, bu web sitesinin veya bu web sitesinden linkle yönlendirilmiş başka bir web sitesine erişimden veya bu web sitesinde yer alan hizmetlerin kullanımı vasıtasıyla uğranılmış dolaysız veya dolaylı bir zarardan, gelir veya veri kaybından veya başka bir zarardan sorumlu değildir. BU WEB SİTESİNDE SAĞLANAN ÜÇÜNCÜ KİŞİLERE AİT İÇERİK Bu web sitesi üçüncü kişiler tarafından sağlanmış içerik veya yazılımlar bulunmaktadır. Bu web sitesinde yer alan bütün üçüncü kişilere ait içerik ve yazılımlar için de yukarıda yer alan “GARANTİ VE FERAGAT” bölümü hükümleri geçerlidir.",
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
    builder:
        (_) => FloatingActionButton.extended(
          onPressed: () {
            if (_viewModel.cardNumber.isEmpty ||
                _viewModel.expiryDate.isEmpty ||
                _viewModel.cardHolderName.isEmpty ||
                _viewModel.cvvCode.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Lütfen tüm alanları doldurun")));
              return;
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
      child: Column(
        spacing: UIHelper.midSize,
        children: [
          Observer(
            builder:
                (_) => CreditCardWidget(
                  padding: 25,
                  cardNumber: _viewModel.cardNumber,
                  expiryDate: _viewModel.expiryDate,
                  cardHolderName: _viewModel.cardHolderName,
                  cvvCode: _viewModel.cvvCode,
                  cardBgColor: ColorPalette.carminePink,
                  showBackView: _viewModel.showBackView,
                  enableFloatingCard: true,

                  labelCardHolder: "Kart Sahibi",
                  labelExpiredDate:
                      "${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}",
                  labelValidThru: "SKT",
                  glassmorphismConfig: Glassmorphism(
                    blurX: 10,
                    blurY: 20,
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.mirror,
                      colors: [
                        ColorPalette.dodgerBlue,
                        ColorPalette.mountbattenPink,
                        ColorPalette.mulberry,
                        ColorPalette.carminePink,
                      ],
                    ),
                  ),

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
                        inputFormatter: [LengthLimitingTextInputFormatter(4)],
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
            onChanged: (value) {},
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
          ExpansionPanelList.radio(children: _generateItems(), initialOpenPanelValue: "bilgilendirme"),

          const SizedBox(height: 100),
        ],
      ),
    ),
  );
}
