package com.superstefo.api.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/health")
    public ResponseEntity<String> test() {
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        headers.add("stefko", "e-pitch");
        return ResponseEntity.ok().headers(new HttpHeaders(headers)).body("API is running");
    }
}
