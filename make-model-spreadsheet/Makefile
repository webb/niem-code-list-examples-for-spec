
all_files = \
	vma.table.xml \
	vmo.table.xml \
	vma-vmo.table.xml \
	make-model.csv.in-sqlite \
	vma.csv \
	vmo.csv \
	vma-vmo.csv \


.PHONY: default
default: ${all_files}

.PHONY: clean
clean:
	${RM} vma.csv vmo.csv vma-vmo.csv
	${RM} vma.table.xml vmo.table.xml vma-vmo.table.xml
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
