
self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open('offline').then(function(cache) {
            return cache.addAll([
                '/offline.html'
                // etc
            ]);
        })
    );
});



self.addEventListener('fetch', function(event) {
    event.respondWith(
        caches.open('offline').then(function(cache) {
            return cache.match(event.request).then(function (response) {
                return response || caches.match("/offline.html");
            });
        }));
});


self.addEventListener('activate', function(event) {
    event.waitUntil(
        caches.keys().then(function(cacheNames) {
            return Promise.all(
                cacheNames.filter(function(cacheName) {
                    // Return true if you want to remove this cache,
                    // but remember that caches are shared across
                    // the whole origin
                }).map(function(cacheName) {
                    return caches.delete(cacheName);
                })
            );
        })
    );
});
