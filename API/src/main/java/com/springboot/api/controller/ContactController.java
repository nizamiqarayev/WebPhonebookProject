package com.springboot.api.controller;


import com.springboot.api.exception.ResourceNotFoundException;
import com.springboot.api.model.Contact;
import com.springboot.api.repository.ContactRepository;
import com.springboot.api.requestClasses.DeleteRequest;
import com.springboot.api.requestClasses.PostRequest;
import com.springboot.api.requestClasses.PutRequest;
import com.springboot.api.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
@CrossOrigin
public class ContactController {
    @Autowired
    private ContactService contactService;
    private ContactRepository contactRepository;
    public ContactController(ContactService contactService,ContactRepository contactRepository) {
        super();
        this.contactService = contactService;
        this.contactRepository = contactRepository;
    }
    @PostMapping("/user/add")
    public  String saveContact(@RequestBody Contact contact){
        contactService.saveContact(contact);
        return "New Student added";
    }
    @GetMapping("/user/list")
    public  List<Contact> getAllContacts(Model model){
        return contactService.getAllContacts();

    }
//    @GetMapping("/api/contact/byid")
//    public ResponseEntity<Contact>getContactByID(@PathVariable("id") long id){
//        return new ResponseEntity<Contact>(contactService.getContactById(id),HttpStatus.OK);
//    }
    @PutMapping ("/user/edit")
    public ResponseEntity<Contact>updateContact(@RequestBody PutRequest putcontact){
        return new ResponseEntity<Contact>(contactService.updateContact(putcontact),HttpStatus.OK);
    }
//    @DeleteMapping("/user/delete")
//    public ResponseEntity<String> deleteContact(@RequestBody DeleteRequest deleteRequest){
//        contactService.deleteContact(deleteRequest);
//        return new ResponseEntity<String>("Contact deleted successfully! ",HttpStatus.OK);
//    }
@DeleteMapping("/user/delete/{id}")
public ResponseEntity<String> deleteEmployee(@PathVariable("id") long id){

    // delete employee from DB
    contactService.deleteContact(id);

    return new ResponseEntity<String>("Employee deleted successfully!.", HttpStatus.OK);
}

}
