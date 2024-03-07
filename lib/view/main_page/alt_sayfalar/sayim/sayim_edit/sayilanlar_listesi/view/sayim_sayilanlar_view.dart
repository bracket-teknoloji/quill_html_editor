import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/view_model/sayim_sayilanlar_view_model.dart";

class SayimSayilanlarView extends StatefulWidget {
  const SayimSayilanlarView({super.key});

  @override
  State<SayimSayilanlarView> createState() => SayimSayilanlarViewState();
}

class SayimSayilanlarViewState extends BaseState<SayimSayilanlarView> {
  final SayimSayilanlarViewModel viewModel = SayimSayilanlarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            labelText: "Ara",
            onChanged: viewModel.setFilterText,
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await viewModel.getData();
              },
              child: Observer(
                builder: (_) {
                  if (viewModel.sayimListesi == null) return const ListViewShimmer();
                  if (viewModel.sayimListesi!.isEmpty) return const Center(child: Text("Sayım Listesi Boş"));
                  return ListView.builder(
                    itemCount: viewModel.sayimListesi?.length ?? 0,
                    itemBuilder: (context, index) {
                      final sayimModel = viewModel.sayimListesi![index];
                      return Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(sayimModel.kayittarihi?.toDateTimeString() ?? ""),
                              const Spacer(),
                              Text("Kayıt No ${sayimModel.id}"),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${sayimModel.stokAdi}"),
                              CustomLayoutBuilder(
                                splitCount: 2,
                                children: [
                                  Text("Stok Kodu: ${sayimModel.stokKodu}"),
                                  Text("Miktar: ${sayimModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                                  Text("Depo: ${sayimModel.depoTanimi}"),
                                  Text("Kullanıcı: ${sayimModel.kayityapankul}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize);
}
