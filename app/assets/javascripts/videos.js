$(document).ready(function(){
  $('#new_video').fileupload({
    dataType: "script",
    add: function(e, data) {
      console.log("================================================")
      console.log(e)
      console.log(data)
      data.context = $(tmpl("template-upload", data.files[0]));
      $('#new_video').append(data.context);
      return data.submit();
      },
      progress: function(e, data) {
        var progress;
        console.log("------------------------------------------------------------")
        console.log(e)
        console.log(data)
        if (data.context) {
          console.log(data.loaded)
          console.log(data.total)
          progress = parseInt(data.loaded / data.total * 100, 10);
          return data.context.find('.bar').css('width', progress + '%');
        }
      }
  });
});
