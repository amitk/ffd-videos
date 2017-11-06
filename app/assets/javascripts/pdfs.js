// $(document).ready(function(){
//   $('#new_pdf').fileupload({
//     dataType: "script",
//     add: function(e, data) {
//       console.log("================================================")
//       console.log(e)
//       console.log(data)
//       data.context = $(tmpl("template-upload", data.files[0]));
//       $('#new_pdf').append(data.context);
//       return data.submit();
//     },
//     progress: function(e, data) {
//       var progress;
//       console.log("------------------------------------------------------------")
//       console.log(e)
//       console.log(data)
//       if (data.context) {
//         console.log(data.loaded)
//         console.log(data.total)
//         progress = parseInt(data.loaded / data.total * 100, 10);
//         return data.context.find('.bar').css('width', progress + '%');
//       }
//     },
//     done: function(e, data){
//       console.log("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//       console.log(e)
//       console.log(data)
//       console.log("uploaded!")
//     }
//   });
// });
$(document).ready(function(){
  'use strict';
  $('#new_pdf').fileupload({
    add: function (e, data) {
        data.context = $('<button/>').text('Upload')
            .appendTo(document.body)
            .click(function () {
                data.context = $('<p/>').text('Uploading...').replaceAll($(this));
                data.submit();
            });
    },
    progress: function(e, data){
      console.log('In progress');
      console.log('resuming');
    },
    done: function (e, data) {
      console.log(data)
      console.log('uploading done!');
      data.context.text('Upload finished.');
    },
    fail: function (e, data) {
      alert('failed to upload!')
    }
  });
});
