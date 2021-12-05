package client;

//import com.springboot.api.model.ActionAndStatus;
//import com.springboot.api.model.Contact;
//import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.http.MediaType;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//public interface Client {
//
//    @FeignClient(value = "phonebook-api", url = "${endpoints.phonebook-api}")
//    public interface PhonebookClient {
//
//        @GetMapping(value = "/user/list",
//                produces = MediaType.APPLICATION_JSON_VALUE)
//        List<Contact> getAllUsers();
//
//        @PostMapping(value = "/user/add",
//                produces = MediaType.APPLICATION_JSON_VALUE)
//        ActionAndStatus postUser(@RequestBody ActionAndStatus userEntity);
//
//        @PutMapping(value = "/user/edit",
//                produces = MediaType.APPLICATION_JSON_VALUE)
//        ActionAndStatus editUser(@RequestBody ActionAndStatus userEntity);
//
//        @DeleteMapping(value = "/user/delete",
//                produces = MediaType.APPLICATION_JSON_VALUE)
//        ActionAndStatus deleteUser(@RequestBody ActionAndStatus userEntity);
//
//    }
//
//
//
//}
