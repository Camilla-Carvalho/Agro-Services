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

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Usuario;
import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository.UsuarioRepository;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api")
public class UsuarioController {
	
	// BD >> CRUD 
	// create(insert) read(select) update delete
	
	@Autowired
	UsuarioRepository usuarioRepository;

	@GetMapping("/usuario")
	public ResponseEntity<List<Usuario>> getAllusuarios(@RequestParam(required = false) String nome) {
		try {
			List<Usuario> usuarios = new ArrayList<Usuario>();
			
			if (nome == null)
				usuarioRepository.findAll().forEach(usuarios::add);
			//else
			//	usuarioRepository.findByNome(nome).forEach(usuarios::add);

			if (usuarios.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(usuarios, HttpStatus.OK);

		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/usuarios/{id}")
	public ResponseEntity<Usuario> getusuarioById(@PathVariable("id") long id) {
		Optional<Usuario> usuarioData = usuarioRepository.findById(id);

		if (usuarioData.isPresent()) {
			return new ResponseEntity<>(usuarioData.get(), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/*@GetMapping("/usuarios/{email}")
	public ResponseEntity<Usuario> getUsuarioByEmail(@PathVariable("email") String email) {
		List<Usuario> usuarioData = usuarioRepository.findByEmail(email);
		
		if (usuarioData != null) {
			return new ResponseEntity<>(usuarioData.get(0), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}*/
	
	@PostMapping("/usuario")
	public ResponseEntity<Usuario> createusuario(@RequestBody Usuario usuario) {
		try {
			Usuario _usuario = usuarioRepository
					.save(new Usuario(usuario));
			return new ResponseEntity<>(_usuario, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("/usuarios/{id}")
	public ResponseEntity<HttpStatus> deleteusuario(@PathVariable("id") long id) {
		try {
			usuarioRepository.deleteById(id);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping("/usuarios/{id}")
	public ResponseEntity<Usuario> updateusuario(@PathVariable("id") long id, @RequestBody Usuario usuario) {
		Optional<Usuario> usuarioData = usuarioRepository.findById(id);

		if (usuarioData.isPresent()) {
			Usuario _usuario = usuarioData.get();
			_usuario.setNome(usuario.getNome());
			_usuario.setCpf(usuario.getCpf());
			_usuario.setDataNascimento(usuario.getDataNascimento());
			_usuario.setEmail(usuario.getEmail());
			_usuario.setEndereco(usuario.getEndereco());
			_usuario.setIsAdmin(usuario.getIsAdmin());
			_usuario.setTelefone(usuario.getTelefone());
			_usuario.setSenha(usuario.getSenha());
			
			return new ResponseEntity<>(usuarioRepository.save(_usuario), HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/*
		@PostMapping("/usuarios")
	public ResponseEntity<Usuario> createusuario(@RequestBody usuario usuario) {
		try {
			usuario _usuario = usuarioRepository
					.save(new usuario(usuario.getNome()));
			return new ResponseEntity<>(_usuario, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	

	

	@DeleteMapping("/usuarios")
	public ResponseEntity<HttpStatus> deleteAllusuarios() {
		try {
			usuarioRepository.deleteAll();
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("/usuarios/published")
	public ResponseEntity<List<Usuario>> findByPublished() {
		try {
			List<Usuario> usuarios = usuarioRepository.findByPublished(true);

			if (usuarios.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<>(usuarios, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	*/
}
