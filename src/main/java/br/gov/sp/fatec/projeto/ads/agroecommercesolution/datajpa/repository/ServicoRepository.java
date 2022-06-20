package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Servico;

public interface ServicoRepository extends JpaRepository<Servico, Long> {
//List<Servico> findByNome(String nome);
	//List<Servico> findByEmail(String email);
}
