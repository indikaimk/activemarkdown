import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "changeMenu" ]

  // toggleChangeMenu() {
  //   this.changeMenutarget.innerHTML = `test`
  // }

  blur(event){
    setTimeout(() => {
      console.log("After timeout")
    }, 500)
    console.log("Blurred")
    // console.log(event)
    // console.log(this.element.textContent)
    // this.element.querySelector(".editable-content").removeAttribute("contenteditable")
    this.element.parentElement.querySelector(".fragment-content").value = this.element.textContent;
    this.element.parentElement.querySelector(".editing-fragment-flag").checked = false;
    this.element.parentElement.querySelector("form").requestSubmit();
  }

  mouseDown(event){
    console.log("mouse down")
    rangy.getSelection().removeAllRanges();
  }


  mouseUp(event){
    // get the current selection from window
    let selection = rangy.getSelection()

    // we can return early when the selection is collapsed
    if (selection.isCollapsed) { return }

    // Trim whitespace from the selection
    selection.trim()
    console.log(selection)

    // show format selection menu
    // show_format_selection_menu(this.element)
  }

  focus(){
    console.log("element focus")
  } 

  // changeFragmentMenu() {
  //   return(`
  //     <li>
  //       <a href="" data-controller="fragment" data-action="click->fragment#convertTo" data-fragment-element="p" >Text</a>
  //     </li>
  //     <li>
  //       <a href="" data-controller="fragment" data-action="click->fragment#convertTo" data-fragment-element="h1">Heading 1</a>
  //     </li>
  //     <li>
  //       <a href="" data-controller="fragment" data-action="click->fragment#convertTo" data-fragment-element="h2">Heading 2</a>
  //     </li>
  //     <li>
  //       <a href="" data-controller="fragment" data-action="click->fragment#convertTo" data-fragment-element="h3">Heading 3</a>
  //     </li>
  //   `)
  // }
}