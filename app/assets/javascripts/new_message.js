// $(function() {

//   var dataBox = new DataTransfer();
//   var file_field = document.querySelector('input[type=file]')
  
//   function addHTML(file, src) {
//     var html= `<div class='item-image' data-image="${file.name}">
//                 <div class=' item-image__content'>
//                   <div class='item-image__content--icon'>
//                     <img src=${src} width="110" height="100" >
//                   </div>
//                 </div>
//                 <div class='item-image__operetion'>
//                   <div class='item-image__operetion--delete'>削除</div>
//                 </div>
//               </div>`
//     $('#image-box').append(html);
//     console.log('ok');
//     // return html
//   }
 


//   $('#message_images_attributes_0_image').change(function() {
//     // 最初のファイル
//     var files = $('input[type=file]').prop('files')[0];
//     console.log(files);
//     $.each(this.files, function(i, file) {
//       // console.log(file);
//       // console.log(i);
//       var fileReader = new FileReader();
//       dataBox.items.add(file)
//       console.log(dataBox);
//       file_field.files = dataBox.files
//       console.log(file_field.files);
//       // var num = $('.item-image').length + 1 + i
//       // console.log(num);
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//         addHTML(file, src)
//       }
//       fileReader.readAsDataURL(file);
//     }) 
//   });
//   $(document).on("click", '.item-image__operetion--delete', function(){
//     //プレビュー要素を取得
//     var target_image = $(this).parent().parent()
//     //プレビューを削除
//     target_image.remove();
//     //inputタグに入ったファイルを削除
//     file_field.val("");
//   })
// });