/dts-v1/;

/ {
	description = KERNEL_NAME;
	#address-cells = <1>;

	images {
		kernel@0 {
			description = KERNEL_NAME;
			data = /incbin/(VMLINUX_BINARY);
			type = "kernel";
			arch = "mips";
			os = "linux";
			compression = VMLINUX_COMPRESSION;
			load = <VMLINUX_LOAD_ADDRESS>;
			entry = <VMLINUX_ENTRY_ADDRESS>;
			hash@0 {
				algo = "sha1";
			};
		};

		fdt@ci40 {
			description = "img,pistachio-marduk (Ci40) Device Tree";
			data = /incbin/("boot/dts/img/pistachio_marduk.dtb");
			type = "flat_dt";
			arch = "mips";
			compression = "none";
			hash@0 {
				algo = "sha1";
			};
		};
	};

	configurations {
		default = "conf@ci40";

		conf@ci40 {
			description = "Creator Ci40 Linux kernel";
			kernel = "kernel@0";
			fdt = "fdt@ci40";
		};
	};
};
