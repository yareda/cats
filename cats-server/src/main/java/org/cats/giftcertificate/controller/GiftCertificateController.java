package org.cats.giftcertificate.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "gc")
public class GiftCertificateController {

    @RequestMapping("**/version")
    public String version(){
        return "v1.0.0.-SNAPSHOT";
    }
}

