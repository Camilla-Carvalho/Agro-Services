package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Servico;
import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository.ServicoRepository;

@RestController
@CrossOrigin(origins = "http://localhost:8080")
@RequestMapping("/api")
public class ServicoController {
	
	// BD >> CRUD 
	// create(insert) read(select) update delete
	
	@Autowired
	ServicoRepository servicoRepository;

	@GetMapping("/servico")
	public ResponseEntity<List<Servico>> getAllservicos(@RequestParam(required = false) String nome) {
		try {
			List<Servico> servicos = new ArrayList<Servico>();
			
			if (nome == null)
				servicoRepository.findAll().forEach(servicos::add);
			//else
				//servicoRepository.findByNome(nome).forEach(servicos::add);
			
			if (servicos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(servicos, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/servico/{id}")
	public ResponseEntity<Servico> getservicoById(@PathVariable("id") long id) {
		Optional<Servico> servicoData = servicoRepository.findById(id);

		if (servicoData.isPresent()) {
			return new ResponseEntity<>(servicoData.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
		
	@PostMapping("/servico")
	public ResponseEntity<Servico> createservico(@RequestBody Servico servico) {
		try {
			Servico _servico = servicoRepository
					.save(new Servico(servico));
			return new ResponseEntity<>(_servico, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("/servico/{id}")
	public ResponseEntity<HttpStatus> deleteservico(@PathVariable("id") long id) {
		try {
			servicoRepository.deleteById(id);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping("/servico/{id}")
	public ResponseEntity<Servico> updateservico(@PathVariable("id") long id, @RequestBody Servico servico) {
		Optional<Servico> servicoData = servicoRepository.findById(id);

		if (servicoData.isPresent()) {
			Servico _servico = servicoData.get();
			_servico.setNome(servico.getNome());
			
			return new ResponseEntity<>(servicoRepository.save(_servico), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/*
		@PostMapping("/servicos")
	public ResponseEntity<Servico> createservico(@RequestBody servico servico) {
		try {
			servico _servico = servicoRepository
					.save(new servico(servico.getNome()));
			return new ResponseEntity<>(_servico, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	

	

	@DeleteMapping("/servicos")
	public ResponseEntity<HttpStatus> deleteAllservicos() {
		try {
			servicoRepository.deleteAll();
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("/servicos/published")
	public ResponseEntity<List<Servico>> findByPublished() {
		try {
			List<Servico> servicos = servicoRepository.findByPublished(true);

			if (servicos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<>(servicos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	*/
}
