package bsuir.msa.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/blog")
public class BlogController {

    @GetMapping("/hostname")
    public ResponseEntity<Map<String, String>> getHostname() {
        Map<String, String> response = new HashMap<>();
        try {
            // имя хоста контейнера
            String hostname = InetAddress.getLocalHost().getHostName();
            response.put("hostname", hostname);
            response.put("message", "Ответ от контейнера: " + hostname);
        } catch (UnknownHostException e) {
            response.put("hostname", "unknown");
            response.put("error", e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    // обычный эндпойнт (заглушка)
    @GetMapping("/posts")
    public ResponseEntity<String> getAllPosts() {
        return ResponseEntity.ok("Список постов блога (заглушка)");
    }
}