        $(window).on('turbolinks:load', function () {
            var $preloader = $('#page-preloader'),
            $spinner   = $preloader.find('.spinner');
            $spinner.delay(1000).fadeOut();
            $preloader.delay(1000).fadeOut('slow');
        });
