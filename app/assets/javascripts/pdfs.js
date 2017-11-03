$(document).ready(function(){
  $('#new_pdf').fileupload({
    dataType: "script",
    add: function(e, data){
      data.context = $(tmpl("template-upload", data.files[0]));
              $('#new_pdf').append(data.context);
              return data.submit();
    },
    progress: function(e, data){
      var progress;
      if (data.context) {
        progress = parseInt(data.loaded / data.total * 100, 10);
        return data.context.find('.bar').css('width', progress + '%');
      }
    }
  });
});
