$(function() {

  // function addhtml() {
  //   var  html = `<ul class="nav-item.active">
  //                 <a href="#" class="nav-link">Home</a>
  //                 <li class="nav-item.active">
  //                   <a href="#" class="nav-link">Home</a>
  //                 </li>
  //               </ul>`;
  // $('.nav-item.active').append(html);
  // }
  

  // $('.dropdown-btn').hover(
  //   function() {
  //     $(this).children('.dropdown').show('open');
  //     console.log(this);
  //   },function() {
  //     $(this).children('.dropdown').hide('open');   
  //   }
  // );

  $('.dropdown-btn').hover(
    function() {
      $("ul:not(:animated)", this).slideDown("fast");
      console.log(this);
    },function() {
      $('.dropdown', this).slideUp("fast");  
    }
  );


  

  // $('.dropdown-btn').hover(function() {
  //   $(this).children('.dropdown').show();
  //   console.log(this);
  // }); function() {
  //   $(this).children('ul').hide();
  // });
});
