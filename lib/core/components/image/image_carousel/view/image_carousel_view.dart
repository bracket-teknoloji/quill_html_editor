import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/image/image_carousel/view_model/image_carousel_view_model.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";

final class ImageCarouselView extends StatefulWidget {
  final BaseStokMixin model;
  const ImageCarouselView({super.key, required this.model});

  @override
  State<ImageCarouselView> createState() => _ImageCarouselViewState();
}

final class _ImageCarouselViewState extends BaseState<ImageCarouselView> {
  final ImageCarouselViewModel viewModel = ImageCarouselViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(EvraklarRequestModel.fromStokModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => viewModel.getData());
    super.initState();
  }

  final Radius radius = const Radius.circular(36);

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Görseller",
            subtitle: widget.model.stokAdi ?? widget.model.stokKodu,
          ),
        ),
        body: Observer(
          builder: (_) => viewModel.observableList == null
              ? Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.modulate,
                    ),
                    child: Assets.lotties.imageProcessingLottie.lottie(),
                  ),
                )
              : Observer(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: radius,
                            topRight: radius,
                            bottomLeft: viewModel.onlyOneItem ? radius : UIHelper.lowBorderRadius.topRight,
                            bottomRight: viewModel.onlyOneItem ? radius : UIHelper.lowBorderRadius.topRight,
                          ),
                          child: InteractiveViewer(
                            child: Observer(
                              builder: (_) => ImageWidget(path: viewModel.selectedImage, fit: false),
                            ),
                          ),
                        ),
                      ),
                      if (viewModel.observableList?.length != 1)
                        Expanded(
                          flex: 3,
                          child: Observer(
                            builder: (_) => CarouselView(
                              itemExtent: context.isPortrait ? width / 1.3 : height / 1.3,
                              // shrinkExtent: width / 4,
                              elevation: 0.9,
                              padding: const EdgeInsets.only(top: UIHelper.lowSize, bottom: UIHelper.lowSize, right: UIHelper.lowSize),
                              itemSnapping: true,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
                              onTap: (value) {
                                final item = viewModel.observableList?[value];
                                viewModel.setSelectedImage(item?.resimUrl);
                                // Get.to(
                                //   () => ImageView(
                                //     path: item?.resimUrl ?? "",
                                //     title: item?.belgeNo ?? "",
                                //   ),
                                //   fullscreenDialog: true,
                                // );
                              },
                              children: viewModel.observableList
                                      ?.map(
                                        (item) => Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            ImageWidget(path: item.resimUrl),
                                            Container(
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: <Color>[
                                                    Colors.black.withAlpha(0),
                                                    Colors.black12,
                                                    Colors.black45,
                                                  ],
                                                ),
                                              ),
                                              child: Text(item.aciklama ?? "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)).paddingAll(UIHelper.lowSize),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                          ),
                        ),
                    ],
                  ).paddingSymmetric(horizontal: UIHelper.lowSize).paddingOnly(bottom: UIHelper.midSize),
                ),
        ),
      );
}
