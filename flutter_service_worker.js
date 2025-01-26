'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f393d3c16b631f36852323de8e583132",
"splash/img/dark-2x.png": "8d32ad15bdc61f0c110b23aa4f2208a4",
"splash/img/light-4x.png": "a1d13a40afcfae43b962d2fa427c42e1",
"splash/img/light-3x.png": "809aa53bd4b7e34c5d1dc1f5bc82ba27",
"splash/img/dark-3x.png": "809aa53bd4b7e34c5d1dc1f5bc82ba27",
"splash/img/light-1x.png": "5e81d3c902087f4e5470174a0e94b733",
"splash/img/dark-4x.png": "a1d13a40afcfae43b962d2fa427c42e1",
"splash/img/dark-1x.png": "5e81d3c902087f4e5470174a0e94b733",
"splash/img/light-2x.png": "8d32ad15bdc61f0c110b23aa4f2208a4",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "9b818ca9511483c901bed1545384376c",
"flutter_bootstrap.js": "12a097f370efd7fe5964d6e16ab5b821",
"manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
"main.dart.js": "719d2d4489258b1ed08a9d1be278380c",
"index.html": "5f65e5a1152d0d6f33e62bf1e8c4c940",
"/": "5f65e5a1152d0d6f33e62bf1e8c4c940",
"assets/AssetManifest.json": "40a875a90e9580c88f9f0be6c8cf9e56",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.bin": "33565b3d480e4db1621af4d2a4119a27",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/FontManifest.json": "3c6f2aec284ba6e927fd5e00fb6c4257",
"assets/AssetManifest.bin.json": "25eb38250dc0c91b3aa9d9991dc7aa68",
"assets/NOTICES": "52336ff83dde70045f161c77d8704007",
"assets/assets/light_theme.json": "857da09f4408e7590c8c5006e1d6b577",
"assets/assets/lottie/json/coding_coffee_cup.json": "98c86604c944d53570b81291e23c7002",
"assets/assets/lottie/json/linkedin.json": "d9b3f868a9bdec2d75f4bfa36205523e",
"assets/assets/lottie/json/multiplatform_coding.json": "b40668e9cfd7ac70de8068a65c1f2fe0",
"assets/assets/lottie/json/instagram.json": "50b4db78ff0c6bb97e8f7b8255a986fc",
"assets/assets/lottie/json/whatsapp.json": "388b97fb8285dff15263fc33183d0b02",
"assets/assets/lottie/json/github.json": "fe15e371c76db2d7f97bb815a7772deb",
"assets/assets/lottie/json/coding_flutter_react.json": "4176513ef27a37bdd1a6b9e174e2bb20",
"assets/assets/lottie/json/coding.json": "1657e2c66090207e40703b3d81f85374",
"assets/assets/dark_theme.json": "30c78d3ce72343332c4b8b20db26f3e7",
"assets/assets/png/noise.png": "169f7306dbbedf1194c08c47f294723d",
"assets/assets/png/logo.png": "2c32c3011bc5d68ad53cdff4d37db0ae",
"assets/assets/png/logo/react.gif": "6be1cc990150342efacc264165f16026",
"assets/assets/png/logo/flutter_dart.png": "423798ed2bac9b563439a69786ac5d54",
"assets/assets/png/logo/PowerApps_PowerAutomate.png": "1b3c87ba0277412d11bf1669c89a81dc",
"assets/assets/png/logo/js_react.png": "7632a9e0b7582f53d4aeda3f68281157",
"assets/assets/png/logo/java_SpringBoot.png": "f221aeeb61e5e77c6006bd250a0f07fc",
"assets/assets/rive/house.riv": "3ac77437a4c56b5143d6ceca83dd61d9",
"assets/assets/rive/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/assets/rive/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/rive/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/rive/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/rive/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/rive/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
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
