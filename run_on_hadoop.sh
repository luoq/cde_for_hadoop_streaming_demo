#!/bin/bash

# setup HADOOP_HOME and hadoop streaming jar
# HADOOP_HOME=XXXXX
# hadoop_streaming_jar=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-X.Y.Zjar

# d is where cde-package.tar.gz is extracted 
$HADOOP_HOME/bin/hadoop jar $hadoop_streaming_jar \
  -archives cde-package.tar.gz#ARCHIVE_SYMLINK \
  -Dmapred.job.name="hadoop_streaming_test" \
  -Dmapred.reduce.tasks=1 \
  -Dmapred.task.timeout=600000000 \
  -Dmapred.job.queue.name=recsys \
  -input luoq/hadoop_streaming_test/input \
  -output luoq/hadoop_streaming_test/output \
  -mapper ./ARCHIVE_SYMLINK/cde-package/mapper.cde \
  -reducer ./ARCHIVE_SYMLINK/cde-package/reducer.cde