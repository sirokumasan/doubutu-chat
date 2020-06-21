$(function() {

  let index = [1,2,3,4,5,6];
  var buildImage = function(url, i) {
    var t = i - 1
    var html  = `<div class='item-image'> 
                  <div class='item-image__content'>
                    <div class='item-image__content--icon'>
                      <img src="${url}" width="110" height="100" >
                    </div>
                  </div>
                  <div class='item-image__operetion'>
                    <div class='item-image__operetion--delete' index="${t}">削除</div>
                  </div>
                </div>`
    $('#image-box').append(html);
    $('.fas').prepend(`<input class="file-field" type="file" name="message[images_attributes][${i}][image]" id="message_images_attributes_${i}_image" >`)
  }

  // 画像投稿
  $('#image-box').on("change",function(e) {
    var file = e.target.files[0];
    var blob = window.URL.createObjectURL(file);
    buildImage(blob, index[0]);
    index.shift();
    index.push(index[index.length - 1] + 1)
  });
  
  // 削除機能
  $(document).on("click", '.item-image__operetion--delete', function(){
        //プレビュー要素を取得
        var i = $(this).attr('index')
        var target_image = $(this).parent().parent()
        //プレビューを削除
        target_image.remove();
        // $(`#message_images_attributes_${i}_image`).val("")
        $(`#message_images_attributes_${i}_image`).remove()
  });

  $('#message_tag_ids').change(function() {
    choise = $('option:selected').text()
    if(choise === "その他" ) {
      $('.other__choise').css("display", "inline")
    }else {
      $('.other__choise').css("display", "none")
    }
  })

   // 新着順をクリックした場合
  // $('.list_tag__new').on('click', function(e) {
  //   e.preventDefault();
  //   $('.message__old').css("display", "none");
  //   $('.message__rank').css("display", "none");
  //   $('.message__normal').css("display", "flex");
  // })

  // 古い順をクリック
  // $('.list_tag__old').on('click', function(e) {
  //   e.preventDefault();
  //   $('.message__normal').css("display", "none");
  //   $('.message__rank').css("display", "none");
  //   $('.message__old').css("display", "flex");
  //    // $('.pagination').css("display", "none");
  // })

   // いいねをクリックした場合
  //  $('.list_tag__rank').on('click', function(e) {
  //   e.preventDefault();
  //   $('.message__normal').css("display", "none");
  //   $('.message__old').css("display", "none");
  //   $('.message__rank').css("display", "flex");
  // })

  // $('.group__data').on('click', function(e) {
  //   e.preventDefault();
  //   var a = $(this).data('name');
  //   console.log(a)
  //   $('.message').css("display", "none");
  //   $('.message__type').css("display", "inline");
  //   // if(a === )
  // })
});