<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<title>영상 업로드</title>
<style>
.col-centered {
	float: none;
	margin: 0 auto;
}
iframe{
	max-width:100%
}
.main_frame{
	margin-top:100px;
}
</style>
</head>
<body>
	<div class="col-md-6 col-md-offset-3 main_frame">
		<form method="post" class="form-horizontal	">

			<div class="form-group">
				<label for="user_id" class="col-sm-2 control-label">유저아이디 (임의, 숫자)</label>
				<div class="col-sm-10">
					<input type="text" id="user_id" class="form-control" name="user_id"/>
				</div>
			</div>

			<div class="form-group">
				<label for="video_title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" id="video_title" class="form-control" name="video_title"/>
				</div>
			</div>
			<div class="form-group">
				<label for="video_tag" class="col-sm-2 control-label">태그</label>
				<div class="col-sm-10">
					<input type="text" id="video_tag" class="form-control" name="video_tag"/>
				</div>
			</div>
			<div class="form-group">
				<label for="video_content" class="col-sm-2 control-label">설명</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="video_content" rows="3" name="video_content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="video_url" class="col-sm-2 control-label">영상주소</label>
				<div class="col-sm-10">
					<input type="text" id="video_url" class="form-control" name="video_url"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">업로드</button>
				</div>
			</div>

			<div class="form-group">
				<label for="video_url" class="col-sm-2 control-label">미리보기</label>
				<div class="col-sm-10" id="div_preview"></div>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
	$('#video_url').on('change', function() {
		var src = $(this).val();
		if (src.startsWith("<iframe") || src.startsWith("<embed"))
			$('#div_preview').html(src);
		else
			$('#div_preview').html('<div class="alert alert-danger" role="alert">잘못된 주소입니다</div>');
	})
</script>
</html>