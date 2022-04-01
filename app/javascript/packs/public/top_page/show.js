window.addEventListener('DOMContentLoaded', function(){
    $('.faq_list_question').on('click', function(){
        $('.faq_list_question').not(this).removeClass('open');
        $('.faq_list_question').not(this).next().slideUp();
        $(this).next().slideToggle();
        $(this).toggleClass('open');
    });

    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        return false;
    });

    setTimeout(function(){
        $('.start p').fadeIn(1600);
    },500);
    setTimeout(function(){
        $('.start').fadeOut(500);
    },3500);

    $(window).on('load', function(){
        $('#loading').delay(1500).fadeOut('slow');
        $('#loading_box').delay(1200).fadeOut('slow');
    });
});
