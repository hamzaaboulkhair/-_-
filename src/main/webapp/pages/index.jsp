<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.hotelreview.HotelDAO, com.hotelreview.Hotel" %>
<%@ page import="java.util.List" %>
<%
    HotelDAO hotelDAO = new HotelDAO();
    List<Hotel> hotels = hotelDAO.getAllHotels();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Review System</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .hotel-card {
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .hotel-card:hover {
            transform: scale(1.05);
        }
        .hotel-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .hotel-info {
            padding: 1rem;
        }
        .hotel-title {
            font-size: 1.25rem;
            font-weight: 700;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="container mx-auto p-6 bg-white rounded shadow-md">
    <h2 class="text-3xl font-bold mb-6 text-center">Hotel Review System</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <% for (Hotel hotel : hotels) { %>
        <div class="hotel-card">
            <img src="<%= hotel.getImagePath() %>" alt="Hotel 1" class="hotel-image">

            <div class="hotel-info">
                <h3 class="hotel-title"><%= hotel.getName() %></h3>
                <p><strong>Location:</strong> <%= hotel.getLocation() %></p>
                <a href="viewHotel.jsp?hotelId=<%= hotel.getId() %>" class="text-blue-500 mt-2 inline-block">View Reviews</a>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
