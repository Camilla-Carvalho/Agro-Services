package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model;

import java.util.Date;

import javax.persistence.*;


@Entity  //CDI do JPA
@Table(name = "pedido")
/**
 * Classe representação de um objeto P.O.J.O. (Plain Old Java Object)
 * fazendo um DE/PARA objetos como tabelas de BD, XML, JSON e modelos de dados 
 */
public class Pedido {
	
	// RDBMS >> tabela > colunas e linhas
	// NO-SQL >> json, string, object, xml, ...
	
	public Pedido() {}
	
	public Pedido(Pedido _pedido) {
		this.setId(_pedido.getId());
		this.nome = _pedido.getNome();
		this.total = _pedido.getTotal();
		this.idUsuario = _pedido.getIdUsuario();
		this.formaPagamento = _pedido.getFormaPagamento();
		this.dataEntrega = _pedido.getDataEntrega();
		this.produtos = _pedido.getProdutos();
		this.servicos = _pedido.getServicos();
		
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name = "nome")
	private String nome;
	
	@Column(name = "total")
	private double total;

	@Column(name = "idUsuario")
	private int idUsuario;

	@Column(name = "formaPagamento")
	private String formaPagamento;

	@Column(name = "dataEntrega")
	private Date dataEntrega;
	
	@Column(name = "produtos")
	private String produtos;

	@Column(name = "servicos")
	private String servicos;
	
	
	/**
	 * @return the produtos
	 */
	public String getProdutos() {
		return produtos;
	}

	/**
	 * @param produtos the produtos to set
	 */
	public void setProdutos(String produtos) {
		this.produtos = produtos;
	}

	/**
	 * @return the servicos
	 */
	public String getServicos() {
		return servicos;
	}

	/**
	 * @param servicos the servicos to set
	 */
	public void setServicos(String servicos) {
		this.servicos = servicos;
	}

	/**
	 * @return the formaPagamento
	 */
	public String getFormaPagamento() {
		return formaPagamento;
	}

	/**
	 * @param formaPagamento the formaPagamento to set
	 */
	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	/**
	 * @return the dataEntrega
	 */
	public Date getDataEntrega() {
		return dataEntrega;
	}

	/**
	 * @param dataEntrega the dataEntrega to set
	 */
	public void setDataEntrega(Date dataEntrega) {
		this.dataEntrega = dataEntrega;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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
		return "Pedido [id=" + id + ", nome=" + nome + "]";
	}

}
