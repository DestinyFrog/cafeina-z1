import { generateRandomString, Vec2 } from "../util"
import './window.css'

class Window {
	private static windows: (Window|null)[] = []

	public readonly tag: string
	protected readonly window_index: number
	public readonly id : string
	private div_window : HTMLDivElement

	protected div_header : HTMLDivElement
	private p_title : HTMLParagraphElement
	private but_close : HTMLButtonElement

	protected div_content : HTMLDivElement
	protected div_footer: HTMLDivElement

	private drag_position: Vec2 = { x: 0, y: 0 }
	private before_drag_position: Vec2 = { x: 0, y: 0 }
	private startPosition : Vec2 = { x: 10, y: 10 }

	constructor(tag:string, title?:string) {
		this.id = generateRandomString()
		this.tag = tag

		this.div_window = document.createElement("div")
		this.div_window.className = 'app'

		//? HEADER
		this.div_header = document.createElement("div")
		this.div_header.className = 'app-header'
		this.div_window.appendChild(this.div_header)

			this.p_title = document.createElement("p")
			this.p_title.className = 'title'
			this.div_header.appendChild(this.p_title)

			this.but_close = document.createElement("button")
			this.but_close.className = 'button-close'
			this.but_close.addEventListener('click', () => {
				this.Close()
			})
			this.div_header.appendChild(this.but_close)

		//? CONTENT
		this.div_content = document.createElement("div")
		this.div_content.className = 'app-content'
		this.div_window.appendChild(this.div_content)

		//? FOOTER
		this.div_footer = document.createElement("div")
		this.div_footer.className = 'app-footer'
		this.div_window.appendChild(this.div_footer)

		this.position = this.startPosition

		this.title = title || ""
		
		this.window_index = Window.windows.push(this) - 1
	}

	protected on_move() {}
	protected on_drop() {}

	public set position(pos:Vec2) {
		this.div_window.style.left = `${pos.x}px`
		this.div_window.style.top = `${pos.y}px`
	}

	public get position() {
		return {
			x: this.div_window.getBoundingClientRect().x,
			y: this.div_window.getBoundingClientRect().y
		}
	}

	public set title(name:string) {
		this.p_title.textContent = name
	}

	public get size() {
		return {
			x: this.div_window.getBoundingClientRect().width,
			y: this.div_window.getBoundingClientRect().height
		}
	}

	public static filter_by_tag(tag:string[]) {
		return this.windows.filter( (window) => {
			if (window) return tag.includes(window.tag)
			return false
		} )
	}

	public Start() {
		this.DragAndDropSystem()

		const app = document.getElementById("app")!
		app.appendChild(this.div_window)

		this.Render()
	}

	public Close() {
		this.Destroy()
		this.div_window.remove()
		Window.windows[this.window_index] = null
	}

	protected Render() {}
	protected Destroy() {}

	protected appendToContent(element:HTMLElement) {
		this.div_content.appendChild(element)
	}

	protected appendToFooter(element:HTMLElement) {
		this.div_footer.appendChild(element)
	}

	DragAndDropSystem() {
		this.drag_position = {x:0, y:0} 
		this.before_drag_position = {x:0, y:0}

		this.div_header.addEventListener('mousedown', ev => {
			this.before_drag_position.x = ev.clientX
			this.before_drag_position.y = ev.clientY

			const mouseMove = (ev:MouseEvent) => {
				this.on_move()

				if (ev.clientX > 0 && ev.clientX < document.body.clientWidth) {
					this.drag_position.x = this.before_drag_position.x - ev.clientX
					this.before_drag_position.x = ev.clientX
					this.div_window.style.left = `${this.div_window.offsetLeft - this.drag_position.x}px`	
				}
				
				if (ev.clientY > 0 && ev.clientY < document.body.clientHeight) {
					this.drag_position.y = this.before_drag_position.y - ev.clientY
					this.before_drag_position.y = ev.clientY
					this.div_window.style.top = `${this.div_window.offsetTop - this.drag_position.y}px`
				}
			}

			document.addEventListener('mousemove', mouseMove)
			document.addEventListener('mouseup', _ => {
				this.on_drop()
				document.removeEventListener('mousemove', mouseMove)
			})
		})

		this.div_header.addEventListener('touchstart', ev => {
			this.before_drag_position.x = ev.touches[0].clientX
			this.before_drag_position.y = ev.touches[0].clientY

			const mouseMove = (ev:TouchEvent) => {
				this.on_move()

				this.drag_position.x = this.before_drag_position.x - ev.touches[0].clientX
				this.drag_position.y = this.before_drag_position.y - ev.touches[0].clientY
	
				this.before_drag_position.x = ev.touches.item(0)?.clientX!
				this.before_drag_position.y = ev.touches[0].clientY

				this.div_window.style.top = `${this.div_window.offsetTop - this.drag_position.y}px`
				this.div_window.style.left = `${this.div_window.offsetLeft - this.drag_position.x}px`
			}

			document.addEventListener('touchmove', mouseMove)
			document.addEventListener('touchend', _ => {
				this.on_drop()
				document.removeEventListener('touchmove', mouseMove)
			})
		})
	}
}

export default Window