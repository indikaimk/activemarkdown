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

    let selection = document.getSelection();
    // console.log(selection);

    let activeFragmemt = selection.focusNode.parentElement.parentElement;
    console.log(selection.focusNode.parentElement.innerHTML)
    activeFragmemt.querySelector(".fragment-content").value = selection.focusNode.parentElement.innerHTML;
    activeFragmemt.querySelector(".fragment-inline-format").value = this.formatTypeValue;
    activeFragmemt.querySelector(".caret-start").value = selection.anchorOffset; //get the cursor start
    activeFragmemt.querySelector(".caret-end").value = selection.focusOffset;
    activeFragmemt.querySelector(".editing-fragment-flag").checked = true;
    activeFragmemt.querySelector(".editing-override-fragment-flag").checked = true;

    activeFragmemt.parentElement.querySelector("form").requestSubmit();


  }

}