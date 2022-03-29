window.addEventListener('DOMContentLoaded', function(){
    $('.faq_list_question').on('click', function(){
        $(this).next().slideToggle();
    });
});
