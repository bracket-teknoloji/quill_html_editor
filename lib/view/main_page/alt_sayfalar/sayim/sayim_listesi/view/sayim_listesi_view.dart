import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/view_model/sayim_listesi_view_model.dart";

class SayimListesiView extends StatefulWidget {
  const SayimListesiView({super.key});

  @override
  State<SayimListesiView> createState() => _SayimListesiViewState();
}

class _SayimListesiViewState extends State<SayimListesiView> {
  final SayimListesiViewModel viewModel = SayimListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Sayım",
              subtitle: (viewModel.sayimList?.length ?? 0).toString(),
            ),
          ),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            await viewModel.getData();
          },
          child: Observer(
            builder: (_) {
              if (viewModel.sayimList == null) {
                return const ListViewShimmer();
              }
              if (viewModel.sayimList?.isEmpty == true) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off_outlined, size: 100, color: Colors.grey.shade300),
                      const Text("Sayım listesi boş"),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: viewModel.sayimList?.length ?? 0,
                itemBuilder: (context, index) {
                  final SayimListesiModel model = viewModel.sayimList![index];
                  return Card(
                    color: model.filtreliMi ? ColorPalette.persianRed.withOpacity(0.5) : null,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.fisno ?? ""),
                          Row(
                            children: [
                              const ColorfulBadge(label: Text("Serbest"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.serbestMi),
                              const ColorfulBadge(label: Text("Filtre"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.filtreliMi),
                            ].nullCheck.map((Widget e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
                          ),
                        ],
                      ),
                      subtitle: CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Başlama Tarihi: ${model.baslangicTarihi?.toDateString ?? ""}").yetkiVarMi(model.serbestMi),
                          Text("Depolar: ${model.depoList?.any((element) => element == -1) == true ? "Tümü" : model.depoList?.first}").yetkiVarMi(model.depoList != null),
                          Text("Kullanıcı: ${model.kullanicilar}").yetkiVarMi(model.kullanicilar != null),
                          Text("Miktar: ${model.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
                          Text("Depo Miktarı: ${model.depoMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.depoMiktari != null),
                          Text("Fark: ${model.fark}").yetkiVarMi(model.miktar != null),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
