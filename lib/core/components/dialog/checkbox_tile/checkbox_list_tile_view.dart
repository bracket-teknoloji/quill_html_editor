import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_sehirler_model.dart';
import '../../../base/model/generic_response_model.dart';
import '../../../base/state/base_state.dart';
import '../../../init/network/login/api_urls.dart';
import 'checkbox_tile_view_model.dart';

class CheckBoxListTileDialog extends StatefulWidget {
  const CheckBoxListTileDialog({super.key});

  @override
  State<CheckBoxListTileDialog> createState() => _CheckBoxListTileDialogState();
}

class _CheckBoxListTileDialogState extends BaseState<CheckBoxListTileDialog> {
  List? valueList;
  List? response;
  CheckBoxTileViewModel viewModel = CheckBoxTileViewModel();
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      response = value!.data;
      viewModel
          .changeValueList(List.generate(response!.length, (index) => false));
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // CacheManager.setCariSehirler(valueList!);
  }

  @override
  Widget build(BuildContext context) {
    return response != null
        ? Column(
            children: List.generate(response!.length, (index) {
              return Observer(builder: (_) {
                return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: response?[index].sehirAdi != null
                        ? Text(response?[index].sehirAdi!)
                        : const Text(""),
                    value: viewModel.valueList![index],
                    onChanged: (value) => viewModel.changeValueList(
                        viewModel.valueList!..[index] = value!));
              });
            }),
          )
        : const Center(child: CircularProgressIndicator.adaptive());
  }

  Future<GenericResponseModel<CariSehirlerModel>?> getData() async {
    final response = await networkManager.dioGet<CariSehirlerModel>(
        path: ApiUrls.getCariKayitliSehirler,
        bodyModel: CariSehirlerModel(),
        addTokenKey: true,
        headers: {
          // "VERITABANI": AccountModel.instance.aktifVeritabani.toString(),
          // "ISLETME_KODU": AccountModel.instance.aktifIsletmeKodu.toString(),
          // "SUBE_KODU": AccountModel.instance.aktifSubeKodu.toString(),
        });
    return response as GenericResponseModel<CariSehirlerModel>;
  }
}
