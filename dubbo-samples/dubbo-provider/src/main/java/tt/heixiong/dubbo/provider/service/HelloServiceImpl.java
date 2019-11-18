package tt.heixiong.dubbo.provider.service;

import org.apache.dubbo.config.annotation.Service;
import tt.heixiongtt.dubbo.dto.service.HelloService;

@Service
public class HelloServiceImpl implements HelloService {

    @Override
    public String sayHello(String name) {
        return "hello " + name;
    }
}
