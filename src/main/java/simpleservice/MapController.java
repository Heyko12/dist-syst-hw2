package simpleservice;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class MapController {
    private final Map<String, String> store = new HashMap<>();

    @PostMapping("/put")
    public ResponseEntity<String> put(@RequestParam String key, @RequestParam String value) {
        store.put(key, value);
        return ResponseEntity.ok("Value saved");
    }

    @GetMapping("/get")
    public ResponseEntity<String> get(@RequestParam String key) {
        String value = store.get(key);
        return value != null ? ResponseEntity.ok(value) : ResponseEntity.notFound().build();
    }
}