'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "dcf333f9095b0eba2842129686a46873",
"version.json": "2b7c18e7e8b6813ff0c0d7a120c18563",
"index.html": "2745ba3f46c63a0fb1a0af91fd23d48e",
"/": "2745ba3f46c63a0fb1a0af91fd23d48e",
"firebase-messaging-sw.js": "8ff7d691b76d2096775fdf53372c805d",
"main.dart.js": "ff5ac050a58a6cbd41672fdc064dfd9c",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"favicon.png": "d07f41758b3fb6f8821c73cea809b809",
"icons/Icon-192.png": "06b208e86c206abae6212722ce6d21c1",
"icons/Icon-maskable-192.png": "06b208e86c206abae6212722ce6d21c1",
"icons/Icon-maskable-512.png": "34a92414f8148991497db7b9bfc5e842",
"icons/Icon-512.png": "34a92414f8148991497db7b9bfc5e842",
"manifest.json": "87c06deeeac613172fcc7e2689d1f2ec",
"assets/locales/TR.json": "167f870eb4d9ca7e3857b4c531945ea8",
"assets/locales/EN_US.json": "6475fb19d931728b86732606150b21a8",
"assets/AssetManifest.json": "a1f977dd3961d51bce7635042e4a0cda",
"assets/NOTICES": "e4a4a301c13d4cba5557da1275e9a777",
"assets/FontManifest.json": "ea9dc826036577df024fd0fe176dd298",
"assets/AssetManifest.bin.json": "da2bac50697827e5fe1929d39320fe85",
"assets/packages/quill_html_editor/assets/delete_row.png": "3a56332918794e49ffca20016948553d",
"assets/packages/quill_html_editor/assets/insert_column_left.png": "114e6cca4b2f60a5eaebe4e574f2c36d",
"assets/packages/quill_html_editor/assets/insert_table.png": "c8f041a07bc6b8e4010ccf93ba4c291d",
"assets/packages/quill_html_editor/assets/h1_dark.png": "aa135c261ba758a3990d4594d982104d",
"assets/packages/quill_html_editor/assets/insert_row_above.png": "80ae3856d5f7415d9957d9a1699ec782",
"assets/packages/quill_html_editor/assets/insert_column_right.png": "fb27c4e3cc557089f79dd1f0cc937d62",
"assets/packages/quill_html_editor/assets/insert_row_below.png": "cea46607b37038f71c0fec22341b80e4",
"assets/packages/quill_html_editor/assets/camera_roll_icon.png": "962f1d57cab7451d4b92b236b1993bd5",
"assets/packages/quill_html_editor/assets/scripts/quill_2.0.0_4_min.js": "3f4b931496920ee12125e575f1c15dfa",
"assets/packages/quill_html_editor/assets/delete_column.png": "62358bf5aa9ac7f18e2411e4a0c63f14",
"assets/packages/quill_html_editor/assets/delete_table.png": "37e148071ce0a306a27f296369e52f40",
"assets/packages/quill_html_editor/assets/edit_table.png": "6a51397f56e90d98ae0b46a2e359676f",
"assets/packages/quill_html_editor/assets/h2_dark.png": "037de75dfed94244b78e7493c6425586",
"assets/packages/syncfusion_flutter_pdfviewer/assets/squiggly.png": "c9602bfd4aa99590ca66ce212099885f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/strikethrough.png": "cb39da11cd936bd01d1c5a911e429799",
"assets/packages/syncfusion_flutter_pdfviewer/assets/highlight.png": "7384946432b51b56b0990dca1a735169",
"assets/packages/syncfusion_flutter_pdfviewer/assets/underline.png": "c94a4441e753e4744e2857f0c4359bf0",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/awesome_dialog/assets/rive/info_reverse.riv": "c6e814d66c0e469f1574a2f171a13a76",
"assets/packages/awesome_dialog/assets/rive/question.riv": "00f02da4d08c2960079d4cd8211c930c",
"assets/packages/awesome_dialog/assets/rive/warning.riv": "0becf971559a68f9a74c8f0c6e0f8335",
"assets/packages/awesome_dialog/assets/rive/info.riv": "2a425920b11404228f613bc51b30b2fb",
"assets/packages/awesome_dialog/assets/rive/success.riv": "73618ab4166b406e130c2042dc595f42",
"assets/packages/awesome_dialog/assets/rive/error.riv": "e74e21f8b53de4b541dd037c667027c1",
"assets/packages/awesome_dialog/assets/flare/succes.flr": "ebae20460b624d738bb48269fb492edf",
"assets/packages/awesome_dialog/assets/flare/succes_without_loop.flr": "3d8b3b3552370677bf3fb55d0d56a152",
"assets/packages/awesome_dialog/assets/flare/error.flr": "e3b124665e57682dab45f4ee8a16b3c9",
"assets/packages/awesome_dialog/assets/flare/info2.flr": "21af33cb65751b76639d98e106835cfb",
"assets/packages/awesome_dialog/assets/flare/warning_without_loop.flr": "c84f528c7e7afe91a929898988012291",
"assets/packages/awesome_dialog/assets/flare/info_without_loop.flr": "cf106e19d7dee9846bbc1ac29296a43f",
"assets/packages/awesome_dialog/assets/flare/warning.flr": "68898234dacef62093ae95ff4772509b",
"assets/packages/awesome_dialog/assets/flare/info.flr": "bc654ba9a96055d7309f0922746fe7a7",
"assets/packages/awesome_dialog/assets/flare/question.flr": "1c31ec57688a19de5899338f898290f0",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5805692777c062a56e8205325679344d",
"assets/fonts/MaterialIcons-Regular.otf": "75e957ae5654bb662059176265acce64",
"assets/assets/app_icon/beyaz_400.png": "e4cfea22f0accfaac42d5e4e784e66af",
"assets/assets/app_icon/beyaz_200.png": "4d3f875877123c977105b3cc91dec0c9",
"assets/assets/app_icon/app_icon.png": "cac222e648a0d1889318e44d76338df6",
"assets/assets/app_icon/splash.json": "6761b9b5c8fcb18439257d2ab720ce14",
"assets/assets/app_icon/PickerLogoBeyaz.svg": "63cebdb7ef878074f6834c6d3aa80af3",
"assets/assets/app_icon/beyaz_1024.png": "8d51b40dd2b31da6ec609ce5de60b523",
"assets/assets/splash/PickerLogoTuruncu.svg": "a80223828a5ad20616ec340720fdc5e3",
"assets/assets/splash/PickerLogoTuruncu.png": "9887a207e94b2b36c4636999825de81c",
"assets/assets/splash/mapMarker.png": "d94f319bd9975bf7a6547eb9e32b7d71",
"assets/assets/splash/PickerLogoTuruncu1024.png": "5abddab4c89edca95d486402558e30e7",
"assets/assets/lotties/image_processing_lottie.json": "087b72c2a49282f8d3dd5eb884b41625",
"assets/assets/lotties/person_lottie.json": "43b1dd44906c2f70f6c771e3cc5c9b55",
"assets/assets/lotties/chart_lottie.json": "d23a8c509df6680ecb1aed19f2afdf79",
"assets/assets/lotties/person.lottie": "f20bbd4ca0cf42724647a6d3e8d42cbd",
"assets/assets/lotties/location_lottie.json": "a45d783c0aaafa417425da991aa825c3",
"assets/assets/icons/PickerSvgIcon/Thumbs.db": "cc64ce033ad1422dcf62370ebe564648",
"assets/assets/icons/PickerSvgIcon/Information.svg": "87750b994279adc78e978c6771e6693b",
"assets/assets/icons/PickerSvgIcon/KilitAcik.svg": "473a0b6c796329666ea6017a8fd96959",
"assets/assets/icons/PickerSvgIcon/Duzenle.svg": "861b222e1c00ef86a4d52960be596eb1",
"assets/assets/icons/PickerSvgIcon/Can-Uyari.svg": "bca997d236c922f67d00de717056758b",
"assets/assets/icons/PickerSvgIcon/Guvenlik.svg": "084fa0aa0f810bc5cd841b1e6ecc8dad",
"assets/assets/icons/PickerSvgIcon/User-Account.svg": "03cee230b931202ba144815a34f5eab4",
"assets/assets/icons/PickerSvgIcon/Tamam-Okey.svg": "61a6cd59ca34d7f4dab594fd5294bd49",
"assets/assets/icons/PickerSvgIcon/BaglantiSekli.svg": "2869867a472bb4a5cbe673e9bd047f17",
"assets/assets/icons/PickerSvgIcon/Mercek.svg": "8f13f96ddca94e9d6919d114a3bc1a90",
"assets/assets/icons/PickerSvgIcon/Saat.svg": "8c034d3b7a3d0bfa17b1648f0012b957",
"assets/assets/icons/PickerSvgIcon/Wifi.svg": "5b25202ba6575c3650a30f65dc80b1f2",
"assets/assets/icons/PickerSvgIcon/AnaMenu/pallet.svg": "f89b8c408cbb82fd0b274e6f74132909",
"assets/assets/icons/PickerSvgIcon/AnaMenu/quality_control.svg": "88a161bf67fe4fbd90146ce1a37045be",
"assets/assets/icons/PickerSvgIcon/AnaMenu/atm_dollar.svg": "63a7da4ddf2d707967272907facac022",
"assets/assets/icons/PickerSvgIcon/AnaMenu/supervisor.svg": "465c83bf7580b9f08e8213953cd4c5c5",
"assets/assets/icons/PickerSvgIcon/AnaMenu/monitoring.svg": "84ce0b3525de78b8c0eb7f3fe20c3955",
"assets/assets/icons/PickerSvgIcon/AnaMenu/counter.svg": "a939843abd93f1b02b69663fa27735dd",
"assets/assets/icons/PickerSvgIcon/AnaMenu/trolley.svg": "90369310f95173c2a1f1b02269c2356a",
"assets/assets/icons/PickerSvgIcon/AnaMenu/inventory.svg": "7a03a05dced12c171d197e5abd153549",
"assets/assets/icons/PickerSvgIcon/AnaMenu/order.svg": "6ddd6b04b4449ba0d98c273b6af2a62d",
"assets/assets/icons/PickerSvgIcon/AnaMenu/settings.svg": "7e76905ad997bb7e975eaa36771f6175",
"assets/assets/icons/PickerSvgIcon/AnaMenu/forklift.svg": "e7991d91f5b3104a7d4e5b04c5839655",
"assets/assets/icons/PickerSvgIcon/AnaMenu/offer.svg": "b95ac97a6564a8768bccec8c309f0c27",
"assets/assets/icons/PickerSvgIcon/AnaMenu/wallet.svg": "56e6eb66e41779b3ec14e4df8c8a75d1",
"assets/assets/icons/PickerSvgIcon/AnaMenu/factory_2.svg": "156375ef0607cf6f09d9dc89ac2f1288",
"assets/assets/icons/PickerSvgIcon/AnaMenu/shelves.svg": "6fecbd8ccfc4e2028ef6eae7b79ee1c9",
"assets/assets/icons/PickerSvgIcon/AnaMenu/e_belge.svg": "d9af6c764b0a9b4198e1348c37644e1b",
"assets/assets/icons/PickerSvgIcon/AnaMenu/profile.svg": "6bbc5d078acd4c290ca88b0b4cb1ce14",
"assets/assets/icons/PickerSvgIcon/Carpi-Kapat.svg": "d9edaf9780204257b1ab7480fd1eda06",
"assets/assets/icons/PickerSvgIcon/sirket_degistir.svg": "4f4aeb1ac9ae7872ac34590989c2b62c",
"assets/assets/icons/PickerSvgIcon/Unlem.svg": "7751bb3b000f7d79cbf9845ec7807cb0",
"assets/assets/icons/PickerSvgIcon/Yenile.svg": "c6f79c965105ddfd5611de866ee809e4",
"assets/assets/icons/PickerSvgIcon/Cikis.svg": "8c4b6a070f566b515c4d7b6aea3f4217",
"assets/assets/icons/PickerSvgIcon/Yildiz.svg": "b42574c91218d2148e2aecd7851322b2",
"assets/assets/icons/PickerSvgIcon/Konum.svg": "cda7bdf4d211884dc71e419cada4bd2b",
"assets/assets/icons/PickerSvgIcon/Kilitli.svg": "e8a745597129f362fa96e50c6bd600d9",
"assets/assets/icons/PickerSvgIcon/Goz.svg": "608db4e346f0791e021e8786baed0998",
"assets/assets/icons/PickerSvgIcon/AnaSayfa.svg": "f8577672e34e77e8d51ba05fd679eab0",
"assets/assets/translations/tr.json": "83478a13e772f24a12ca91ab10350737",
"assets/assets/translations/en.json": "67107bf7bca3c367d6f4f2aefab71ecd",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
