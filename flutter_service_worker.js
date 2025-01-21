'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/assets/png/logo1.1.png": "d68436e54803d7b24c0067384a5d3238",
"assets/assets/png/flutter_logo.png": "20ed1ffaf6047de27f152124d114127c",
"assets/assets/png/portfolio.mp4": "a4f86b4cc28f0dbc23e4b962b04e1179",
"assets/assets/png/noise.png": "169f7306dbbedf1194c08c47f294723d",
"assets/assets/png/brand1.1.png": "9092b40614726ea1291c3017ae8880cf",
"assets/assets/dark_theme.json": "30c78d3ce72343332c4b8b20db26f3e7",
"assets/assets/light_theme.json": "857da09f4408e7590c8c5006e1d6b577",
"assets/assets/lottie/json/multiplatform_coding.json": "b40668e9cfd7ac70de8068a65c1f2fe0",
"assets/assets/lottie/json/coding_flutter_react.json": "4176513ef27a37bdd1a6b9e174e2bb20",
"assets/assets/lottie/json/linkedin.json": "d9b3f868a9bdec2d75f4bfa36205523e",
"assets/assets/lottie/json/coding_coffee_cup.json": "98c86604c944d53570b81291e23c7002",
"assets/assets/lottie/json/coding.json": "1657e2c66090207e40703b3d81f85374",
"assets/assets/lottie/json/whatsapp.json": "388b97fb8285dff15263fc33183d0b02",
"assets/assets/lottie/json/instagram.json": "50b4db78ff0c6bb97e8f7b8255a986fc",
"assets/assets/lottie/json/github.json": "fe15e371c76db2d7f97bb815a7772deb",
"assets/assets/rive/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/rive/house.riv": "3ac77437a4c56b5143d6ceca83dd61d9",
"assets/assets/rive/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"assets/assets/rive/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/rive/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/rive/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/rive/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/AssetManifest.bin": "d454a6dadf68abb88cf4eaed1463b1d3",
"assets/NOTICES": "52336ff83dde70045f161c77d8704007",
"assets/AssetManifest.json": "68b538c01b52ea0448c3193af18396d7",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/FontManifest.json": "3c6f2aec284ba6e927fd5e00fb6c4257",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "4252fb51d5051fb8473b3262e4380300",
"version.json": "9b818ca9511483c901bed1545384376c",
"manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"splash/img/dark-4x.png": "fe5b62f3112d44bc1510c0569527b87c",
"splash/img/dark-2x.png": "c7387be012fcb970c2cb283044dd7cbe",
"splash/img/branding-1x.png": "15a2731a4049ae86b5f1e35356c27088",
"splash/img/branding-dark-3x.png": "559cab82fdf4a73f9767c02da48fc541",
"splash/img/light-2x.png": "c7387be012fcb970c2cb283044dd7cbe",
"splash/img/branding-2x.png": "6fdd05b62b98563b0ba861074d63ea23",
"splash/img/dark-3x.png": "76bda70c0cba9cc85cece95badc215e4",
"splash/img/branding-3x.png": "559cab82fdf4a73f9767c02da48fc541",
"splash/img/dark-1x.png": "50fc4501bf523d33a19b3d53ca49fcf3",
"splash/img/branding-dark-1x.png": "15a2731a4049ae86b5f1e35356c27088",
"splash/img/branding-dark-4x.png": "8145c90914f96d1467a30ec7e17aa1d1",
"splash/img/branding-dark-2x.png": "6fdd05b62b98563b0ba861074d63ea23",
"splash/img/light-3x.png": "76bda70c0cba9cc85cece95badc215e4",
"splash/img/light-1x.png": "50fc4501bf523d33a19b3d53ca49fcf3",
"splash/img/light-4x.png": "fe5b62f3112d44bc1510c0569527b87c",
"splash/img/branding-4x.png": "8145c90914f96d1467a30ec7e17aa1d1",
"index.html": "30cef655ceced6fec4e1f581afc17bac",
"/": "30cef655ceced6fec4e1f581afc17bac",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "b331f9c8c8620827b58495444089b899",
"main.dart.js": "e0b755704d97196dc295f8b25f8b3b39"};
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
