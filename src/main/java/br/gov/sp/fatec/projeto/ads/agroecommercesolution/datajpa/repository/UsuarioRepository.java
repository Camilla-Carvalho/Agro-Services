package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
	//List<Usuario> findByNome(String nome);
	//List<Usuario> findByEmail(String email);
}
