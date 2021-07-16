<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텍스트 에디터</title>
   
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
   <script>
      $(function() {
         $('#summernote').summernote({
            height : 600,
            minHeight : 500,
            maxHeight : 700,
            lang: "ko-KR",
            placeholder: '상품의 상세내용을 입력해주세요.',
               callbacks : {
                  onImageUpload : function(files, editor, welEditable) {
                     // 파일 업로드(다중업로드를 위해 반복문 사용)
                     for (var i = files.length - 1; i >= 0; i--) {
                        uploadSummernoteImageFile(files[i], this);
                     }
                  }
               }
         });
      });

        function uploadSummernoteImageFile(file, el) {
         data = new FormData();
         data.append("file", file);
         $.ajax({
            data : data,
            type : "POST",
            url : "/uploadSummernoteImageFile.do",
            contentType : false,
            processData : false,
            success : function(data) {
               $(el).summernote('editor.insertImage', data.url);
            }
         });
      }
       
   </script>

</head>
<body>
   
   <textarea id="summernote" name="content">${couponDetail.content }</textarea>
   
</body>
</html>