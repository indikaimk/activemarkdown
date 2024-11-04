import {turndownService} from "../lib/turndown_service"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["selected"]
  static values = {
    convertType: String
  }

  connect() {
    let isNew = this.element.parentElement.querySelector(".new-fragment-flag").checked
    if (isNew == 1) {
      this.enableEditing()

    }
  }
  
  saveAndAddFragment(event) {
    event.preventDefault()
    this.disableEditing()
    this.updateForm()
    let submitButton = this.element.parentElement.querySelector(".enter-key-button")
    this.submitForm(submitButton)
  }

  click(event) {
    this.enableEditing()
  }

  mouseDown(event){
    event.preventDefault();
    event.stopPropogation();

  }


  blur(event) {
    this.disableEditing()
    this.updateForm()
    this.submitForm()
  }

  convertTo(event){
    let activeFragmemt = document.activeElement
    console.log(activeFragmemt)
    activeFragmemt.parentElement.querySelector(".fragment-element").value = this.convertTypeValue
    // activeFragmemt.parentElement.querySelector(".fragment-content").value = this.getMarkdown()
    // activeFragmemt.parentElement.querySelector("form").requestSubmit()
  }

  enableEditing() {
    let editableComponent = this.element //.querySelector("p")
    editableComponent.setAttribute("contenteditable", "true")
    editableComponent.focus()  
  }

  disableEditing() {
    this.element.removeAttribute("contenteditable")
  }

  updateForm(){
    this.element.parentElement.querySelector(".fragment-content").value = this.getMarkdown()
  }

  getMarkdown(){
    // return turndownService().turndown(this.element.querySelector(".fragment-markdown"))
    return turndownService().turndown(this.element)
  }

  submitForm(submitButton) {
    if (submitButton) {
      this.element.parentElement.querySelector("form").requestSubmit(submitButton)
    } else {
      this.element.parentElement.querySelector("form").requestSubmit()
    }
  }
}
