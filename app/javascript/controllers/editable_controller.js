import {turndownService} from "../lib/turndown_service"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["selected"]
  static values = {
    convertType: String
  }

  connect() {
    // troublishoot why this is triggered multiple times
    if (this.element.querySelector(".editing-fragment-flag").checked) {
      let editableContet = this.element.querySelector(".editable-content")
      editableContet.setAttribute("contenteditable", "true")
      editableContet.focus()
      this.moveCursorToEnd(editableContet)
    }

  }
  
  saveAndAddFragment(event) {
    event.preventDefault()
    console.log("enter pressed")

    console.log(this.element.querySelector(".editable-content").textContent)

    this.disableEditing()
    this.updateForm()
    let submitButton = this.element.parentElement.querySelector(".enter-key-button")
    this.submitForm(submitButton)
  }

  // click(event) {
  //   this.enableEditing()
  // }

  // mouseDown(event){
  //   event.preventDefault();
  //   event.stopPropogation();

  // }


  blur(event) {
    console.log(this.element.querySelector(".editable-content").textContent)
    // this.disableEditing()
    // this.updateForm()
    // this.submitForm()
  }

  convertTo(event){
    let activeFragmemt = document.activeElement
    // console.log(activeFragmemt)
    activeFragmemt.parentElement.parentElement.querySelector(".fragment-element").value = this.convertTypeValue
    // activeFragmemt.parentElement.querySelector(".fragment-content").value = this.getMarkdown()
    // activeFragmemt.parentElement.querySelector("form").requestSubmit()
  }

  enableEditing() {
    let editableComponent = this.element.querySelector(".editable-content")
    editableComponent.setAttribute("contenteditable", "true")
    editableComponent.focus()  
  }

  disableEditing() {
    this.element.querySelector(".editable-content").removeAttribute("contenteditable")
  }

  updateForm(){
    this.element.parentElement.querySelector(".fragment-content").value = this.element.querySelector(".editable-content").textContent
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

  moveCursorToEnd(editableContet) {
    const range = document.createRange();
    const selection = window.getSelection();
    range.setStart(editableContet, editableContet.childNodes.length);
    range.collapse(true);
    selection.removeAllRanges();
    selection.addRange(range);
  };
}
