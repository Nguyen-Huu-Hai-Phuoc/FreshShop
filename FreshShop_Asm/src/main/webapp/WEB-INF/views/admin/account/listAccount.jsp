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
                      <th>Username</th>
                      <th>Passwork</th>
                      <th>Fullname</th>
                      <th>Email</th>
                      <th>Admin</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${items}">
                      <tr>
                        
                        <td>${item.username }</td>
                        <td>${item.password }</td>
                        <td>${item.fullname }</td>
                        <td>${item.email }</td>
                        <td>${item.admin }</td>
                        <td>
                          <a href="/product/edit/${item.username}" class="btn btn-outline-info"><i class="fas fa-edit"></i></a>
                          <a href="/product/delete/${item.username}" class="btn btn-outline-danger"><i class="fas fa-recycle"></i></a>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                </table>
              </div>
              <div class="card-footer text-muted">
  
              </div>
            </div>
              
          </div>
      </section>
      <footer class="row"></footer>
  </main>