
csv_files = ${wildcard *.csv}
csv_to_xml_files = ${csv_files:%=tmp/csv-to-xml/%.xml}

all_files = $(csv_to_xml_files) \
	tmp/csv-to-simple-type/HazmatTitle49Code.xml \
	HazmatTitle49Code.gc

tokens = \
	cl-valid-against-enum \
	no-cl-valid-against-enum \
	cl-valid-against-generic \
	no-cl-invalid-against-generic \

valid_tokens = ${tokens:%=tmp/tokens/%}

default: all ${valid_tokens}

all: ${all_files}

tmp/csv-fixed/%.csv: %.csv
	mkdir -p ${dir $@}
	tr $$'\r' $$'\n' < $< > $@

tmp/csv-to-xml/%.csv.xml: tmp/csv-fixed/%.csv
	mkdir -p ${dir $@}
	awk -f ${HOME}/share/csv-tools/csv-to-xml.awk $< > $@

tmp/csv-to-simple-type/%.xml: tmp/csv-to-xml/%.csv.xml csv-to-simple-type.xsl
	mkdir -p ${dir $@}
	saxon --xsl=csv-to-simple-type.xsl --in=$< --out=$@

%.gc: tmp/csv-to-xml/%.csv.xml csv-to-gc.xsl
	saxon --xsl=csv-to-gc.xsl --in=$< --out=$@

#############################################################################
# validations

tmp/tokens/cl-valid-against-enum: instance-cl.xml
	xsdvalid -catalog xml-catalog-enum.xml $<
	@ mkdir -p ${dir $@}
	@ touch $@

tmp/tokens/no-cl-valid-against-enum: instance-no-cl.xml
	xsdvalid -catalog xml-catalog-enum.xml $<
	@ mkdir -p ${dir $@}
	@ touch $@

tmp/tokens/cl-valid-against-generic: instance-cl.xml
	xsdvalid -catalog xml-catalog-generic.xml $<
	@ mkdir -p ${dir $@}
	@ touch $@

tmp/tokens/no-cl-invalid-against-generic: instance-no-cl.xml
	! xsdvalid -catalog xml-catalog-generic.xml $<
	@ mkdir -p ${dir $@}
	@ touch $@

#############################################################################
# clean

clean:
	${RM} -r tmp

zip:
	mkdir -p 2015-09-02-ntac-code-lists
	cp \
HazmatTitle49Code.gc \
instance-cl.xml \
instance-no-cl.xml \
ns1-enum.xsd \
ns1-generic.xsd \
xml-catalog-enum.xml \
xml-catalog-generic-gc.xml \
xml-catalog-generic.xml \
2015-09-02-ntac-code-lists
	cp ${HOME}/r/topic/genericode/syntax/genericode-syntax.html 2015-09-02-ntac-code-lists
	zip -9 -r 2015-09-02-ntac-code-lists.zip 2015-09-02-ntac-code-lists
