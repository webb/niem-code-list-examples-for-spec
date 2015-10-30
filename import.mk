
SHELL = /bin/bash -o pipefail -o nounset -o errexit

MKDIR_P = /opt/local/libexec/gnubin/mkdir -p
INSTALL = /opt/local/libexec/gnubin/install -c
SED = /usr/bin/sed
AWK = @AWK@

spec_dir=/Users/wr/r/niem/code-lists/spec/dest
spec_files= \
	code-lists-instance.xsd \
	code-lists-schema-appinfo.xsd \
	xml-catalog.xml \
	xml-catalog-appinfo.xml 
local_spec_dir=from-spec

xsd_dir=/Users/wr/r/topic/schemas/xml-schema
xsd_files=${shell cd ${xsd_dir} && find . -type f ! -path '*/.git/*' ! -name '*~' | ${SED} -e 's/..//' }
local_xsd_dir=schema-xsd

xml_dir=/Users/wr/r/topic/schemas/xml
xml_files=${shell cd ${xml_dir} && find . -type f ! -path '*/.git/*' ! -name '*~' | ${SED} -e 's/..//' }
local_xml_dir=schema-xml

#HELP:Configured with:
#HELP:  spec_dir=/Users/wr/r/niem/code-lists/spec/dest : Provides the directory of the specification distribution

all_files = \
	${spec_files:%=${local_spec_dir}/%} \
	${xsd_files:%=${local_xsd_dir}/%} \
	${xml_files:%=${local_xml_dir}/%} \

.PHONY: default
default: all

.PHONY: all # Build the usual suspects
all: ${all_files}

.PHONY: help # Print this help
help:
	@ grep '#HELP'':' Makefile | sed -e 's/.*#HELP''://'
	@ echo Available targets:
	@ ${SED} -e 's/^.PHONY: *\([^ #]*\) *\# *\(.*\)$$/  \1: \2/p;d' Makefile

.PHONY: clean # Remove products of make
clean:
	${RM} -r ${local_xsd_dir}
	${RM} -r ${local_xml_dir}
	${RM} -r ${local_spec_dir}

${local_spec_dir}/%: ${spec_dir}/%
	${MKDIR_P} ${dir $@}
	${INSTALL} -m 644 $< $@

${local_xsd_dir}/%: ${xsd_dir}/%
	${MKDIR_P} ${dir $@}
	${INSTALL} -m 644 $< $@

${local_xml_dir}/%: ${xml_dir}/%
	${MKDIR_P} ${dir $@}
	${INSTALL} -m 644 $< $@

