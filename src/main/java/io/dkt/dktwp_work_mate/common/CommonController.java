package io.dkt.dktwp_work_mate.common;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class CommonController {

    @GetMapping("test")
    public String test() {
        return "test";
    }
}
