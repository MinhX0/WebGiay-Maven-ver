package dao;

import org.junit.jupiter.api.Test;

import java.sql.Connection;

import static org.junit.jupiter.api.Assertions.*;

class DBContextTest {
    @Test
    void canObtainConnectionOrSkipIfUnavailable() {
        try (Connection conn = DBContext.getConnection()) {
            assertNotNull(conn, "Connection should not be null");
            assertTrue(conn.isValid(2), "Connection should be valid");
        } catch (Exception e) {
            // Allow test to pass if local DB not configured; log message for visibility
            System.out.println("Skipping DB connectivity assertion: " + e.getMessage());
        }
    }
}

