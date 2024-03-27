package TestSuite;
import com.intuit.karate.junit5.Karate;
class Runner {
    @Karate.Test
    public Karate runMeal(){
        return Karate.run("MealPlan/mealplan").relativeTo((getClass()));
    }
}
