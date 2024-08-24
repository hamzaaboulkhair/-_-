<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> <!-- Import the List class -->
<%@ page import="com.hotelreview.HotelDAO, com.hotelreview.ReviewDAO, com.hotelreview.Hotel, com.hotelreview.Review" %>
<%
    int hotelId = Integer.parseInt(request.getParameter("hotelId"));
    HotelDAO hotelDAO = new HotelDAO();
    ReviewDAO reviewDAO = new ReviewDAO();
    Hotel hotel = null;
    List<Review> reviews = null;

    String sortBy = request.getParameter("sortBy");
    if (sortBy == null) {
        sortBy = "date";
    }

    for (Hotel h : hotelDAO.getAllHotels()) {
        if (h.getId() == hotelId) {
            hotel = h;
            break;
        }
    }

    reviews = reviewDAO.getSortedReviews(hotelId, sortBy);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Details</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto p-6 bg-white rounded shadow-md">
    <h2 class="text-2xl font-bold mb-4"><%= hotel.getName() %></h2>
    <p class="mb-4"><strong>Location:</strong> <%= hotel.getLocation() %></p>

    <div class="mb-4">
        <label for="sort" class="block text-sm font-medium text-gray-700">Sort Reviews By</label>
        <select id="sort" name="sortBy" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" onchange="location = 'viewHotel.jsp?hotelId=<%= hotelId %>&sortBy=' + this.value;">
            <option value="date" <%= "date".equals(sortBy) ? "selected" : "" %>>Date</option>
            <option value="rating" <%= "rating".equals(sortBy) ? "selected" : "" %>>Rating</option>
        </select>
    </div>

    <ul class="list-disc pl-5">
        <% for (Review review : reviews) { %>
        <li class="mb-2">
            <p><strong><%= review.getUserName() %></strong> - <%= review.getRating() %>/5</p>
            <p><%= review.getComment() %></p>
            <p class="text-sm text-gray-500"><%= review.getReviewDate() %></p>
        </li>
        <% } %>
    </ul>
    <a href="addReview.jsp?hotelId=<%= hotelId %>" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">Add Review</a>
    <a href="index.jsp" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">main menu</a>

</div>
</body>
</html>
