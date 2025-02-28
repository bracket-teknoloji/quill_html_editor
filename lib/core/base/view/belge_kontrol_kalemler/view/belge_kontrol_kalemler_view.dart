import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/belge_kontrol/model/belge_kontrol_model.dart";
import "package:picker/core/base/view/belge_kontrol_kalemler/model/belge_kontrol_kalemler_model.dart";
import "package:picker/core/base/view/belge_kontrol_kalemler/view_model/belge_kontrol_kalemler_view_model.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

final class BelgeKontrolKalemlerView extends StatefulWidget {
  const BelgeKontrolKalemlerView({required this.belgeKontrolModel, super.key});
  final BelgeKontrolModel belgeKontrolModel;

  @override
  State<BelgeKontrolKalemlerView> createState() => _BelgeKontrolKalemlerViewState();
}

final class _BelgeKontrolKalemlerViewState extends BaseState<BelgeKontrolKalemlerView> {
  final BelgeKontrolKalemlerViewModel viewModel = BelgeKontrolKalemlerViewModel();
  late final TextEditingController _stokKoduController;

  @override
  void initState() {
    viewModel.requestModel = BelgeKontrolModel.forKalemler(widget.belgeKontrolModel);
    _stokKoduController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _stokKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: _appBar(), body: _body().paddingAll(UIHelper.lowSize));

  AppBar _appBar() => AppBar(
    title: Observer(
      builder: (_) {
        if (viewModel.isSearchBarOpen) {
          return CustomAppBarTextField(onChanged: viewModel.setSearchText);
        }
        return AppBarTitle(title: "Belge Kontrol", subtitle: widget.belgeKontrolModel.belgeNo);
      },
    ),
    actions: [
      IconButton(
        onPressed: viewModel.changeSearchBarStatus,
        icon: Observer(
          builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
      ),
    ],
  );

  Column _body() => Column(
    children: [
      Card(
        child: CustomLayoutBuilder.divideInHalf(
          children: [
            if (widget.belgeKontrolModel.cariKodu != null) Text("Cari Kodu: ${widget.belgeKontrolModel.cariKodu}"),
            if (widget.belgeKontrolModel.cariAdi != null) Text("Cari Adı: ${widget.belgeKontrolModel.cariAdi}"),
            Observer(
              builder:
                  (_) => Text(
                    "Miktar: ${viewModel.filteredList?.map((e) => e.miktar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}",
                  ),
            ),
            Observer(
              builder:
                  (_) => Text(
                    "Kont. Miktar: ${viewModel.filteredList?.map((e) => e.tamamlananMiktar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}",
                  ),
            ),
            Observer(
              builder:
                  (_) => Text(
                    "Kalan Miktar: ${viewModel.filteredList?.map((e) => e.kalanMiktar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}",
                  ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
      CustomTextField(
        labelText: "Stok kodu/barkod giriniz.",
        controller: _stokKoduController,
        onSubmitted: (value) async {
          final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: value));
          if (result case final stok?) {
            _stokKoduController.text = stok.stokKodu ?? "";
          }
        },
        suffix: Wrap(
          children: [
            if (yetkiController.genelBelgeKontrolBarkodOkutulsun)
              IconButton(
                onPressed: () async {
                  final qr = await Get.toNamed("qr");
                  if (qr == null) return;
                  final result = await networkManager.getStokModel(
                    StokRehberiRequestModel(stokKodu: _stokKoduController.text),
                  );
                  if (result case final stok?) {
                    _stokKoduController.text = stok.stokKodu ?? "";
                  }
                },
                icon: const Icon(Icons.qr_code_scanner_outlined),
              ),
            IconButton(
              onPressed: () async {
                final result = await Get.toNamed("mainPage/stokListesiOzel");
                if (result case final StokListesiModel stok?) {
                  _stokKoduController.text = stok.stokKodu ?? "";
                }
              },
              icon: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      ),
      Expanded(
        child: Observer(
          builder:
              (_) => RefreshableListView(
                onRefresh: viewModel.resetList,
                items: viewModel.filteredList,
                itemBuilder: _card,
              ),
        ),
      ),
    ],
  );

  Card _card(BelgeKontrolKalemlerModel item) => Card(
    color: (item.isTamamlandi
            ? ColorPalette.mantis
            : item.isDevamEdiyor
            ? ColorPalette.gamboge
            : null)
        ?.withValues(alpha: 0.3),
    child: ListTile(
      title: Text(item.stokAdi ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: CustomLayoutBuilder.divideInHalf(
        children: [
          Text("Stok Kodu: ${item.stokKodu ?? ""}"),
          Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.stokOlcuBirimi}"),
          Text(
            "Kont. Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.stokOlcuBirimi}",
          ),
          Text(
            "Kalan Miktar: ${item.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.stokOlcuBirimi}",
          ),
          // Text("Birim: ${item.birim ?? ""}"),
        ],
      ),
      trailing: IconButton(
        onPressed: () async {
          bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              if (yetkiController.genelBelgeKontrolSil)
                BottomSheetModel(
                  title: "Kontrol Kayıtlarını Sil",
                  iconWidget: Icons.delete_outline_outlined,
                  onTap: () {
                    Get.back();
                    dialogManager.showAreYouSureDialog(() async {
                      await viewModel.deleteKalem(item);
                    });
                  },
                ),
              BottomSheetModel(
                title: "Stok İşlemleri",
                iconWidget: Icons.list_alt,
                onTap: () async {
                  Get.back();
                  await dialogManager.showStokGridViewDialog(
                    await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)),
                  );
                },
              ),
            ],
          );
        },
        icon: const Icon(Icons.more_vert_outlined),
      ),

      onTap: () async {
        final result = await Get.toNamed("mainPage/belgeKalemlerEdit", arguments: item);
        if (result == true) {
          await viewModel.resetList();
        }
      },
    ),
  );
}
