
names = vma vmo vma-vmo

all_files = \
	${names:%=%.gc} \
	make-model.csv.in-sqlite \

.PHONY: default
default: ${all_files}

.PHONY: clean
clean:
	${RM} ${names:%=%.csv} ${names:%=%.table.xml} ${names:%=%.gc}
	${RM} ${wildcard *~}

make-model.csv.in-sqlite: make-model.csv
	./to-sqlite-input-csv $< > $@

vma.csv: manual.csv to-vma.sq3
	sqlite3 < to-vma.sq3

vmo.csv: manual.csv to-vmo.sq3
	sqlite3 < to-vmo.sq3

vma-vmo.csv: manual.csv to-vma.sq3
	sqlite3 < to-vma-vmo.sq3

%.table.xml: %.csv
	csv-to-xml -o $@ $<

%.gc: %.csv %.gch
	csv-to-gc -o $@ $*.csv $*.gch
