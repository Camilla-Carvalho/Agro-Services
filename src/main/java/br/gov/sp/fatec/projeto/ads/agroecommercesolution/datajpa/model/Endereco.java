package br.gov.sp.fatec.projeto.ads.agroecommercesolution.datajpa.model;

import javax.persistence.*;

//@Entity(name = "Endereco")
//@Table(name = "endereco")
public class Endereco {
 
    @Id
    @GeneratedValue
    private Long id;
 
    private String cep;
    private String rua;
    private String cidade;
    private String bairro;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario usuario;
     
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Endereco )) return false;
        return id != null && id.equals(((Endereco) o).getId());
    }
    
    //Constructors, getters and setters removed for brevity

    public Long getId() {
		return id;
	}
    
	@Override
    public int hashCode() {
        return getClass().hashCode();
    }

	/**
	 * @return the cep
	 */
	public String getCep() {
		return cep;
	}

	/**
	 * @param cep the cep to set
	 */
	public void setCep(String cep) {
		this.cep = cep;
	}

	/**
	 * @return the rua
	 */
	public String getRua() {
		return rua;
	}

	/**
	 * @param rua the rua to set
	 */
	public void setRua(String rua) {
		this.rua = rua;
	}

	/**
	 * @return the cidade
	 */
	public String getCidade() {
		return cidade;
	}

	/**
	 * @param cidade the cidade to set
	 */
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	/**
	 * @return the bairro
	 */
	public String getBairro() {
		return bairro;
	}

	/**
	 * @param bairro the bairro to set
	 */
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
}

