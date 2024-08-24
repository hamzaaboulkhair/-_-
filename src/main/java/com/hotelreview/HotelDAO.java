package com.hotelreview;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HotelDAO {
    private Connection connection;

    public HotelDAO() {
        connection = Database.getConnection(); // Ensure your Database class is correctly set up to provide a valid connection.
    }

    public List<Hotel> getAllHotels() {
        List<Hotel> hotels = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM Hotel");
            while (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setId(rs.getInt("id"));
                hotel.setName(rs.getString("name"));
                hotel.setLocation(rs.getString("location"));
                hotel.setImagePath(rs.getString("imagePath")); // Retrieve and set the image path
                hotels.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }
}
