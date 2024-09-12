package com.springboot.api.controller;
import com.springboot.api.model.Contact;
import com.springboot.api.requestClasses.PutRequest;
import com.springboot.api.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@RequestMapping("/")
public class ContactController {
    @Autowired
    private ContactService contactService;
    public ContactController(ContactService contactService) {
        super();
        this.contactService = contactService;
    }
    @PostMapping("/user/add")
    public  String saveContact(@RequestBody tempContact tempcontact){
        Contact contact=new Contact(tempcontact.getFirstName(), tempcontact.getLastName(), tempcontact.getNumber());
        contactService.saveContact(contact);
        return "New Student added";
    }
    @GetMapping("/user/list")
    public  List<Contact> getAllContacts(Model model){
        return contactService.getAllContacts();

    }
    @PutMapping ("/user/edit")
    public ResponseEntity<Contact>updateContact(@RequestBody PutRequest putcontact){
        return new ResponseEntity<Contact>(contactService.updateContact(putcontact),HttpStatus.OK);
    }
@DeleteMapping("/user/delete/{id}")
public ResponseEntity<String> deleteEmployee(@PathVariable("id") long id){
    contactService.deleteContact(id);
    return new ResponseEntity<String>("Employee deleted successfully!.", HttpStatus.OK);
}

}
class tempContact {

    private String firstName;
    private String lastName;
    private long number;
    public tempContact(String firstName, String lastName, long number){
        this.firstName=firstName;
        this.lastName=lastName;
        this.number=number;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }
}


