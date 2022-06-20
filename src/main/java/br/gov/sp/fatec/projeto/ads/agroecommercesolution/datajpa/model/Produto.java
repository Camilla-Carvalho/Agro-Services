package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model;

import javax.persistence.*;

@Entity
@Table(name = "produto")
/**
 * Classe representação de um objeto P.O.J.O. (Plain Old Java Object)
 * fazendo um DE/PARA objetos como tabelas de BD, XML, JSON e modelos de dados 
 */
public class Produto {
	
	// RDBMS >> tabela > colunas e linhas
	// NO-SQL >> json, string, object, xml, ...
	
	public Produto() {}
	
	public Produto(Produto _produto) {
		this.setId(_produto.getId());
		this.nome = _produto.getNome();
		this.peso = _produto.getPeso();
		this.imagem = _produto.getImagem();
		this.preco = _produto.getPreco();
		this.descricao = _produto.getDescricao();
		this.tamanho = _produto.getTamanho();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name = "nome")
	private String nome;
	
	@Column(name = "peso")
	private String peso;
	
	@Column(name = "imagem")
	private String imagem;
	
	@Column(name = "preco")
	private double preco;

	@Column(name = "descricao")
	private String descricao;
	
	@Column(name = "tamanho")
	private String tamanho;
	
	/**
	 * @return the imagem
	 */
	public String getImagem() {
		return imagem;
	}

	/**
	 * @param imagem the imagem to set
	 */
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	/**
	 * @return the preco
	 */
	public double getPreco() {
		return preco;
	}

	/**
	 * @param preco the preco to set
	 */
	public void setPreco(double preco) {
		this.preco = preco;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the tamanho
	 */
	public String getTamanho() {
		return tamanho;
	}

	/**
	 * @param tamanho the tamanho to set
	 */
	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String toString() {
		return "Produto [id=" + id + ", nome=" + nome + "]";
	}

}
