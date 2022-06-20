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

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Pedido;
import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository.PedidoRepository;

@RestController
@CrossOrigin(origins = "http://localhost:8080")
@RequestMapping("/api")
public class PedidoController {
	
	// BD >> CRUD 
	// create(insert) read(select) update delete
	
	@Autowired
	PedidoRepository pedidoRepository;

	@GetMapping("/pedido")
	public ResponseEntity<List<Pedido>> getAllpedidos(@RequestParam(required = false) String nome) {
		try {
			List<Pedido> pedidos = new ArrayList<Pedido>();
			
			if (nome == null)
				pedidoRepository.findAll().forEach(pedidos::add);
			//else
				//pedidoRepository.findByNome(nome).forEach(pedidos::add);
			
			if (pedidos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(pedidos, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/pedido/{id}")
	public ResponseEntity<Pedido> getpedidoById(@PathVariable("id") long id) {
		Optional<Pedido> pedidoData = pedidoRepository.findById(id);

		if (pedidoData.isPresent()) {
			return new ResponseEntity<>(pedidoData.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
		
	@PostMapping("/pedido")
	public ResponseEntity<Pedido> createpedido(@RequestBody Pedido pedido) {
		try {
			Pedido _pedido = pedidoRepository
					.save(new Pedido(pedido));
			return new ResponseEntity<>(_pedido, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("/pedido/{id}")
	public ResponseEntity<HttpStatus> deletepedido(@PathVariable("id") long id) {
		try {
			pedidoRepository.deleteById(id);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping("/pedido/{id}")
	public ResponseEntity<Pedido> updatepedido(@PathVariable("id") long id, @RequestBody Pedido pedido) {
		Optional<Pedido> pedidoData = pedidoRepository.findById(id);

		if (pedidoData.isPresent()) {
			Pedido _pedido = pedidoData.get();
			_pedido.setNome(pedido.getNome());
			
			return new ResponseEntity<>(pedidoRepository.save(_pedido), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/*
		@PostMapping("/pedidos")
	public ResponseEntity<Pedido> createpedido(@RequestBody pedido pedido) {
		try {
			pedido _pedido = pedidoRepository
					.save(new pedido(pedido.getNome()));
			return new ResponseEntity<>(_pedido, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	

	

	@DeleteMapping("/pedidos")
	public ResponseEntity<HttpStatus> deleteAllpedidos() {
		try {
			pedidoRepository.deleteAll();
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("/pedidos/published")
	public ResponseEntity<List<Pedido>> findByPublished() {
		try {
			List<Pedido> pedidos = pedidoRepository.findByPublished(true);

			if (pedidos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<>(pedidos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	*/
}
