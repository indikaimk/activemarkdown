import {turndownService} from "../lib/turndown_service"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["selected"]
  static values = {
    convertType: String
  }

  connect() {
    // troublishoot why this is triggered multiple times
    console.log("connecting")
    // setTimeout(() => {
    //   console.log("After timeout")
    // }, 500)
    if (this.element.querySelector(".editing-fragment-flag").checked) {
      let editableContet = this.element.querySelector(".editable-content")
      editableContet.setAttribute("contenteditable", "true")
      editableContet.focus()
      this.moveCursorToEnd(editableContet)
    }

  }
  
  saveAndAddFragment(event) {
    event.preventDefault();
    console.log("enter pressed");

    console.log(this.element.querySelector(".editable-content").textContent);
    // let newElement = document.createElement('form');
    // newElement.setAttribute("id", "message_1");
    // newElement.textContent = 'This is the new element.';
    // newElement.innerHTML = 'This is the new element.';
    // this.element.after(newElement)
    // this.element.parentElement.parentElement.insertBefore(newElement, this.element.parentElement.nextSibling);
    // this.element.parentElement.parentElement.appendChild(newElement)

    let newFragmentForm = document.getElementById('new-fragment-form');
    // let newFragmentForm = this.element.querySelector('.new-fragment-form')
    newFragmentForm.querySelector('.new-fragment-content').value = ""; //todo: with correct text if entered in middle of the text
    newFragmentForm.querySelector('.proceeding-fragment-id').value = this.element.querySelector('.fragment-id').value;
    let submitButton = newFragmentForm.querySelector('.enter-key-button')
    newFragmentForm.requestSubmit(submitButton);
    // this.disableEditing();

    // this.element.querySelector(".fragment-content").value = this.element.querySelector(".editable-content").textContent;
    // this.element.querySelector(".editing-fragment-flag").value = false;
    
    // let submitButton = this.element.parentElement.querySelector(".enter-key-button");
    // this.submitForm(submitButton);
  }

  click(event) {
    this.enableEditing()
  }

  mouseDown(event){
    event.preventDefault();
    // event.stopPropogation();

  }


  // blur(event) {

  //   console.log("blur from editable")
  //   // this.disableEditing()
  //   // this.updateForm()
  //   // this.submitForm()
  // }

  convertTo(event){
    event.preventDefault()
    let activeFragmemt = document.activeElement
    console.log("converting")
    console.log(activeFragmemt)
    activeFragmemt.parentElement.querySelector(".fragment-content").value = activeFragmemt.textContent
    activeFragmemt.parentElement.querySelector(".fragment-element").value = this.convertTypeValue
    // activeFragmemt.parentElement.querySelector(".fragment-content").value = this.getMarkdown()
    activeFragmemt.parentElement.querySelector("form").requestSubmit()
  }

  enableEditing() { 
    let editableContet = this.element.querySelector(".editable-content")
    editableContet.setAttribute("contenteditable", "true")
    editableContet.focus()
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
