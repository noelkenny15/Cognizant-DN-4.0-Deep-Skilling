import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.*;

public class CalculatorTestAAA {

    Calculator calc;

    @BeforeEach
    public void setUp() {
        calc = new Calculator();
        System.out.println("Setup done");
    }

    @AfterEach
    public void tearDown() {
        calc = null;
        System.out.println("Teardown done");
    }

    @Test
    public void testAddition() {
        int result = calc.add(10, 20);
        assertEquals(30, result);
    }

    @Test
    public void testSubtraction() {
        int result = calc.subtract(50, 20);
        assertEquals(30, result);
    }

    @Test
 public void testMultiplication() {
        int result = calc.multiply(5, 6);
        assertEquals(30, result);
    }

    @Test
    public void testDivision() {
        int result = calc.divide(60, 2);
        assertEquals(30, result);
    }
}