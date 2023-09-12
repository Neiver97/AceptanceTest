package co.com.certificacion.apirest;

import com.intuit.karate.junit5.Karate;

public class TheStarWarsAPIRunner {

    @Karate.Test
    Karate runner(){
        return Karate.run("classpath:apirest/thestarwars.feature")
                .relativeTo(getClass());
    }

}
