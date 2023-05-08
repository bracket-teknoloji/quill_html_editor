import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/textfield/custom_textfield.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_appbar_model.dart';

import '../../../../../../core/base/state/base_state.dart';
import 'dialog/cari_aktivite_filtre_dialog.dart';

class CariAktiviteView extends StatefulWidget {
  const CariAktiviteView({super.key});

  @override
  State<CariAktiviteView> createState() => _CariAktiviteViewState();
}

class _CariAktiviteViewState extends BaseState<CariAktiviteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cari Aktiviteleri ()"),
          actions: [IconButton(onPressed: () => CariAktiviteFiltreDialogManager.showAktiviteDialog(context), icon: const Icon(Icons.filter_alt_outlined))],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.1),
              child: const CustomTextField(
                text: "Ara",
                children: [
                  TextField(
                    decoration: InputDecoration(suffixIcon: Icon(Icons.search_outlined)),
                  )
                ],
              ).paddingAll(UIHelper.midSize)),
        ),
        body: SizedBox(
          height: height * 0.07,
          child: ListView.builder(
              shrinkWrap: true,
              // itemExtent: width * 0.23,
              scrollDirection: Axis.horizontal,
              itemCount: AppbarToggleButtonClass.liste.length,
              itemBuilder: (context, index) {
                return AppBarButton(
                    onPressed: AppbarToggleButtonClass.liste[index].onTap,
                    child: Text(
                      AppbarToggleButtonClass.liste[index].title,
                      softWrap: true,
                    )).paddingAll(UIHelper.lowSize);
              }),
        ));
  }
}
