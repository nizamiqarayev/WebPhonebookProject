package com.springboot.api.model;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import com.springboot.api.controller.ContactController;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ContactTest {
    String testFirstName="TestFirstName";
    String testLastName="TestLastName";
    long testNumber =333322221;
    @Test
    void getId() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Long testId= testContact.getId();
        Assertions.assertNotNull(testId);

    }
    @Test
    void setId() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        testContact.setId(12);
        Assertions.assertEquals(12,testContact.getId());
    }

    @Test
    void getFirstName() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertSame(testFirstName,testContact.getFirstName());
    }

    @Test
    void setFirstName() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertSame(testFirstName,testContact.getFirstName());
    }

    @Test
    void getLastName() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertSame(testLastName,testContact.getLastName());
    }

    @Test
    void setLastName() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertSame(testLastName,testContact.getLastName());
    }

    @Test
    void getNumber() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertEquals(testNumber,testContact.getNumber());
    }

    @Test
    void setNumber() {
        Contact testContact=new Contact();
        testContact.setFirstName(testFirstName);testContact.setLastName(testLastName);
        testContact.setNumber(testNumber);
        Assertions.assertEquals(testNumber,testContact.getNumber());
    }
}