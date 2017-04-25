
self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open('offline').then(function(cache) {
            return cache.addAll([
                '/offline.html',
                '/',
                '/ee',
                '/ru',
                '/en'
                // etc
            ]);
        })
    );
});



self.addEventListener('fetch', function(event) {

console.log(event.request.url);

event.respondWith(

caches.match(event.request).then(function(response) {

return response || fetch(event.request);

})

);

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
