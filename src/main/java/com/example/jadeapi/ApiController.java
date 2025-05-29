package com.example.jadeapi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private JadeService jadeService;

    @PostMapping("/mensagem")
    public ResponseEntity<String> enviarMensagem(@RequestParam String agente, @RequestParam String texto) {
        jadeService.enviarMensagem(agente, texto);
        return ResponseEntity.ok("Mensagem enviada para o agente " + agente);
    }

    @PostMapping("/enviar")
    public ResponseEntity<String> enviar(@RequestBody Map<String, String> payload) {
        jadeService.enviarMensagem(payload.get("agente"), payload.get("mensagem"));
        return ResponseEntity.ok("Mensagem enviada.");
    }
}
