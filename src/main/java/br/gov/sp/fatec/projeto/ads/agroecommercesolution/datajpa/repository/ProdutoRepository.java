package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.repository;

//import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {
	//List<Produto> findByNome(String nome);
	//List<Produto> findByEmail(String email);
}
