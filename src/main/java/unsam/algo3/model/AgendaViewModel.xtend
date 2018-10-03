package unsam.algo3.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import unsam.algo3.contactos.domain.Agenda
import unsam.algo3.contactos.domain.Contacto

@Accessors
@Observable
class AgendaViewModel {

	Agenda agenda
	Contacto contactoSeleccionado
	Contacto nuevoContacto = new Contacto()
	
	String valorABuscar = ""
	String busquedaAplicada = ""

	new(Agenda agenda) {
		this.agenda = agenda
	}

	def agregarContacto() {
		agenda.agregarContacto(nuevoContacto)
		nuevoContacto = new Contacto()
	}

	def toggleFavorito() {
		contactoSeleccionado.toggleFavorito()
	}

	def buscar() {
		busquedaAplicada = valorABuscar
	}
	
	def getContactos() {
		if (busquedaAplicada == "") {
			agenda.contactos
		} else {
			agenda.getContactosByFiltro(busquedaAplicada)
 		}
	}
	
}
