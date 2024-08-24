<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Review</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto p-6 bg-white rounded shadow-md">
    <h2 class="text-2xl font-bold mb-4">Add Review</h2>
    <form action="saveReview.jsp" method="post" class="space-y-4">
        <input type="hidden" name="hotelId" value="<%= request.getParameter("hotelId") %>" />
        <div>
            <label for="userName" class="block text-sm font-medium text-gray-700">Your Name</label>
            <input type="text" id="userName" name="userName" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
        </div>
        <div>
            <label for="rating" class="block text-sm font-medium text-gray-700">Rating</label>
            <input type="number" id="rating" name="rating" min="1" max="5" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required>
        </div>
        <div>
            <label for="comment" class="block text-sm font-medium text-gray-700">Comment</label>
            <textarea id="comment" name="comment" rows="4" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" required></textarea>
        </div>
        <div>
            <input type="submit" value="Submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">
        </div>
    </form>
    <a href="index.jsp" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">Back to Home</a>
</div>
</body>
</html>
