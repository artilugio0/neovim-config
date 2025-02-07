local libfmt = require('lib.fmt')

pcall(libfmt.set_format_program, 'tf', 'terraform', {'fmt', '-'})
