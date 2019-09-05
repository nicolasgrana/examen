package ar.com.santander.tecnologia.examen.model;

public class Customer {
	
	
	private Integer id;
	private String nombre;
	
	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	public Customer(Integer id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}

}
