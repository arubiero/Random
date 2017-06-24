# #!/bin/bash
# 
# Script to perform writing IOPS tests on specific mountpoints
# 


MOUNTPOINT_INPUT=$1 #waits for a parameter in the mount point name. Defaults to 'home'
OUTPUTFILE=~/output.file
echo > $OUTPUTFILE
echo -e "\nTESTING `hostname`" >> $OUTPUTFILE

MOUNTPOINT=${MOUNTPOINT_INPUT:-'home'}

echo "Using \"$MOUNTPOINT\" as mountpoint parameter"

#Direct test (cache disabled)

for TEST_PATH in $(df |grep $MOUNTPOINT |awk '{ print $6 }'); do 
  echo $MOUNTPOINT $TEST_PATH

  TESTFILE=$TEST_PATH/test_file

  echo -e "\nVery Small writes on $TESTFILE" >> $OUTPUTFILE
  dd if=/dev/zero of=$TESTFILE bs=512 count=10000 oflag=direct |& tee -a $OUTPUTFILE
  rm -f $TESTFILE

  echo -e "\nSmall writes on $TESTFILE" >> $OUTPUTFILE
  dd if=/dev/zero of=$TESTFILE bs=4K count=10000 oflag=direct |& tee -a $OUTPUTFILE
  rm -f $TESTFILE
  
  echo -e "\nBig write on $TESTFILE" >> $OUTPUTFILE
  dd if=/dev/zero of=$TESTFILE bs=1G count=1 oflag=direct |& tee -a $OUTPUTFILE
  rm -f $TESTFILE

done
