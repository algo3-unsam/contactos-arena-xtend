package unsam.algo3.contactos.domain

import org.apache.commons.lang.StringUtils
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Contacto {
	
	String nombreApellido
	String email
	String telefono
	Boolean favorito = false
	
	def toggleFavorito() {
		favorito = !favorito
	}
	
	def matches(String valorBusqueda) {
		StringUtils.containsIgnoreCase(nombreApellido, valorBusqueda) ||
		StringUtils.containsIgnoreCase(email, valorBusqueda) ||
		StringUtils.equalsIgnoreCase(telefono, valorBusqueda)
	}
	
	@Dependencies("nombreApellido") 
	def getEsValido() {
		!StringUtils.isBlank(nombreApellido)
	}
	
}