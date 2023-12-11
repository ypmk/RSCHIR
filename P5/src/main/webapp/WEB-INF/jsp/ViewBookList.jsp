<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>View Book List</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> Book list</h1>

        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Id</th>
            		<th>Author</th>
            		<th>SellerId</th>
            		<th>ProductType</th>
            		<th>Price</th>
					<th>Name</th>
					<th>Edit</th>
					<th>Delete</th>
            	</tr>

            	<c:forEach var="book" items="${bookList}">
                    <tr>
                		<td>${book.id}</td>
                		<td>${book.author}</td>
                		<td>${book.sellerId}</td>
						<td>${book.productType}</td>
						<td>${book.price}</td>
						<td>${book.name}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/editBook/${book.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteBook/${book.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addBook">Add New Book</a>
        </button>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Book added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Book deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete user")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Book updated successfully!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>