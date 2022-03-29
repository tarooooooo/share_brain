window.addEventListener('DOMContentLoaded', function(){
    $('.faq_list_question').on('click', function(){
        $('.faq_list_question').not(this).removeClass('open');
        $('.faq_list_question').not(this).next().slideUp();
        $(this).next().slideToggle();
        $(this).toggleClass('open');
    });
});
