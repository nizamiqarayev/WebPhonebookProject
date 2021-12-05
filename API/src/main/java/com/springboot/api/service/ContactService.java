package com.springboot.api.service;

import com.springboot.api.model.Contact;
import com.springboot.api.requestClasses.DeleteRequest;
import com.springboot.api.requestClasses.PutRequest;

import java.util.List;

public interface ContactService {
    Contact saveContact(Contact contact);
    List<Contact> getAllContacts();
    Contact getContactById(long id);
    Contact updateContact(PutRequest putRequest);
    void deleteContact(long id);
}
