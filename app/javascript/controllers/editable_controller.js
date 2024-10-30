import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }
  
  keydown(event) {
    // if (event.keyCode == 13) {
    //   event.preventDefault()
    //   this.element.removeAttribute("contenteditable")
    // }
    event.preventDefault()
    this.element.removeAttribute("contenteditable")

  }

  click(event) {
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }
}
