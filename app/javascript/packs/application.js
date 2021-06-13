// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).on('turbolinks:load', function () {
    scroll_bottom()
    // click_send()
    // submit_message()
})

// function click_send() {
//     $("#send-m").on('click', function (e) {
//         e.target.value = ""
//     })
// }

// function submit_message() {
//     $('#input-message').on('keydown', function (e) {
//         if (e.keyCode == 13) {
//             $('button').click()
//             e.target.value = ""
//         }
//     })
// }


function scroll_bottom() {
    $("#message-container1").scrollTop($("#message-container1")[0].scrollHeight);

}
