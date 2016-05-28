apt-get install -y openjdk-7-jdk
./gradlew build fatJar
mkdir ./out
mv ./build/libs/*.jar ./out
mv ./scripts ./out
find ./* | grep -v -P '(mk.sh|./out)' | xargs -Ixxx rm -rf xxx
find ./out/* | xargs -Ixxx touch xxx
mv ./out/* ./
rm -rf ./out
