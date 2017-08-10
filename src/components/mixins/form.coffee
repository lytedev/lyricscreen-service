export default {
	methods:
		ajaxForm: (form, options) ->
			formData = new FormData()
			for i in [0..form.length - 1]
				console.log form[i]
				formData.append form[i].name, form[i].value

			options.headers =
				'Accept': 'application/json'
				'Content-Type': 'application/json; charset=utf-8'

			console.log 'AJAXFORM()', form, options, formData

			request = new Request form.action, options

			if not options.method? then options.method = form.method.toUpperCase()

			return fetch form.action, options
}
