CXXFLAGS = -std=c++14 -O2
all: cde-package.tar.gz
mapper: mapper.cpp
reducer: reducer.cpp
# ARCHIVE_SYMLINK is where cde-package.tar.gz will be extracted into
cde-package.tar.gz: mapper reducer
	rm -rf cde-package
	echo | cde ./mapper
	echo | cde ./reducer
	echo "#!/bin/sh\n./ARCHIVE_SYMLINK/cde-package/cde-exec ${PWD}/mapper '$$@'\n" > cde-package/mapper.cde
	chmod +x cde-package/mapper.cde
	echo "#!/bin/sh\n./ARCHIVE_SYMLINK/cde-package/cde-exec ${PWD}/reducer '$$@'\n" > cde-package/reducer.cde
	chmod +x cde-package/reducer.cde
	cp cde-exec.build_for_target_machine ./cde-package/cde-exec
	tar czf cde-package.tar.gz cde-package
.PHONY: all
