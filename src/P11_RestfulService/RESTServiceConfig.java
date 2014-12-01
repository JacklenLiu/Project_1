package P11_RestfulService;

import javax.ws.rs.*;

import org.glassfish.jersey.server.*;

@ApplicationPath("/services")
public class RESTServiceConfig extends ResourceConfig
{
    public RESTServiceConfig(){
        packages("P11_RestfulService");
    }
}
