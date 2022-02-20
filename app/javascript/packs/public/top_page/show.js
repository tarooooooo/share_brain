$(function(){
    $('.faq_list_question').on('click', function(){
        $(this).next().slideToggle();
    });
});

$(function(){
    $('.action-item').click(function () {
        $('.dropdown-article-menu').slideToggle(300);
    });
});
