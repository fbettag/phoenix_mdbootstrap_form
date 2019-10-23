import 'bootstrap';

import bsCustomFileInput from 'bs-custom-file-input';
global.bsCustomFileInput = bsCustomFileInput;

import 'mdbootstrap';
import $ from 'jquery';

require('datatables.net');
require('datatables.net-bs');

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket";

window.jQuery = $;
window.$ = $;

$(document).ready(function() {
		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = $('form');
		// Loop over them and prevent submission
		var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
						if (form.checkValidity() === false) {
								event.preventDefault();
								event.stopPropagation();
						}
						form.classList.add('was-validated');
				}, false);
		});
		$('input[type=text], input[type=password], input[type=email], input[type=url], input[type=tel], input[type=number], input[type=search], input[type=date], input[type=time], textarea').each(function (element, i) {
				$(this).siblings('label').removeClass('active');

				var isValue = $(this).val().length > 0,
						isPlaceholder = typeof $(this).attr('placeholder') === String && $(this).attr('placeholder').length > 0;

				if (isValue || isPlaceholder) {
						$(this).siblings('label').addClass('active');
				}
		});
});
