import {turndownService} from "../lib/turndown_service"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let isNew = this.element.querySelector(".new-fragment-flag").checked
    console.log(isNew)

    if (isNew == 1) {
      console.log(isNew)
      let editableComponent = this.element.querySelector(".fragment-markdown p")
      editableComponent.setAttribute("contenteditable", "true")
      editableComponent.focus()      
    }
  }
  
  saveAndAddFragment(event) {
    // if (event.keyCode == 13) {
    //   event.preventDefault()
    //   this.element.removeAttribute("contenteditable")
    // }
    event.preventDefault()
    this.element.removeAttribute("contenteditable")

    let markdown = turndownService().turndown(this.element)
    this.element.querySelector(".fragment-content").value = markdown

    let submitButton = this.element.querySelector(".enter-key-button")
    this.element.querySelector("form").requestSubmit(submitButton)

  }

  click(event) {
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }

  // blur(event) {
  //   this.element.removeAttribute("contenteditable")
  //   let markdown = turndownService().turndown(this.element)
  //   this.element.querySelector(".fragment-content").value = markdown
  //   this.element.querySelector("form").requestSubmit()
  // }



}
