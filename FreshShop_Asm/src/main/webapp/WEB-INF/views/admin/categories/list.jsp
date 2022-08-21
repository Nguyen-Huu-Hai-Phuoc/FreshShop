<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

      
    <main class="container">
        <header class="row text-center">
            
        </header>
        <section class="row">
            <div class="col mt-4">
              <div class="card">
                <div class="card-header">
                  List of Categories
                </div>
                <div class="card-body " style="overflow-y: scroll; max-height: 460px;">
                  <table class="table table-striped table-inverse">
                    <thead class="thead-inverse">
                      <tr>
                        <th>Category ID</th>
                        <th>Name</th>
                        <th>Image</th>
                      </tr>
                      </thead>
                      <tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td>${item.image}</td>
										<td>
					                        <a a href="/category/edit/${item.id}" class="btn btn-outline-info"><i class="fas fa-edit"></i></a>
					                        <a href="/category/delete/${item.id}" class="btn btn-outline-danger"><i class="fas fa-recycle"></i></a>
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
    
   