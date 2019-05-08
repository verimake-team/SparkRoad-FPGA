SECTIONS {
	.memory : {
		. = 0x0000004; /* due to TD v3.0.987 bug */
		*(.init);
		*(.text);
		*(*);
		. = ALIGN(4);
		end = .;
	}
}

