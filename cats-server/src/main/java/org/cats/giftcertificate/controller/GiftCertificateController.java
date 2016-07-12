package org.cats.giftcertificate.controller;

import org.cats.giftcertificate.domain.GiftCertificate;
import org.cats.giftcertificate.service.GiftCertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "giftcertificate")
public class GiftCertificateController {

    @Autowired
    GiftCertificateService giftCertificateService;

    @RequestMapping(value = "**/", method = RequestMethod.GET)
    public List<GiftCertificate> listGiftCertificates(){
        return giftCertificateService.getGiftCertificates();
    }

    @RequestMapping(value = "**/{status}", method = RequestMethod.GET)
    public List<GiftCertificate> listGiftCertificatesByStatus(@RequestParam(required = true) String status){
        return giftCertificateService.getGiftCertificatesByStatus(status);
    }

    @RequestMapping(value = "**/{id}", method = RequestMethod.GET)
    public GiftCertificate getGiftCertificate(@RequestParam(required = true) Long id){
        return giftCertificateService.getGiftCertificate(id);
    }




}

