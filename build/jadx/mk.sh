./gradlew dist
find ./* | grep -v 'mk.sh' | grep -v './build' | xargs -I xxx rm -rf xxx
find ./* | grep '.zip' | xargs -I xxx rm -rf xxx
mv ./build/jadx/* ./
