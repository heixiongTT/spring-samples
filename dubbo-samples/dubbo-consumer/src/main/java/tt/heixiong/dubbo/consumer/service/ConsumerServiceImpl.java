package tt.heixiong.dubbo.consumer.service;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Service;
import tt.heixiongtt.dubbo.dto.service.HelloService;

@Service
public class ConsumerServiceImpl implements ConsumerService {

    @Reference(interfaceClass = HelloService.class, url = "dubbo://localhost:20884")
    private HelloService helloService;

    @Override
    public String sayHello(String name) {
        return helloService.sayHello(name);
    }
}
