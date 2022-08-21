<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <main class="container">
        <header class="row text-center">
            
        </header>
        <section class="row">
            <div class="col mt-4">
              <form:form action="/admin/product" modelAttribute="item">
                <div class="card">
                  <div class="card-header">
                    Add New Product
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-7">
                        <div class="form-group">
                          <label for="productId">Product ID:</label>
                          <form:input path="id" type="text" class="form-control" placeholder="Product ID"/>
                        
                        </div>
    
                        <div class="form-group">
                          <label for="name">Name:</label>
                          <form:input path="name" type="text" class="form-control" placeholder="Name"/>
                         
                        </div>
    
                        <div class="input-group form-group">
                          <span class="input-group-text">Unit Price:</span>
                          <form:input type="number" path="price" class="form-control" placeholder="Unit Price"/>
                          <span class="input-group-text">$</span>
                        </div>
    
                        <div class="form-group">
                          <label for="categoryId">Categoy</label>
                          <form:select  class="form-control" path="category.id">
                            <option>C1</option>
                            <option>C2</option>
                            <option>C3</option>
                          </form:select>
                        </div>
                      </div>

                      <div class="col-3">
                        <img src="/images/categories_img_01.jpg" width="90%"
                        class="img-fluid" alt="">
                        <div class="form-group">
                          <label for="productImage">Image File</label>
                          <input type="file" class="form-control-file" placeholder="Product Image" aria-describedby="productimageHid">
                        </div>
                            
                        <div class="input-group form-group">
                          <span class="input-group-text">Discount</span>
                          <input type="number" class="form-control" placeholder="Discount">
                          <span class="input-group-text">%</span>
                        </div>
                            
                        <div class="form-group">
                          <label for="status">Status</label>
                          <select class="form-control" >
                            <option>Out of slock</option>
                            <option>On Sale</option>
                            <option>Featured</option>
                            <option>Bestseller</option>
                            <option>Out of order</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="description">Description</label>
                          <textarea class="form-control" rows="5"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-muted">
                    <button class="btn btn-info">New</button>
                    <button class="btn btn-success ml-3"><a class="text-decoration-none text-white" href="/product/create">Save</a></button>
                    <button class="btn btn-danger float-right"><a class="text-decoration-none text-white" href="/product/create">Update</a></button>
                </div>
              </div>
            </form:form>
            </div>
        </section>
        <footer class="row"></footer>
    </main>