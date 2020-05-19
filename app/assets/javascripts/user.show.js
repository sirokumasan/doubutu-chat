// $(function() {
 
//   $('.show__image').slick({
//     dots: true,
//     autoplay: true,
//     autoplaySpeed: 3000,
//     speed: 400,
//     cssEase: 'ease',
//     dots: false,
//     arrows: false,
//     infinite: true,
//     swipe: true,
//   });

//   var buildImage = function(url) {
//     var html= `<div class='pfofiel__item'> 
//                   <div class=' item-image__content'>
//                     <div class='item-image__content--icon'>
//                       <img src="${url}" width="150" height="150" >
//                     </div>
//                   </div>
//                   <div class='item-image__operetion'>
//                     <div class='pfofiel__item--delete' index=0>削除</div>
//                   </div>
//                 </div>`
//     $('.pfofiel').remove();
//     $('.pfofiel--text').remove();
//     $('.field-label__image').append(html);
//   }

//   function addpfofiel() {
//     var html = `<p class="pfofiel--text">プロフィール写真を載せてください</p>
//                 <f class="fas fa-camera pfofiel"></f>
//                 <input class="file-field" type="file" name="user[pfofiel]" id="pfofiel__image">`
//                   //  <input class="file-field" type="file" name="message[images_attributes][${t}][image]" id="message_images_attributes_${t}_image" >
//     $('.field-label__image').append(html);
//   }

//   $(document).on('change', '#pfofiel__image', function(e) {
//     // e.preventDefault();
//     console.log('ok');
//     var file = e.target.files[0];
//     var blob = window.URL.createObjectURL(file);
//     buildImage(blob);
//   })

//   $(document).on("click", '.pfofiel__item--delete', function(){
//     //プレビュー要素を取得
//     $('.field-label__image').empty();
//     addpfofiel()
//   });

// });