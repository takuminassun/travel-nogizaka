$(function(){
  $("#img-file").change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image")<0){
      alert("画像ファイルを指定してください");
      return falese;
    }
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name)
      };
    })(file);
    reader.readAsDataURL(file);
  });
});