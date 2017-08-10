# demo using cde to package binary executable for hadoop streaming

[CDE](https://github.com/pgbovine/CDE) is a tool to package binary executable with all its dependencies to create a portable archive.

This is a demo to use CDE package as mapper and reducer in hadoop streaming.

## task

We use simple word count as demo. mapper.cpp reducer.cpp is the source code to do word count. sample.txt is an example input file.

In local machine, we can run the job as

```bash
cat sample.txt| ./mapper | ./reducer
```

## cde package generation

the step is in Makefile

Something to notice

1. cde-exec from CDE should be runnable on target machine
1. we use -archives option in hadoop to extract the archive, so ARCHIVE_SYMLINK path is added in *.cde script to be correct for hadoop exectutor

## hadoop streaming script

run_on_hadoop.sh

we use -archives option to extract cde archive and setup up symbol link