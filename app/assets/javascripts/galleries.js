
$(document).ready(function(){
$('ul.first').bsPhotoGallery({
  "classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
  "hasModal" : true,
  // "fullHeight" : false
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