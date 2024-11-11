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
    console.log("formatSelection starts...");
    event.preventDefault();

    let selection = document.getSelection();

    // let activeFragmemt = selection.focusNode.parentElement.parentElement;
    let activeFragmemt = this.findFragmentElement(selection.focusNode)
    if (selection.focusNode.parentElement.tagName != "P") {
      selection.focusNode.parentElement.classList.add("selected")
    }
    console.log(selection.focusNode.parentElement.tagName)
    
    activeFragmemt.querySelector(".fragment-content").value = activeFragmemt.querySelector(".editable-content").innerHTML; //selection.focusNode.parentElement.innerHTML;
    activeFragmemt.querySelector(".fragment-inline-format").value = this.formatTypeValue;
    activeFragmemt.querySelector(".caret-start").value = selection.anchorOffset; //get the cursor start
    activeFragmemt.querySelector(".caret-end").value = selection.focusOffset;
    activeFragmemt.querySelector(".editing-fragment-flag").checked = true;
    activeFragmemt.querySelector(".editing-override-fragment-flag").checked = true;

    activeFragmemt.parentElement.querySelector("form").requestSubmit();
    console.log("formatSelection form submitted...");


  }

  findFragmentElement(el){
    // console.log("findFragmentElement starts...")
    // console.log(el)
    while (el.parentElement) {
      // console.log(el)
      el = el.parentElement
      // console.log(el.tagName)

      if (el.tagName == "DIV"){
        return el
      }
    }
    // console.log("findFragmentElement ends...")

    return null

  }

}