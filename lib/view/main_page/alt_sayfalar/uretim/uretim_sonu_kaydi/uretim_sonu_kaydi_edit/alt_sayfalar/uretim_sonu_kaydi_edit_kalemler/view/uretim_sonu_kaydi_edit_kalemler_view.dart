import "package:flutter/material.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class UretimSonuKaydiEditKalemlerView extends StatefulWidget {
  const UretimSonuKaydiEditKalemlerView({super.key});

  @override
  State<UretimSonuKaydiEditKalemlerView> createState() => _UretimSonuKaydiEditKalemlerViewState();
}

class _UretimSonuKaydiEditKalemlerViewState extends State<UretimSonuKaydiEditKalemlerView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            CustomTextField(onTap: () {}),
            RefreshableListView<KalemModel>(onRefresh: () async {}, items: const [], itemBuilder: (item) => const Text("")),
          ],
        ),
      );
}
