$(function() {

  var buildImage = function(url, i) {
    var index = [1,2,3,4,5,6,7,8,9,10];
    var t = i + 1
    // console.log(i);
    var html= `<div class='item-image'> 
                <div class=' item-image__content'>
                  <div class='item-image__content--icon'>
                    <img src="${url}" width="110" height="100" >
                  </div>
                </div>
                <div class='item-image__operetion'>
                  <div class='item-image__operetion--delete' index="${i}">削除</div>
                </div>
              </div>`
    $('#image-box').append(html);
    $('.fas').prepend(`<input class="file-field" type="file" name="message[images_attributes][${t}][image]" id="message_images_attributes_${t}_image" >`)
    // $(`#message_images_attributes_${t}_image`).css('display', 'none')
    // $('.new-wrapper__main__image').append('<input class="file-field" type="file" name="product[images_attributes][${index[1]}][image]" id="product_images_attributes_${index[${i}]}_image">')
    // $('.flexbox').attr("for",`product_images_attributes_${index[1]}_image`);
    // index.shift();
  }




  $('#image-box').on("change",function(e) {
    var m = $('.file-field')
    console.log(m);
    var file = e.target.files[0];
    // var blob = Window.URL.createObjectURL(file);
    var blob = window.URL.createObjectURL(file);
    var i = 0
    $('.item-image').each(function() {
      i += 1
    })

    buildImage(blob, i);
  });
  $(document).on("click", '.item-image__operetion--delete', function(){
        //プレビュー要素を取得
        var i = $(this).attr('index')
        // console.log(i);
        var target_image = $(this).parent().parent()
        //プレビューを削除
        target_image.remove();
        $(`#message_images_attributes_${i}_image`).val('')
        var m = $('.file-field')
        console.log(m);
        //inputタグに入ったファイルを削除
        // $('.file_field').val("");
  });
});