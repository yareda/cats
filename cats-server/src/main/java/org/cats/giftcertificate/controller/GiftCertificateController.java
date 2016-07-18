package org.cats.giftcertificate.controller;

import org.cats.giftcertificate.domain.GiftCertificate;
import org.cats.giftcertificate.service.GiftCertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "api/gift-certificate")
public class GiftCertificateController {

    @Autowired
    GiftCertificateService giftCertificateService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<GiftCertificate>> listGiftCertificates(){
        return new ResponseEntity<List<GiftCertificate>>(giftCertificateService.getGiftCertificates(),HttpStatus.OK);
    }

    @RequestMapping(
            value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<GiftCertificate> getGiftCertificate(@PathVariable("id") Long id){
        return new ResponseEntity<GiftCertificate>(giftCertificateService.getGiftCertificate(id),HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<GiftCertificate>  create(@RequestBody GiftCertificate resource){
        return new ResponseEntity<GiftCertificate>(giftCertificateService.create(resource),HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}/approve", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public Long approveGiftCertificate(@PathVariable("id") Long id){
        return giftCertificateService.approve(id);
    }


}

