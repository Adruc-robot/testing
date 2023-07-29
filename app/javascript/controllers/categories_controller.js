import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["listSelect"]
  change(event) {
    let listId = event.target.selectedOptions[0].value
    let target = this.listSelectTarget.id

    get(`/lists/listEntries?list_id=${listId}&target=${target}`, {
      responseKind: "turbo-stream"
    })
  }
}
