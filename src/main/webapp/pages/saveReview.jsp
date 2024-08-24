<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.hotelreview.Review, com.hotelreview.ReviewDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save Review</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto p-6 bg-white rounded shadow-md">
    <%
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        String userName = request.getParameter("userName");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        Review review = new Review();
        review.setHotelId(hotelId);
        review.setUserName(userName);
        review.setRating(rating);
        review.setComment(comment);
        review.setReviewDate(new java.sql.Date(System.currentTimeMillis()));

        ReviewDAO reviewDAO = new ReviewDAO();
        int result = reviewDAO.saveReview(review);

        if (result > 0) {
            out.print("<h3 class='text-green-500'>Review Saved Successfully</h3>");
        } else {
            out.print("<h3 class='text-red-500'>Review Not Saved</h3>");
        }
    %>
    <a href="viewHotel.jsp?hotelId=<%= hotelId %>" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">Back to Hotel</a>
</div>
</body>
</html>
