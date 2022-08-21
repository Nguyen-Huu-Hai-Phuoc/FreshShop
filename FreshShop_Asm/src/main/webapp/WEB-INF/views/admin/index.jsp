<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/"/>
	<title>Admin</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/admin-index.css"/>
</head>
<body>
	<body>
    <main>
      <header class="row text-center">
          <div class="col">
            <nav class="navbar navbar-expand-sm navbar-light bg-success">
              <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
                  aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                  <li class="nav-item active">
                    <a class="nav-link" href="#"><img src="/images/logo.png" alt=""></a>
                  </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                  <input class="form-control mr-sm-2" type="text" placeholder="ID?">
                  <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
                </form>
              </div>
            </nav>
          </div>
      </header>
      <section class="row">
      	<div class="row">
          <div class="bg-dark manegers">
            <div class="card mt-3 ml-4 mr-2" style="width: 18rem;">
              <ul class="list-group list-group-flush menu-manage">
                <li class="list-group-item"><a class="nav-link text-decoration-none" href="/menu/accounts">Manage Account</a></li>
                <li class="list-group-item"><a class="nav-link text-decoration-none" href="/menu/catrgory">Manage Category</a></li>
                <li class="list-group-item"><a class="nav-link text-decoration-none" href="/menu/product">Manage Product</a></li>
                <li class="list-group-item"><a class="nav-link text-decoration-none" href="#">Manage Oder</a></li>
                <li class="list-group-item"><a class="nav-link text-decoration-none" href="#">Manage Oder-Detail</a></li>
              </ul>
            </div>
          </div>
          </div>
          <div class="row" style="margin: 0 auto; width: 1000px;">
            	<jsp:include page="${message}"/>
          </div>
      </section>
  </main>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</body>
</html>