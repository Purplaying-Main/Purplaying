package kr.co.purplaying;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentCompletedController {

    @RequestMapping(value="/paymentCompleted", method=RequestMethod.GET)
    public String paymentCompleted() {
      return "paymentCompleted";
    }

}
