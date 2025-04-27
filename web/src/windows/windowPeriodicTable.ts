import './windowPeriodicTable.css'
import Element from "../models/element"
import Window from "../widget/window"
import WindowElement from './windowElement'

class WindowPeriodicTable extends Window {
	private div_periodic_table: HTMLDivElement

	constructor() {
		super("periodic_table", "Tabela Periódica")

		this.div_periodic_table = document.createElement("div")
		this.div_periodic_table.className = 'periodic-table'
		this.appendToContent(this.div_periodic_table)
	}

	protected Render(): void {
        Element.get_many()
            .then(data => this.generatePeriodicTable(data))
            .catch(console.error)
	}

	private generatePeriodicTable(elements:Element[]) {
		elements.forEach(element => {
			const element_container = this.generateElementContainer(element)
			this.div_periodic_table.appendChild(element_container)
		})
	}

	private generateElementContainer(element:Element) {
		const div_element = document.createElement('div')
		div_element.className = 'element'
		div_element.style.backgroundColor = element.color

		div_element.addEventListener('click', () => {
			const w = new WindowElement(element)
			w.Start()
		})

		div_element.style.gridColumn = element.xpos.toString()
		div_element.style.gridRow = element.ypos.toString()

		const p_symbol = document.createElement('p')
		p_symbol.textContent = element.symbol
		div_element.appendChild(p_symbol)

		return div_element
	}
}

export default WindowPeriodicTable