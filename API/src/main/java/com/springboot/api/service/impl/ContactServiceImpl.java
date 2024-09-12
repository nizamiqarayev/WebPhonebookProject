package com.springboot.api.service.impl;
import com.springboot.api.exception.ResourceNotFoundException;
import com.springboot.api.model.Contact;
import com.springboot.api.repository.ContactRepository;
import com.springboot.api.requestClasses.PutRequest;
import com.springboot.api.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactRepository contactRepository;


    public ContactServiceImpl(ContactRepository contactRepository) {
        super();
        this.contactRepository = contactRepository;
    }

    @Override
    public Contact saveContact(Contact contact) {
        return contactRepository.save(contact);
    }

    @Override
    public List<Contact> getAllContacts() {
        return contactRepository.findAll();
    }

    @Override
    public Contact getContactById(long id) {
        Optional<Contact> contact = contactRepository.findById(id);
        if (contact.isPresent()) {
            return contact.get();
        } else {
            throw new ResourceNotFoundException("Contact", "Id", id);
        }
    }

    @Override
    public Contact updateContact(PutRequest putRequest) {
        Contact existingContact = contactRepository.findById(putRequest.getId()).orElseThrow(() ->
                new ResourceNotFoundException("Contact", "Id", putRequest.getId()));
        existingContact.setFirstName(putRequest.getFirstName());
        existingContact.setLastName(putRequest.getLastName());
        existingContact.setNumber(putRequest.getNumber());
        contactRepository.save(existingContact);

        return existingContact;
    }

    @Override
    public void deleteContact(long id) {

        // check whether a employee exist in a DB or not
        if (contactRepository.findById(id).isPresent()) {
            contactRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("Employee", "Id", id);

        }
    }
}
