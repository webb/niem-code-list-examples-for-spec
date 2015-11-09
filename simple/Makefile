
all_files = \
	make-model.gc \
	make-model.doc-table.xml \
	vma.csv \

gen_files = ${all_files} \
	make-model.table.xml \
	make-model.csv.txt \
	code-lists-instance.xsd \

schema_files = \
	code-lists-instance.xsd \
	extension-run-time.xsd \
	extension-schema-time.xsd \

valid_tokens = \
	tmp/xsd-valid/instance-run-time.xml \
	tmp/xsd-valid/instance-schema-time.xml \
	${schema_files:%=tmp/xsd-valid/%} \

.PHONY: default
default: all

.PHONY: all
all: ${all_files} ${valid_tokens}

make-model.csv.txt: make-model.csv
	tr $$'\r' $$'\n' < $< > $@

make-model.table.xml: make-model.csv.txt
	csv-to-xml -o $@ $<

make-model.doc-table.xml: make-model.table.xml table-to-doc-table.xsl
	saxon --xsl=table-to-doc-table.xsl --in=$< --out=$@

make-model.gc : make-model.csv.txt make-model.gch.xml
	csv-to-gc --output-file=$@ $< make-model.gch.xml

vma.csv: to-vma.sq3 make-model.csv 
	sqlite3 < $<

.PHONY: clean
clean:
	${RM} ${gen_files} ${wildcard *~}
	${RM} -r tmp

.PHONY: valid
valid: ${valid_tokens}

tmp/xsd-valid/instance-run-time.xml: instance-run-time.xml xml-catalog-run-time.xml code-lists-instance.xsd
	xs-validate --catalog=xml-catalog-run-time.xml $<
	@ mkdir -p ${dir $@}
	touch $@

tmp/xsd-valid/instance-schema-time.xml: instance-schema-time.xml xml-catalog-schema-time.xml code-lists-instance.xsd
	xs-validate --catalog=xml-catalog-schema-time.xml $<
	@ mkdir -p ${dir $@}
	touch $@


tmp/xsd-valid/%.xsd: %.xsd
	xs-validate --catalog=xml-catalog-appinfo.xml $<
	mkdir -p ${dir $@}
	touch $@

code-lists-instance.xsd: ../from-spec/code-lists-instance.xsd
	mkdir -p ${dir $@}
	cp $< $@



