export default {
	methods:
		ajaxForm: (form, options) ->
			formData = new FormData form
			console.log 'AJAXFORM()', form, options, formData
			for k, v in formData.entries()
				console.log 'FormData Entries', k, v
			# options.body = JSON.stringify formData.getAll()
			options.headers =
				'Content-Type': 'application/json; charset=utf-8'
			request = new Request form.action, options
			if not options.method? then options.method = form.method.toUpperCase()
			return fetch form.action, options
}
