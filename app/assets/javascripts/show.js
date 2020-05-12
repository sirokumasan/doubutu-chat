$(function() {
 
  $('.show__image').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    speed: 400,
    cssEase: 'ease',
    dots: false,
    arrows: false,
    infinite: true,
    swipe: true,
  });

  function addHTML(comment){
    if(comment.text) {
      var html = `<div class="comment">
                    <strong>
                      <a class="show__comments__comment__name" href="#">${comment.user_name}:</a>
                    </strong>
                    <div class="show__comments__comment__text">
                      <p>${comment.text}</p>
                    </div>
                   </div>`
     $('.show__comments__comment').prepend(html);
    }
   
  }




  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    var formdata = new FormData(this);
    var url = $(this).attr('action');
    console.log('c')
    $.ajax ({
      url: url,
      data: formdata,
      type: "POST",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      console.log('ok')
      addHTML(data);
      $('.show__comment__text').val('');
      $('.show__comment__form').prop('disabled', false);
    })
    .fail(function() {
      console.log('error')
    })
  })
});