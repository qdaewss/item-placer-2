echo "-------------------------------"
echo "------------BUILDING-----------"
echo "-------------------------------"
mkdir -p buildAllJars
y=3

for i in $(seq 5); do
    #sh gradlew clean -Pindex="$y"
    if [[ $y > 6 ]]; then
        export JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-21.0.6.7-hotspot"
    else
        export JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-17.0.14.7-hotspot"
    fi

    #export PATH=%JAVA_HOME%\bin;%PATH%
    echo "Using JAVA_HOME=$JAVA_HOME"

    ./gradlew build modrinth -Pindex="$y" || { echo "Build failed at $i"; exit 1; }

    ((y=y+1))
done

echo "-------------------------------"
echo "--------------DONE-------------"
echo "-------------------------------"
