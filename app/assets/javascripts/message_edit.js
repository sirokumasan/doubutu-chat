$(function() {

  var index = [1,2,3,4,5,6];
  lastindex = $('.item-image__operetion--delete--edit:last').attr('index')
  index.splice(0, lastindex);

  var buildEdit = function(url, i) {
    var t = i + 1
    var html  = `<div class='item-image'> 
                  <div class='item-image__content'>
                    <div class='item-image__content--icon'>
                      <img src="${url}" width="110" height="100" >
                    </div>
                  </div>
                  <div class='item-image__operetion'>
                    <div class='item-image__operetion--delete--edit' index="${i}">削除</div>
                  </div> 
                </div>`
    $('#image-box__edit').append(html);
    $('.fas').prepend(`<input class="file-field" type="file" name="message[images_attributes][${t}][image]" id="message_images_attributes_${t}_image" >`)
  }




  $('#image-box__edit').on("change",function(e) {
    var i = $(this).attr('index')  
    var file = e.target.files[0];
    var blob = window.URL.createObjectURL(file);
    buildEdit(blob, index[0]);
    index.shift();
    if ($(`#item_images_attributes_${i}__destroy`)){
      $(`#item_images_attributes_${i}__destroy`).prop('checked',false);
    } 
  });
  
  $(document).on("click", '.item-image__operetion--delete--edit', function(){
      var i = $(this).attr('index')
      console.log(i)
      var target_image = $(this).parent().parent()
      //プレビューを削除
      target_image.remove();
      $(`#message_images_attributes_${i}_image`).remove();
      if ($(`#message_images_attributes_${i}__destroy`)){
        $(`#message_images_attributes_${i}__destroy`).prop('checked',true);
      } 
  });
});