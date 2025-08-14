import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class AssertionsTest {

    @Test
    public void testAssertions() {
        // Assert Equals
        assertEquals(5, 2 + 3);

        // Assert True
        assertTrue(5 > 3);

        // Assert False
        assertFalse(3 > 5);

        // Assert Null
        String str = null;
        assertNull(str);

        // Assert Not Null
        String name = "Sravani";
        assertNotNull(name);
    }
}
