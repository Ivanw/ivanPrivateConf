#!/bin/bash
# If u have a new c++ lib, copy the lib to cpp_src_x.x and copy this command to cpp_src_x.x directory
# >> cp -rf /usr/include/c++/4.8 ~/.vim/tagfiles/cpp_src_4.8
# >> ./genModifiedHeader.sh
# >> mv tags /to/your/tag/path

# STL code using lots of macro defination like _GLIBCXX_BEGIN_NAMESPACE instead of namespace.
# So ctags would get the wrong syntax of CPP in result the OmniCppComplete won't work.
# This shell would not affect the compiler, just modified your own copy of the lib code.

if [ $# -eq 0 ];then
    dir=.
else
    dir=$1
fi
#Substitute scripts
tmp=`mktemp`
echo $tmp
cat > $tmp <<- EOF
s/\b_GLIBCXX_BEGIN_NAMESPACE_VERSION//g
s/\b_GLIBCXX_BEGIN_NAMESPACE_ALGO//g
s/_GLIBCXX_BEGIN_NAMESPACE_LDBL//g
s/_GLIBCXX_NAMESPACE_LDBL/ /g
s/_GLIBCXX_VISIBILITY(default)/ /g
s/\b_GLIBCXX_BEGIN_NAMESPACE_CONTAINER//g
s/_GLIBCXX_BEGIN_NESTED_NAMESPACE\s*\(\s*std\s*,\s*_GLIBCXX_STD_[DP]\s*\)/namespace std{/g
s/\b_GLIBCXX_END_NAMESPACE_VERSION\b//g
s/\b_GLIBCXX_END_NAMESPACE_CONTAINER\b//g
s/_GLIBCXX_END_NAMESPACE_ALGO//g
s/_GLIBCXX_END_NAMESPACE_LDBL//g
s/\b_GLIBCXX_END_(NESTED_\?NAMESPACE\b/}/g
EOF
count=0
cols=`tput cols`
cols=`echo "$cols - 8"|bc`
for file in `find $dir -type f`;do
    if [ "T"$file != "T"$0 ];then
        sed -i -f $tmp $file
        count=`echo "$count+1"|bc`
        echo -ne "="
        if [ `echo "$count%$cols"|bc` -eq 0 ];then
            echo " $count"
        fi
    fi
done
echo "Processed $count files!"
rm -fr $tmp
# Generate ctag file

ctags -R --sort=1 --c++-kinds=+p --fields=+ialS --extra=+q --language-force=c++ .
echo "generated tag file!"
