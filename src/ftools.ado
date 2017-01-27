*! version 2.4.0 25jan2017
* This file is just used to compile ftools.mlib

program define ftools
	syntax, [*]

	if ("`options'" == "") loc options "check"

	if inlist("`options'", "check", "compile") {
		if ("`options'"=="compile") loc force "force"
		ms_get_version ftools // from moresyntax package; save local package_version
		// maybe just add all fns...
		loc functions Factor*() factor*() _factor*() join_factors() ///
					  __fload_data() __fstore_data() ftools*() __factor*() ///
					  init_bipartite_zigzag() bin_order() assert_msg() ///
					  compute_core_numbers()
		ms_compile_mata, package(ftools) version(`package_version') `force' fun(`functions') verbose // debug
	}
	else {
		di as error "Wrong option for ftools: `options'"
		assert 123
	}
end
