SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
cd
pushd src\usecases\
call "parse_all.bat"
pushd ..\..
SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
java -jar framework\ant\ant-launcher.jar -buildfile framework/build.xml
echo pause