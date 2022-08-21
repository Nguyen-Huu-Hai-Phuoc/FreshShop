<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <main class="container">
        <header class="row text-center">
            
        </header>
        <section class="row">
            <div class="col mt-4">
              <form:form action="/menu/accounts" modelAttribute="item">
                <div class="card">
                  <div class="card-header">
                    Add New Account
                  </div>
                  <div class="card-body">
                    <div class="row">
                        <div class="form-group">
                          <label for="productId">Username:</label>
                          <form:input path="username" type="text" class="form-control" />
                        
                        </div>
    
                        <div class="form-group">
                          <label for="name">Password:</label>
                          <form:input path="text" type="text" class="form-control" />
                         
                        </div>
    
                        <div class="input-group form-group">
                          <span class="input-group-text">Fullname:</span>
                          <form:input type="text" path="fullname" class="form-control" />
                        </div>
    
                        <div class="form-group">
                          <label for="categoryId">Email:</label>
                          <form:input path="email" type="text" class="form-control" />
                        </div>
                      
                        <div class="input-group form-group">
                          <span class="input-group-text">Rose:</span>
                          <form:input type="radio" path="admin" class="form-control" value="false"/> User
                          <form:input type="radio" path="admin" class="form-control" value="true"/> Admin
                        </div>
                    </div>
           
                  </div>
                  <div class="card-footer text-muted">
                    <button class="btn btn-info">New</button>
                    <button class="btn btn-success ml-3"><a class="text-decoration-none text-white" href="/account/create">Save</a></button>
                    <button class="btn btn-danger float-right"><a class="text-decoration-none text-white" href="/account/create">Update</a></button>
                </div>
              </div>
            </form:form>
            </div>
        </section>
        <footer class="row"></footer>
    </main>