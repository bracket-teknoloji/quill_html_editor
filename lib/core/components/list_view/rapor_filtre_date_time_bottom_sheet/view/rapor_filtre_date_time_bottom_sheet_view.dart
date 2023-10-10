import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/ui_helper/duration_helper.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../textfield/custom_text_field.dart";
import "../view_model/rapor_filtre_date_time_bottom_sheet_view_model.dart";

class RaporFiltreDateTimeBottomSheetView extends StatefulWidget {
  final TextEditingController baslangicTarihiController;
  final TextEditingController bitisTarihiController;
  final void Function(int? index) filterOnChanged;
  final dynamic Function()? baslangicOnTap;
  final dynamic Function()? bitisOnTap;

  const RaporFiltreDateTimeBottomSheetView(
      {super.key,
      required this.filterOnChanged,
      required this.baslangicTarihiController,
      required this.bitisTarihiController,
      this.baslangicOnTap,
      this.bitisOnTap});

  @override
  State<RaporFiltreDateTimeBottomSheetView> createState() =>
      _RaporFiltreDateTimeBottomSheetViewState();
}

class _RaporFiltreDateTimeBottomSheetViewState
    extends State<RaporFiltreDateTimeBottomSheetView> {
  late final ScrollController scrollController;
  RaporFiltreDateTimeBottomSheetViewModel viewModel =
      RaporFiltreDateTimeBottomSheetViewModel();

  @override
  void initState() {
    scrollController = ScrollController();
    Future.delayed(Duration.zero, () async {
      await scrollController.animateTo(30,
          duration: DurationHelper.durationLow, curve: Curves.easeIn);
      await scrollController.animateTo(
          (scrollController.positions.isNotEmpty)
              ? (scrollController.position.minScrollExtent)
              : 0,
          duration: DurationHelper.durationLow,
          curve: Curves.easeInOut);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      CustomTextField(
          labelText: "Başlangıç Tarihi",
          readOnly: true,
          controller: widget.baslangicTarihiController,
          isDateTime: true,
          onTap: () async =>
              widget.baslangicOnTap ??
              getDate(true).then((value) => widget.filterOnChanged(9))),
      CustomTextField(
        labelText: "Bitiş Tarihi",
        readOnly: true,
        controller: widget.bitisTarihiController,
        isDateTime: true,
        onTap: () async =>
            widget.bitisOnTap ??
            getDate(false).then((value) => widget.filterOnChanged(9)),
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Listener(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.childrenTitleList.length,
                itemBuilder: (context, listTileIndex) => RadioMenuButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 12))),
                    value: listTileIndex,
                    groupValue: viewModel.groupValue,
                    onChanged: (index) {
                      widget.baslangicTarihiController.text = viewModel
                              .startDateMap[
                                  viewModel.childrenTitleList[index ?? 0]]
                              .toDateStringIfNull() ??
                          "";
                      widget.bitisTarihiController.text = index != 0
                          ? viewModel.finishDateMap[
                                      viewModel.childrenTitleList[index ?? 0]]
                                  .toDateStringIfNull() ??
                              ""
                          : "";
                      widget.filterOnChanged(index);
                      viewModel.changeGroupValue(index ?? 0);
                      setState(() {});
                    },
                    child: Text(viewModel.childrenTitleList[listTileIndex]))),
          ),
        ).paddingAll(UIHelper.lowSize),
        Row(
          children: children2.map((e) => Expanded(child: e)).toList(),
        )
      ],
    );
  }

  Future<void> getDate(bool isBaslangic) async {
    var result = await showDatePicker(
      context: context,
      initialDate: isBaslangic
          ? (widget.baslangicTarihiController.text != ""
              ? widget.baslangicTarihiController.text.toDateTimeDDMMYYYY()
              : DateTime.now())
          : (widget.bitisTarihiController.text != ""
              ? widget.bitisTarihiController.text.toDateTimeDDMMYYYY()
              : DateTime.now()),
      firstDate: (isBaslangic
          ? DateTime(2000)
          : (widget.baslangicTarihiController.text != ""
              ? widget.baslangicTarihiController.text.toDateTimeDDMMYYYY()
              : DateTime.now())),
      lastDate: (isBaslangic
          ? (widget.bitisTarihiController.text != ""
              ? widget.bitisTarihiController.text.toDateTimeDDMMYYYY()
              : DateTime.now())
          : DateTime.now()),
      // currentDate: DateFormat("dd.MM.yyyy").parse(baslangicTarihiController?.text ?? DateTime.now().toDateString),
    );
    if (result != null) {
      isBaslangic
          ? widget.baslangicTarihiController.text = result.toDateString
          : widget.bitisTarihiController.text = result.toDateString;
      viewModel.resetGroupValue();
    }
    return isBaslangic
        ? widget.baslangicOnTap?.call()
        : widget.bitisOnTap?.call();
  }
}
