package unsam.algo3.view

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import unsam.algo3.contactos.domain.Contacto

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarContactoWindow extends TransactionalDialog<Contacto> {

	new(WindowOwner owner, Contacto model) {
		super(owner, model)
		title = "Editar Contacto"
	}

	override createFormPanel(Panel mainPanel) {
		new FormContactosTemplate(mainPanel)
	}

	override addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			enabled <=> "esValido"
			onClick [this.accept]
		]
	}

}
