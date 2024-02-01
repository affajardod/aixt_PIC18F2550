// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando Martínez Santa
// Date: 2023-2024
// License: MIT
module aixt_cgen

// init_output_file initializes the output file stream.
fn (mut gen Gen) init_output_file() {
	gen.out += '// This '
    gen.out += match gen.setup.value('backend').string() {
		'nxc' 		{ 'NXC ' }
		'arduino'	{ 'Arduino ' }  
		else 		{ 'C ' }
	}
    gen.out += 'code was automatically generated by Aixt Project\n'
	gen.out += '// Device = ${gen.setup.value('device').string()}\n'
	gen.out += '// Board = ${gen.setup.value('board').string()}\n'
	gen.out += '// Backend = ${gen.setup.value('backend').string()}\n\n'
    for m in gen.setup.value('macros').array() { 			// append the macros
        gen.out += if m.string() != '' { '#define ${m.string()}\n' } else { '' }
	}
    gen.out += '\n'
    for c in gen.setup.value('configuration').array() {		// append the configuration lines
        gen.out += '${gen.setup.value('config_operator').string()} ${c.string()}\n'    
	}
	gen.out += '\n___includes_block___\n' 
    for h in gen.setup.value('headers').array() {			// append the header files
        gen.incls +=  if h.string() != '' { '#include <${h.string()}>\n' } else { '' }
	}
	api_path := '${gen.tr_path}/ports/${gen.setup.value('path').string()}/api'
    gen.incls += if gen.setup.value('backend').string() != 'nxc'{
		'#include "${api_path}/builtin.c"\n'
	} else {
		''
	}
	gen.out += '\n___definitions_block___\n' 
}