<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <main class="container">
      <section class="row">
          <div class="col mt-4">
            <div class="card">
              <div class="card-header">
                List of Product
              </div>
              <div class="card-body" style="overflow-y: scroll; max-height: 460px;">
                <table class="table table-striped table-inverse">
                  <thead class="thead-inverse">
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Price</th>
                      <th>Create Date</th>
                      <th>Categories ID</th>
                      <th>Image</th>
                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${items}">
                      <tr>
                        
                        <td>${item.id }</td>
                        <td>${item.name }</td>
                        <td>${item.price }</td>
                        <td>${item.createDate }</td>
                        <td>${item.category.id}</td>
                        <td><img src="/images/${item.image }" alt="" width="150px" height="80px"></td>
                        
                        <td>
                          <a href="/product/edit/${item.id}" class="btn btn-outline-info"><i class="fas fa-edit"></i></a>
                          <a href="/product/delete/${item.id}" class="btn btn-outline-danger"><i class="fas fa-recycle"></i></a>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                </table>
              </div>
              <div class="card-footer text-muted">
                <!-- <form action="" method="get">
                  <div class="form-inline float-left">
                    <label for="">Page Size: &nbsp;</label>
                    <select class="form-control" name="" id="">
                      <option>5</option>
                      <option>10</option>
                      <option>15</option>
                    </select>
                  </div>
                </form>
                <nav aria-label="Page navigation">
                  <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                      </a>
                    </li>
                  </ul>
                </nav> -->
              </div>
            </div>
              
          </div>
      </section>
      <footer class="row"></footer>
  </main>