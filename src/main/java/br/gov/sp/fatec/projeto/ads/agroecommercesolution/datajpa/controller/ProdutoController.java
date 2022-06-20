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

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Produto;
import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository.ProdutoRepository;

@RestController
@CrossOrigin(origins = "http://localhost:8080")
@RequestMapping("/api")
public class ProdutoController {
	
	// BD >> CRUD 
	// create(insert) read(select) update delete
	
	@Autowired
	ProdutoRepository produtoRepository;

	@GetMapping("/produto")
	public ResponseEntity<List<Produto>> getAllprodutos(@RequestParam(required = false) String nome) {
		try {
			List<Produto> produtos = new ArrayList<Produto>();
			
			if (nome == null)
				produtoRepository.findAll().forEach(produtos::add);
			//else
				//produtoRepository.findByNome(nome).forEach(produtos::add);
			
			if (produtos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(produtos, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/produto/{id}")
	public ResponseEntity<Produto> getprodutoById(@PathVariable("id") long id) {
		Optional<Produto> produtoData = produtoRepository.findById(id);

		if (produtoData.isPresent()) {
			return new ResponseEntity<>(produtoData.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
		
	@PostMapping("/produto")
	public ResponseEntity<Produto> createproduto(@RequestBody Produto produto) {
		try {
			Produto _produto = produtoRepository
					.save(new Produto(produto));
			return new ResponseEntity<>(_produto, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("/produto/{id}")
	public ResponseEntity<HttpStatus> deleteproduto(@PathVariable("id") long id) {
		try {
			produtoRepository.deleteById(id);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping("/produto/{id}")
	public ResponseEntity<Produto> updateproduto(@PathVariable("id") long id, @RequestBody Produto produto) {
		Optional<Produto> produtoData = produtoRepository.findById(id);

		if (produtoData.isPresent()) {
			Produto _produto = produtoData.get();
			_produto.setNome(produto.getNome());
			
			return new ResponseEntity<>(produtoRepository.save(_produto), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/*
		@PostMapping("/produtos")
	public ResponseEntity<Produto> createproduto(@RequestBody produto produto) {
		try {
			produto _produto = produtoRepository
					.save(new produto(produto.getNome()));
			return new ResponseEntity<>(_produto, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	

	

	@DeleteMapping("/produtos")
	public ResponseEntity<HttpStatus> deleteAllprodutos() {
		try {
			produtoRepository.deleteAll();
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("/produtos/published")
	public ResponseEntity<List<Produto>> findByPublished() {
		try {
			List<Produto> produtos = produtoRepository.findByPublished(true);

			if (produtos.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<>(produtos, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	*/
}
