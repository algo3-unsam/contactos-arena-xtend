package unsam.algo3.runnable

import org.uqbar.arena.Application
import unsam.algo3.contactos.domain.Agenda
import unsam.algo3.model.AgendaViewModel
import unsam.algo3.view.AgendaWindow

class AgendaApp extends Application {

	def static main(String[] args) {
		new AgendaWindow(new AgendaViewModel(new Agenda())).startApplication()
	}

	override protected createMainWindow() {}

}
