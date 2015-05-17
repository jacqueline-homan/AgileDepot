//$(document).on("ready page:change", function() {
//  return $('.store .entry > img').click(function() {
//    return $(this).parent().find(':submit').click();
//  });
//});

//var productImage = $('.store .entry > img');

//productImage.on('click', function() {
    
//    $(this).closest('.entry').find(':submit').click();

//});

// Clicking on a product image to enlarge it
$(function ()
{
    $('img').on('click', function ()
    {
        $(this).width(300);
    });
});