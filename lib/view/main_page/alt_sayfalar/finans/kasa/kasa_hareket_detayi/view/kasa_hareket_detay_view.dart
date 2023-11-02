import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

class KasaHareketDetayiView extends StatefulWidget {
  final CariListesiModel cariListesiModel;
  const KasaHareketDetayiView({super.key, required this.cariListesiModel});

  @override
  State<KasaHareketDetayiView> createState() => _KasaHareketDetayiViewState();
}

class _KasaHareketDetayiViewState extends BaseState<KasaHareketDetayiView> {
  CariListesiModel get model => widget.cariListesiModel;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Kasa Hareket Detayı",
            subtitle: model.cariAdi,
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(),
                  ),
                  Expanded(
                    child: CustomTextField(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(),
                  ),
                  Expanded(
                    child: CustomTextField(),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(),
                  ),
                  Expanded(
                    child: CustomTextField(),
                  ),
                ],
              ),
              CustomTextField(),
            ],
          ),
        ),
      );
}
