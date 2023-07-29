import { Controller } from "@hotwired/stimulus"

//import jquery from "jquery"
import DataTable from "datatables.net-bs5"

export default class extends Controller {
  connect() { 
    console.log(this.element)
    new DataTable(this.element)
  }
}
