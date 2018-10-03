package unsam.algo3.view

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox

class FormContactosTemplate {
	
	new(Panel parentPanel, String nombrePropertyContacto) {
		crearFormulario(parentPanel, nombrePropertyContacto + ".")
	}
	
	new(Panel parentPanel) {
		crearFormulario(parentPanel, "")	
	}
	
	def crearFormulario(Panel parentPanel, String prefijo) {
		agregarTextBox(parentPanel, "Nombre y Apellido:", prefijo + "nombreApellido")
		agregarTextBox(parentPanel, "Teléfono:", prefijo + "telefono")
		agregarTextBox(parentPanel, "email:", prefijo + "email")
	}
	
	def void agregarTextBox(Panel panel, String label, String property) {

		val panelTextBox = new Panel(panel)

		new Label(panelTextBox) => [
			text = label
			width = 200
			alignLeft()
		]

		new TextBox(panelTextBox) => [
			bindValueToProperty(property) 
			width = 200
			alignLeft()
		]

	}
	
	
}