// app/javascript/controllers/comments_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comment"] // Define un target para identificar el comentario

  delete(event) {
    event.preventDefault() // Previene el comportamiento predeterminado del enlace
    const url = this.element.dataset.commentsUrl // Obtiene la URL del endpoint desde el data-attribute
    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "application/json",
      },
    })
      .then((response) => {
        if (response.ok) {
          this.element.classList.add("comment-removing") // Agrega la clase para el efecto
          setTimeout(() => this.element.remove(), 300) // Espera que termine la animación
        } else {
          
          console.error("Error al eliminar el comentario")
        }
      })
      .catch((error) => console.error("Error:", error))
  }
}
