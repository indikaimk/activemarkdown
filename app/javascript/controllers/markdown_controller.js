import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    formatType: String
  }
  connect() {
    // …
  }

  mouseDown(event){
    event.preventDefault();
  }

  formatSelection(event){
    event.preventDefault();
    let activeFragmemt = document.activeElement;
    activeFragmemt.parentElement.querySelector(".fragment-content").value = activeFragmemt.textContent;
    activeFragmemt.parentElement.querySelector(".fragment-inline-format").value = this.formatTypeValue;
    activeFragmemt.parentElement.querySelector(".caret-start").value = 5 //get the cursor start
    activeFragmemt.parentElement.querySelector(".caret-end").value = 10
    activeFragmemt.parentElement.querySelector(".editing-fragment-flag").checked = true;
    activeFragmemt.parentElement.querySelector(".editing-override-fragment-flag").checked = true;

    activeFragmemt.parentElement.querySelector("form").requestSubmit();


  }

}