
remote_subset_files = ${shell find ../niem-subset -type f}
local_subset_files = ${remote_subset_files:../niem-subset/%=niem-subset/%}

instance_files = ${wildcard sample-instance/*.xml}
xs_valid_tokens = ${instance_files:%=tmp/xs-valid/%}

all_files = ${local_subset_files} \
	code-lists-schema-appinfo.xsd \
	gc/vma.gc \
	gc/vmo.gc \
	gc/vma-vmo.gc \
	${xs_valid_tokens} \


default: ${all_files}

niem-subset/%: ../niem-subset/%
	mkdir -p ${dir $@}
	cp $< $@

gc/%.gc: ../make-model-spreadsheet/%.gc
	mkdir -p ${dir $@}
	cp $< $@	

code-lists-schema-appinfo.xsd: ../from-spec/code-lists-schema-appinfo.xsd
	mkdir -p ${dir $@}
	cp $< $@

clean:
	${RM} -r niem-subset gc

tmp/xs-valid/sample-instance/instance1.xml: sample-instance/instance1.xml extension.xsd xml-catalog.xml ${local_subset_files}
	xs-validate --catalog=xml-catalog.xml $<
	mkdir -p ${dir $@}
	touch $@






