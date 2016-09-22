
$(document).ready(function(){
$('ul.first').bsPhotoGallery({
  "classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
  "hasModal" : false,
  // "fullHeight" : false
});
   $('li img').on('click',function(){
        var src = $(this).attr('src');
        var img = '<img src="' + src + '" class="img-responsive"/>';
        $('#myModal').modal();
        $('#myModal').on('shown.bs.modal', function(){
            $('#myModal .modal-body').html(img);
        });
        $('#myModal').on('hidden.bs.modal', function(){
            $('#myModal .modal-body').html('');
        });
   });
});

$(function() {
  $('#picture').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      img.class = "round-image-51"
      $('#target').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
});