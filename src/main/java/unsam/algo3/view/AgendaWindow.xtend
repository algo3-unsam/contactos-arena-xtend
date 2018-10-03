package unsam.algo3.view

import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow
import org.uqbar.commons.model.utils.ObservableUtils
import unsam.algo3.contactos.domain.Contacto
import unsam.algo3.model.AgendaViewModel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AgendaWindow extends MainWindow<AgendaViewModel> {

	new(AgendaViewModel agendaVM) {
		super(agendaVM)
		title = "Agenda"
	}
	
	override createContents(Panel mainPanel) {
		mainPanel.layout = new HorizontalLayout
		crearPanelListaContactos(mainPanel)
		crearPanelNuevoContacto(mainPanel)
	}

	private def crearPanelListaContactos(Panel panel) {

		val panelListaContacto = new Panel(panel)

		crearPanelBuscador(panelListaContacto)

		new Table<Contacto>(panelListaContacto, typeof(Contacto)) => [

			items <=> "contactos"
			value <=> "contactoSeleccionado"
			numberVisibleRows = 5

			new Column<Contacto>(it) => [
				title = "Nombre y apellido"
				bindContentsToProperty("nombreApellido")
				fixedSize = 200
			]

			new Column<Contacto>(it) => [
				title = "Favorito"
				bindContentsToProperty("favorito").transformer = [fav|if(fav) "SI" else "NO"]
				fixedSize = 100
			]

		]

		crearBotoneraTabla(panelListaContacto)
	}

	private def crearBotoneraTabla(Panel panel) {

		val botonera = new Panel(panel)
		botonera.layout = new HorizontalLayout()

		new Button(botonera) => [
			caption = "Favorito"
			bindEnabled(new NotNullObservable("contactoSeleccionado"))
			onClick [modelObject.toggleFavorito()]
		]

		new Button(botonera) => [
			caption = "Editar"
			bindEnabled(new NotNullObservable("contactoSeleccionado"))
			onClick [irAEditar()]
		]

	}
	
	def void crearPanelBuscador(Panel panel) {

		val panelBuscador = new Panel(panel)
		panelBuscador.layout = new HorizontalLayout

		new TextBox(panelBuscador) => [
			value <=> "valorABuscar"
			width = 250
		]

		new Button(panelBuscador) => [
			caption = "Buscar"
			onClick [
				modelObject.buscar
				refreshContactos()
			]
		]

	}

	private def void crearPanelNuevoContacto(Panel panel) {

		val panelNuevoContacto = new GroupPanel(panel)
		panelNuevoContacto.title = "Nuevo Contacto"
		
		new FormContactosTemplate(panelNuevoContacto, "nuevoContacto")
		
		new Button(panelNuevoContacto) => [
			caption = "Agregar"
			enabled <=> "nuevoContacto.esValido"
			onClick[
				modelObject.agregarContacto()
				refreshContactos()
			]
		]

	}
	
	private def irAEditar() {
		new EditarContactoWindow(this, modelObject.contactoSeleccionado).open()
	}

	private def refreshContactos() {
		ObservableUtils.firePropertyChanged(modelObject, "contactos")
	}
		
}
