<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <link rel="stylesheet" href=""/>
</head>
<body>
      
    <main class="container">
        <header class="row text-center">
            
        </header>
        <section class="row">
            <div class="col-6 offset-3 mt-4">
                
                    <div class="card">
                        <div class="card-header">
                            <h2>Add New Category</h2>
                        </div>
                        <form:form action="/admin/categories" enctype="multipart/form-data" modelAttribute="item">
                        <div class="card-body">
                            <div class="form-group">
                              <label for="categoruId">Category Id</label>
                              <form:input type="text" path="id" id="id"
                                class="form-control" placeholder="Category Id"/>
                              
                            </div>
                            <div class="form-group">
                              <label for="name">Name</label>
                              <form:input type="text" path="name" id="name"
                                class="form-control" placeholder="Catogoery name"/>
                              
                            </div>
							<div class="form-group">
								<label id="displayImg" class="rounded" style="border:1px solid grey; width: 150px; height: 100px">
									<img src="/images/category/${loadanh }" id="image" width="148px" height="99px" />
								</label>
								<input type="file" id="upload" name="saveimg" onchange="up()" class="form-control-file"/>
								<form:input type="hidden" path="image" id="nameImg" />
							</div>
							<div class="form-group">
								<button formaction="/category/create" class="btn btn-info"><i class="fas fa-save"></i>&nbsp;Save</button>
								${thongbao}
							</div>
						</div>
						</form:form>
                        <div class="card-footer text-muted text-center">
                        	<button class="btn btn-success"><a class="text-decoration-none text-white" href="/admin/categories">List Categories</a></button>
                    		<button onclick="reset()" class="btn btn-warning">Reset</button>
                            
                        </div>
                    </div>   
            </div>
        </section>
    </main>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>

<script>
	/* function edit(obj) {
		let tr = obj.parentNode.parentNode;
		let img = tr.childNodes[5].childNodes[0];
		let imgSplit = img.src.split("/");
		let nameImg = imgSplit[imgSplit.length - 1];

		let idFillImg = document.getElementById("image");
		idFillImg.src = "/images/category/" + nameImg;
		console.log(nameImg);
	} */

	function up() {
		let file = document.getElementById('upload').files;
		if (file.length > 0) {

			let fileLoad = file[0];
			let fileRender = new FileReader();
			fileRender.onload = function(fileLoaderEvent) {
				let srcData = fileLoaderEvent.target.result;

				let newImage = document.getElementById('image');
				newImage.src = srcData;
				document.getElementById('displayImg').innerHTML = newImage.outerHTML;//lấy ra 1 ảnh

			}
			fileRender.readAsDataURL(fileLoad);

		}

		let imgFile = document.getElementById("upload");
		let imgFileSplit = imgFile.value.split("\\");
		let nameImg = imgFileSplit[imgFileSplit.length - 1];
		console.log(nameImg);
		document.getElementById("nameImg").value = nameImg;
	}
	
	function reset(){
		document.getElementById('id').value = "";
		document.getElementById('name').value = "";
		document.getElementById('image').src = "";
	}
	
</script>