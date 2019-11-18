package tt.heixiong.dubbo.consumer.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import tt.heixiong.dubbo.consumer.service.ConsumerService;

@RestController
public class HelloCtrl {

    @Autowired
    private ConsumerService consumerService;

    @GetMapping("hello")
    public String sayHello(String name) {
        return consumerService.sayHello(name);
    }
}
