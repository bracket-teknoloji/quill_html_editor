import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/image/image_carousel/view_model/image_carousel_view_model.dart";
import "package:picker/core/components/image/image_view.dart";
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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Görseller",
            subtitle: widget.model.stokAdi ?? widget.model.stokKodu,
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.5,
              maxWidth: width,
            ),
            child: Observer(
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
                  : CarouselView(
                      itemExtent: width / 1.3,
                      shrinkExtent: width / 4,
                      elevation: 0.9,
                      itemSnapping: true,
                      onTap: (value) {
                        final item = viewModel.observableList?[value];
                        Get.to(
                          () => ImageView(
                            path: item?.resimUrl ?? "",
                            title: item?.belgeNo ?? "",
                          ),
                          fullscreenDialog: true,
                        );
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
        ),
      );
}
