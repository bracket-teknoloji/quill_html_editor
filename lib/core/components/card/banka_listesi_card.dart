import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_listesi/model/kasa_listesi_model.dart";

class KasaListesiCard extends StatefulWidget {
  const KasaListesiCard({
    super.key,
    required this.item,
  });

  final KasaListesiModel? item;

  @override
  State<KasaListesiCard> createState() => _KasaListesiCardState();
}

class _KasaListesiCardState extends BaseState<KasaListesiCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () async {
            dialogManager.showKasaGridViewDialog(widget.item);
          },
          leading: CircleAvatar(
            child: Text(widget.item?.kasaTanimi?[0] ?? ""),
          ),
          title: Text("${widget.item?.kasaKodu != null ? '${widget.item?.kasaKodu} - ' : ''}${widget.item?.kasaTanimi ?? ""}"),
          subtitle: Text(
              "Devir Tutarı: ${(widget.item?.dovizli == "E" ? widget.item?.dovizDevirTutari : widget.item?.devirTutari)?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.item?.dovizli == "E" ? (widget.item?.dovizAdi ?? "") : mainCurrency}"),
          trailing: Text.rich(
            TextSpan(
                children: [
              TextSpan(
                  style: TextStyle(
                      color:
                          ((widget.item?.dovizli == "E" ? (widget.item?.devirliDovizBakiye ?? widget.item?.dovizDevirTutari ?? 0) : widget.item?.devirliBakiye ?? 0) < 0) ? Colors.red : Colors.green),
                  text:
                      "${(widget.item?.dovizli == "E" ? (widget.item?.devirliDovizBakiye ?? widget.item?.dovizDevirTutari) : widget.item?.devirliBakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.item?.dovizli == "E" ? (widget.item?.dovizAdi ?? "") : mainCurrency}\n"),
              widget.item?.dovizli == "E"
                  ? TextSpan(text: "${(widget.item?.dovizli == "E" ? widget.item?.devirliBakiye : widget.item?.bakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")
                  : null
            ].nullCheckWithGeneric),
            textAlign: TextAlign.end,
          )),
    );
  }
}
