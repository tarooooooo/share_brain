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
});
