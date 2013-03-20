$(function(){
    $('.alert').bind('close', function () {
        // console.log("closed");        
        $.ajax({
            url: '/users/dialog'//,
//            success: function (response) {//response is value returned from php (for your example it's "bye bye"
//              alert(response);
//            }
         });
    });
    
//   $('.close').click(function(){
//      var essay_id = $(this).attr('id');
//
//       $.ajax({
//          type : 'post',
//           url : '/Users/dialog.php', // in here you should put your query 
//          data :  'post_id='+eassay_id, // here you pass your id via ajax .
//                     // in php you should use $_POST['post_id'] to get this value 
//       success : function(r)
//           {
//              // now you can show output in your modal 
//              $('#mymodal').show();  // put your modal id 
//             $('.something').show().html(r);
//           }
//    });
//
//
//    });
});