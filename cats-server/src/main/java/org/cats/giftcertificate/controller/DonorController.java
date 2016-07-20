package org.cats.giftcertificate.controller;

import org.cats.giftcertificate.domain.Donor;
import org.cats.giftcertificate.service.DonorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "api/donors")
public class DonorController {

    @Autowired
    DonorService donorService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<Donor>> listDonors(){
        return new ResponseEntity<List<Donor>>(donorService.getDonors(), HttpStatus.OK);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Donor> getDonor(@PathVariable("id") Long id){
        return new ResponseEntity<Donor>(donorService.getDonor(id),HttpStatus.OK);
    }

    @RequestMapping(path = "/{id}/activate", method = RequestMethod.GET)
    public ResponseEntity<String> activateDonor(@PathVariable("id") Long id){
        donorService.activateDonor(id);
        return new ResponseEntity<String>("Donor " + id + " activated", HttpStatus.OK);
    }

    @RequestMapping(
            value = "/status/active", method = RequestMethod.GET)
    public ResponseEntity<List<Donor>> getActiveDonors(){
        return new ResponseEntity<List<Donor>>(donorService.getDonorsByStatus(Donor.DONOR_ACTIVE),HttpStatus.OK);
    }

    @RequestMapping(
            value = "/status/inactive", method = RequestMethod.GET)
    public ResponseEntity<List<Donor>> getInactiveDonors(){
        return new ResponseEntity<List<Donor>>(donorService.getDonorsByStatus(Donor.DONOR_INACTIVE),HttpStatus.OK);
    }

}
