package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {
//List<Pedido> findByNome(String nome);
	//List<Pedido> findByEmail(String email);
}
