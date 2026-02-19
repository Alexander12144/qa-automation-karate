package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/flows/user-flow.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testUserFlow() {
        return Karate.run("classpath:features/users/multi-users/create-mult-user.feature").relativeTo(getClass());
    }
}
