package com.hotelreview;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    private Connection connection;

    public ReviewDAO() {
        connection = Database.getConnection();
    }

    public int saveReview(Review review) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO Review (hotel_id, user_name, rating, comment, review_date) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setInt(1, review.getHotelId());
            ps.setString(2, review.getUserName());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getComment());
            ps.setDate(5, review.getReviewDate());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Review> getReviewsByHotelId(int hotelId) {
        List<Review> reviews = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Review WHERE hotel_id = ?");
            ps.setInt(1, hotelId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setHotelId(rs.getInt("hotel_id"));
                review.setUserName(rs.getString("user_name"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setReviewDate(rs.getDate("review_date"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> getSortedReviews(int hotelId, String sortBy) {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT * FROM Review WHERE hotel_id = ? ORDER BY ";
        switch (sortBy) {
            case "date":
                query += "review_date DESC";
                break;
            case "rating":
                query += "rating DESC";
                break;
            default:
                query += "review_date DESC";
                break;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, hotelId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setHotelId(rs.getInt("hotel_id"));
                review.setUserName(rs.getString("user_name"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setReviewDate(rs.getDate("review_date"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
