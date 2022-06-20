package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "usuario")
/**
 * Classe representação de um objeto P.O.J.O. (Plain Old Java Object)
 * fazendo um DE/PARA objetos como tabelas de BD, XML, JSON e modelos de dados 
 */
public class Usuario {
	
	// RDBMS >> tabela > colunas e linhas
	// NO-SQL >> json, string, object, xml, ...
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name = "nomecompleto")
	private String nome;

	@Column(name = "cpf")
	private String cpf;

	@Column(name = "datanascimento")
	private Date dataNascimento;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "senha")
	private String senha;

	@Column(name = "telefone")
	private String telefone;
	
	@Column(name = "endereco")
	private String endereco; // 1,8
	
	@Column(name = "isadmin")
	private boolean isAdmin;
	
	public Usuario() {}
	
	public Usuario(Usuario _usuario) {
		// id nome cpf dataNascimento email userLogin senha telefone endereco isAdmin
		this.id = _usuario.getId();
		this.nome = _usuario.getNome();
		this.cpf = _usuario.getCpf();
		this.dataNascimento = _usuario.getDataNascimento();
		this.email = _usuario.getEmail();
		this.senha = _usuario.getSenha();
		this.telefone = _usuario.getTelefone();
		this.endereco = _usuario.getEndereco();
		this.isAdmin = _usuario.getIsAdmin();
	}
	
	//@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	//@JoinColumn(name = "endereco_id")
	//private ArrayList<Endereco> endereco = new ArrayList<Endereco>();
	
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}
	
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
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

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public boolean getIsAdmin() {
		return this.isAdmin;
	}
	
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nome=" + nome + "]";
	}

}
