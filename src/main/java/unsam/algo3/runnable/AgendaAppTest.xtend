package unsam.algo3.runnable

import org.uqbar.arena.Application
import unsam.algo3.contactos.bootstrap.Bootstrap
import unsam.algo3.model.AgendaViewModel
import unsam.algo3.view.AgendaWindow

class AgendaAppTest extends Application {

	def static main(String[] args) {
		new AgendaWindow(new AgendaViewModel(Bootstrap.getAgenda())).startApplication()
	}

	override protected createMainWindow() {}

}
